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
-- Revision: 0.3
-- Revision 	0.1 - Making up
--		0.2 - All components are tied up. First Xilinx's synthesis on 32,
--		      8, 16, 64 & 128 bit. Not yet tested.
--		0.3 - Added ALU output register. T1, T2, T3a, T3b passed on 32, 8 bits
--		      
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
	        NBIT_BS_AMOUNT : integer := 5
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
--		EX_OpAEnable	: in  std_logic;
--		EX_OpBEnable	: in  std_logic;
--		EX_AluEnable	: in  std_logic;
--		EX_MulEnable	: in  std_logic;
		EX_Opcode		: in  std_logic_vector(5 downto 0);
--		EX_ShiftOp	: in  std_logic_vector(2 downto 0);
		EX_ShiftAmount	: in  std_logic_vector(NBIT_BS_AMOUNT-1 downto 0);
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
	
	component ALU is
	generic(NBIT_ALU 	   : integer := 32;
	        NBIT_BS_AMOUNT : integer := 5);
	port(
		ALU_OpA		: in  std_logic_vector(NBIT_ALU-1 downto 0);
		ALU_OpB		: in  std_logic_vector(NBIT_ALU-1 downto 0);
		ALU_Opcode	: in  std_logic_vector(5 downto 0);
		ALU_BS_amount	: in  std_logic_vector(NBIT_BS_AMOUNT -1 downto 0);
		ALU_output	: out std_logic_vector(NBIT_ALU-1 downto 0);
		ALU_flags		: out std_logic_vector(4 downto 0)
	);
	end component;
	
	component Multiplier is
	generic(NBIT_DATA : integer := 32);
	port(
		MUL_OpA 		: in  std_logic_vector(NBIT_DATA-1 downto 0);
		MUL_OpB 		: in  std_logic_vector(NBIT_DATA-1 downto 0);
		MUL_SGN_usgn 	: in  std_logic; -- 1 signed, 0 unsigned
		MUL_product	: out std_logic_vector(2*NBIT_DATA-1 downto 0)
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
	
	component Mux_NBit_2x1 is
	generic(NBIT_IN: integer := 32);
	port(
		port0	: in  std_logic_vector(NBIT_IN-1 downto 0);
		port1	: in  std_logic_vector(NBIT_IN-1 downto 0);
		sel	: in  std_logic;
		portY	: out std_logic_vector(NBIT_IN-1 downto 0)
	);
	end component;
	
	type collection_data is array (0 to 3) of std_logic_vector (NBIT_DATA-1 downto 0);
	type matrix_data is array(0 to 2) of collection_data;
	
	signal s_OpA_Fei_Talu, s_OpB_Fei_Talu	: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_OpA_Fei_Tmul, s_OpB_Fei_Tmul	: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_product_Fmul_Thiloregs	: std_logic_vector(NBIT_DATA*2-1 downto 0);
	signal s_ALU_enable			: std_logic;
	signal s_mul_enable			: std_logic;
	signal s_product_Flo_Tmux		: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_product_Fhi_Tmux		: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_outalu_Falu_Tmux		: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_flags_Falu_statusreg		: std_logic_vector(4 downto 0);
	signal s_mux_signals	: matrix_data :=(others => (others => (others => '0')));
	signal s_outalu_Falu_Treg		: std_logic_vector(NBIT_DATA-1 downto 0);

begin
--------------------------------------------------------------------------------------------------------------
	s_ALU_enable <= (EX_Opcode(5) NAND EX_Opcode(4)) AND EX_enable;
	s_mul_enable <= (EX_Opcode(5) AND EX_Opcode(4)) AND EX_enable;
	
	
	
	EI_OpA_Alu : Enable_Interface GENERIC MAP (NBIT_DATA => NBIT_DATA) PORT MAP (
								EI_datain => EX_OpA,
								EI_enable => s_ALU_enable,
								EI_dataout => s_OpA_Fei_Talu
								);
	EI_OpB_Alu : Enable_Interface GENERIC MAP (NBIT_DATA => NBIT_DATA) PORT MAP (
								EI_datain => EX_OpB,
								EI_enable => s_ALU_enable,
								EI_dataout => s_OpB_Fei_Talu
								);
	EI_OpA_Mul : Enable_Interface GENERIC MAP (NBIT_DATA => NBIT_DATA) PORT MAP (
								EI_datain => EX_OpA,
								EI_enable => s_mul_enable,
								EI_dataout => s_OpA_Fei_Tmul
								);
	EI_OpB_Mul : Enable_Interface GENERIC MAP (NBIT_DATA => NBIT_DATA) PORT MAP (
								EI_datain => EX_OpB,
								EI_enable => s_mul_enable,
								EI_dataout => s_OpB_Fei_Tmul
								);
--------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------
	ALU_NBIT : ALU GENERIC MAP (NBIT_ALU => NBIT_DATA, NBIT_BS_AMOUNT => NBIT_BS_AMOUNT) PORT MAP (
						ALU_OpA => s_OpA_Fei_Talu,
						ALU_OpB => s_OpB_Fei_Talu,
						ALU_Opcode => EX_Opcode,
						ALU_BS_amount => EX_ShiftAmount,
						ALU_output => s_outalu_Falu_Treg,
						ALU_flags => s_flags_Falu_statusreg
						);
	--EX_AluOutBack <= s_outalu_Falu_Tmux;
--------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------
	MUL : Multiplier GENERIC MAP (NBIT_DATA => NBIT_DATA) PORT MAP (
							MUL_OpA => s_OpA_Fei_Tmul,
							MUL_OpB => s_OpB_Fei_Tmul,
							MUL_SGN_usgn => EX_Opcode(1), --SGN/usgn
							MUL_product => s_product_Fmul_Thiloregs
						    );
--------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------
	LO : NRegister GENERIC MAP (N => NBIT_DATA) PORT MAP (
						clk => EX_clk,
						reset => EX_reset,
						enable => s_mul_enable,
						load => '1',
						data_in => s_product_Fmul_Thiloregs(NBIT_DATA-1 downto 0),
						data_out => s_product_Flo_Tmux
						);
	
	HI : NRegister GENERIC MAP (N => NBIT_DATA) PORT MAP (
						clk => EX_clk,
						reset => EX_reset,
						enable => s_mul_enable,
						load => '1',
						data_in => s_product_Fmul_Thiloregs(NBIT_DATA*2-1 downto NBIT_DATA),
						data_out => s_product_Fhi_Tmux
						);
	ALU_reg : NRegister GENERIC MAP (N => NBIT_DATA) PORT MAP (
						clk => EX_clk,
						reset => EX_reset,
						enable => s_alu_enable,
						load => '1',
						data_in => s_outalu_Falu_Treg,
						data_out => s_outalu_Falu_Tmux
						);
	EX_AluOutBack <= s_outalu_Falu_Tmux;
--------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------
	s_mux_signals(0)(0) <= s_outalu_Falu_Tmux;
	s_mux_signals(0)(1) <= s_product_Flo_Tmux;
	s_mux_signals(0)(2) <= s_product_Fhi_Tmux;
	s_mux_signals(0)(3) <= (others => '0');
	
	
	MUX1: Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) 
			PORT MAP (port0 => s_mux_signals(0)(0),
				port1 => s_mux_signals(0)(1),
				Sel => EX_sel_mux_out(0),
				portY => s_mux_signals(1)(0));
				
	MUX2: Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) 
			PORT MAP (port0 => s_mux_signals(0)(2),
				port1 => s_mux_signals(0)(3),
				Sel => EX_sel_mux_out(0),
				portY => s_mux_signals(1)(1));
				
	MUX3: Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) 
			PORT MAP (port0 => s_mux_signals(1)(0),
				port1 => s_mux_signals(1)(1),
				Sel => EX_sel_mux_out(1),
				portY => s_mux_signals(2)(0));
	
	
	EX_data_out <= s_mux_signals(2)(0);
	
	PSW : NRegister GENERIC MAP (N => 5) PORT MAP (
						clk => EX_clk,
						reset => EX_reset,
						enable => s_alu_enable,
						load => '1',
						data_in => s_flags_Falu_statusreg,
						data_out => EX_PSW
						);
--------------------------------------------------------------------------------------------------------------
end Structural;

