----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Alessandro Salvato
-- 
-- Create Date:    17:17:22 10/19/2017 
-- Design Name: 
-- Module Name:    Execute_Stage - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.1 - Making up
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Execute_Stage is
	generic(NBIT_DATA 	: integer := 32;
	        NBIT_ALUOP 	: integer := 5
--	        NBIT_PC 	: integer := 32;
--	        NBIT_IR 	: integer := 32
	        );
	port(
		EX_clk 		: in  std_logic;
		EX_reset 		: in  std_logic;
		EX_enable		: in  std_logic;
--		EX_IR		: in  std_logic_vector(NBIT_IR-1 downto 0);
--		EX_PC		: in  std_logic_vector(NBIT_PC-1 downto 0);
		EX_OpA		: in  std_logic_vector(NBIT_DATA-1 downto 0);
		EX_OpB		: in  std_logic_vector(NBIT_DATA-1 downto 0);
		EX_OpAEnable	: in  std_logic;
		EX_OpBEnable	: in  std_logic;
		EX_AluEnable	: in  std_logic;
		EX_MulEnable	: in  std_logic;
		EX_AluOp		: in  std_logic_vector(NBIT_ALUOP-1 downto 0);
		EX_ShiftOp	: in  std_logic_vector(2 downto 0);
--		EX_ShiftAmount	: in  std_logic_vector(5 downto 0);
		EX_sel_mux_out	: in  std_logic_vector(1 downto 0);
		
		EX_data_out	: out std_logic_vector(NBIT_DATA-1 downto 0);
--		EX_PC		: out std_logic_vector(NBIT_PC-1 downto 0);
--		EX_IR		: out std_logic_vector(NBIT_IR-1 downto 0);
		EX_PSW		: out std_logic_vector(4 downto 0);
		EX_AluOutBack	: out std_logic_vector(NBIT_DATA-1 downto 0)
	);
end Execute_Stage;

architecture Structural of Execute_Stage is

	component Enable_Interface is
	generic(NBIT_DATA : integer := 32);
	port(
		EI_datain	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		EI_enable	: in  std_logic;
		EI_dataout: out std_logic_vector(NBIT_DATA-1 downto 0) 
	);
	end component;
	
	component BOOTHMUL is
	generic (N : integer := 32);
	port (A, B : in std_logic_vector(N-1 downto 0);
	      P : out std_logic_vector((2*N)-1 downto 0)
	);
	end component;
	
	component NRegister is
	generic(N: integer:= 32);
	port(
		clk:	in  std_logic;
		reset:	in  std_logic; --Active high
		data_in:	in  std_logic_vector(N-1 downto 0);
		enable:	in  std_logic;
		load:	in  std_logic; --Load enable high
		data_out: out std_logic_vector(N-1 downto 0));
	end component;
	
	signal s_OpA_Fei_Talu, s_OpB_Fei_Talu	: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_OpA_Fei_Tmul, s_OpB_Fei_Tmul	: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_product_Fmul_Thiloregs	: std_logic_vector(NBIT_DATA*2-1 downto 0);
	signal s_opA_ALU_enable,s_opB_ALU_enable: std_logic;
	signal s_opA_mul_enable,s_opB_mul_enable: std_logic;
	signal s_product_Flo_Tmux		: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_product_Fhi_Tmux		: std_logic_vector(NBIT_DATA-1 downto 0);

begin
--------------------------------------------------------------------------------------------------------------
	s_opA_ALU_enable <= EX_OpAEnable AND EX_AluEnable AND EX_enable;
	s_opB_ALU_enable <= EX_OpBEnable AND EX_AluEnable AND EX_enable;
	
	s_opA_mul_enable <= EX_OpAEnable AND EX_MulEnable AND EX_enable;
	s_opB_mul_enable <= EX_OpBEnable AND EX_MulEnable AND EX_enable;
	
	
	
	EI_OpA_Alu : Enable_Interface GENERIC MAP (NBIT_DATA => NBIT_DATA) PORT MAP (
								EI_datain => EX_OpA,
								EI_enable => s_opA_ALU_enable,
								EI_dataout => s_OpA_Fei_Talu
								);
	EI_OpB_Alu : Enable_Interface GENERIC MAP (NBIT_DATA => NBIT_DATA) PORT MAP (
								EI_datain => EX_OpB,
								EI_enable => s_opB_ALU_enable,
								EI_dataout => s_OpB_Fei_Talu
								);
	EI_OpA_Mul : Enable_Interface GENERIC MAP (NBIT_DATA => NBIT_DATA) PORT MAP (
								EI_datain => EX_OpA,
								EI_enable => s_opA_mul_enable,
								EI_dataout => s_OpA_Fei_Tmul
								);
	EI_OpB_Mul : Enable_Interface GENERIC MAP (NBIT_DATA => NBIT_DATA) PORT MAP (
								EI_datain => EX_OpB,
								EI_enable => s_opB_mul_enable,
								EI_dataout => s_OpB_Fei_Tmul
								);
--------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------
	MUL : BOOTHMUL GENERIC MAP (N => NBIT_DATA) PORT MAP (
							A => s_OpA_Fei_Tmul,
							B => s_OpB_Fei_Tmul,
							P => s_product_Fmul_Thiloregs
						    );
--------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------
	LO : NRegister GENERIC MAP (N => NBIT_DATA) PORT MAP (
						clk => EX_clk,
						reset => EX_reset,
						enable => EX_MulEnable,
						load => '1',
						data_in => s_product_Fmul_Thiloregs(NBIT_DATA-1 downto 0),
						data_out => s_product_Flo_Tmux
						);
	
	HI : NRegister GENERIC MAP (N => NBIT_DATA) PORT MAP (
						clk => EX_clk,
						reset => EX_reset,
						enable => EX_MulEnable,
						load => '1',
						data_in => s_product_Fmul_Thiloregs(NBIT_DATA*2-1 downto NBIT_DATA),
						data_out => s_product_Fhi_Tmux
						);
--------------------------------------------------------------------------------------------------------------
end Structural;

