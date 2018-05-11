----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Alessandro Salvato
-- 
-- Create Date:    19:18:08 10/20/2017 
-- Design Name: 
-- Module Name:    ALU - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 0.1
-- Revision:	
--	0.1 - Declared all components
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.constants.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
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
end ALU;

architecture Structural of ALU is

	component Barrel_Shifter is
	generic(--NBIT_DATA : integer := 16; NBIT_DATA = 2**NBIT_AMOUNT
	        NBIT_AMOUNT : integer := 5);
	port(
		BS_data_in	: in  std_logic_vector(2**NBIT_AMOUNT-1 downto 0);
		BS_opcode		: in  std_logic_vector(1 downto 0); 
		BS_amount		: in  std_logic_vector(NBIT_AMOUNT-1 downto 0);
		BS_data_out	: out std_logic_vector(2**NBIT_AMOUNT-1 downto 0)
	);
	end component;
	
	component P4Adder is
	GENERIC(N: integer := 32);
	PORT(
		A : IN std_logic_vector(N-1 downto 0);
		B : IN std_logic_vector(N-1 downto 0);
		c_in: IN std_logic;
		c_out: OUT std_logic;
		Sum : OUT std_logic_vector(N-1 downto 0)
	);
	end component;
	
	component Logic_Unit is
	generic(NBIT_DATA : integer := 32);
	port(
		LU_OpA 	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		LU_OpB 	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		LU_Opcode	: in  std_logic_vector(3 downto 0);
		LU_Y	: out std_logic_vector(NBIT_DATA-1 downto 0)
	);
	end component;
	
	component Comparison_Logic is
	generic(NBIT_DATA : integer := 32);
	port(
		CMPL_OpA		: in  std_logic_vector(NBIT_DATA-1 downto 0);
		CMPL_OpB  	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		CMPL_OPCODE	: in  std_logic_vector(3 downto 0);
--		CMPL_sgn_usgn	: in  std_logic;
		CMPL_Y		: out std_logic_vector(NBIT_DATA-1 downto 0)
	);
	end component;
	
	component Flag_Generator is
	generic(NBIT_ALU : integer := 32);
	port(
		FG_ALU_out	: in  std_logic_vector(NBIT_ALU-1 downto 0);
		FG_sgn_usgn	: in  std_logic;
		FG_carry		: in  std_logic;
		FG_ZF		: out std_logic;
		FG_PF		: out std_logic;
		FG_SF		: out std_logic;
		FG_CF		: out std_logic;
		FG_OF		: out std_logic
	);
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
	
	type collection_data is array (0 to 3) of std_logic_vector (NBIT_ALU-1 downto 0);
	type matrix_data is array(0 to 3) of collection_data;
	
	--constant L: integer := log2(NBIT_ALU);
	
	signal s_BS_enable		: std_logic;
	signal s_BS_opcode		: std_logic_vector(1 downto 0);
	signal s_from_BS_to_units_opA	: std_logic_vector(NBIT_ALU-1 downto 0);
	signal s_P4_cin		: std_logic;
	signal s_not_opB, s_sel_opB	: std_logic_vector(NBIT_ALU-1 downto 0);
	signal s_from_P4_c_out	: std_logic;
	signal s_from_P4_to_out_sum	: std_logic_vector(NBIT_ALU-1 downto 0);
	signal s_LU_enable		: std_logic;
	signal s_tmp1, s_tmp2	: std_logic;
	signal s_LU_opcode		: std_logic_vector(3 downto 0);
	signal s_from_LU_to_out_mux	: std_logic_vector(NBIT_ALU-1 downto 0);
	signal s_CMP_enable		: std_logic;
	signal s_CMP_opcode		: std_logic_vector(3 downto 0);
	signal s_from_CMP_to_out_mux	: std_logic_vector(NBIT_ALU-1 downto 0);
	signal s_mux_signals	: matrix_data :=(others => (others => (others => '0')));
begin

---------------------------------------------------------------------------------------------
	
	s_BS_enable <= ALU_Opcode(5) NOR ALU_Opcode(4);
	
	s_BS_opcode(1) <= ALU_Opcode(3) AND s_BS_enable;
	s_BS_opcode(0) <= ALU_Opcode(2) AND s_BS_enable;
	
	
	BS : Barrel_Shifter GENERIC MAP (NBIT_AMOUNT => NBIT_BS_AMOUNT) PORT MAP (
						BS_data_in => ALU_OpA,
						BS_opcode => s_BS_opcode,
						BS_amount => ALU_BS_amount,
						BS_data_out => s_from_BS_to_units_opA
						);

---------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------
	
	cyc_not_opb : for i in 0 to NBIT_ALU-1 generate
		s_not_opb(i) <= NOT(ALU_Opb(i));
	end generate cyc_not_opb;
	
	s_P4_cin  <= ALU_Opcode(0) AND s_BS_enable;
	
	MuxP4 : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_ALU) PORT MAP (
						port0 => ALU_Opb,
						port1 => s_not_opb,
						sel => s_P4_cin,
						portY => s_sel_opB
						);
	
	P4 : P4Adder GENERIC MAP (N => NBIT_ALU) PORT MAP (
					A => s_from_BS_to_units_opA,
					B => s_sel_opB,
					C_in => s_P4_cin,
					C_out => s_from_P4_c_out,
					Sum => s_from_P4_to_out_sum
					);
	
---------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------
	s_tmp1 <= NOT(ALU_Opcode(5));
	s_LU_enable <= s_tmp1 AND ALU_Opcode(4);
	s_LU_opcode(3) <= s_LU_enable AND ALU_Opcode(3);
	s_LU_opcode(2) <= s_LU_enable AND ALU_Opcode(2);
	s_LU_opcode(1) <= s_LU_enable AND ALU_Opcode(1);
	s_LU_opcode(0) <= s_LU_enable AND ALU_Opcode(0);

	LU : Logic_Unit GENERIC MAP (NBIT_DATA => NBIT_ALU) PORT MAP (
						LU_OpA => s_from_BS_to_units_opA,
						LU_OpB => ALU_OpB,
						LU_Opcode => s_LU_opcode,
						LU_Y => s_from_LU_to_out_mux
						);
---------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------
	s_tmp2 <= NOT(ALU_Opcode(4));
	s_CMP_enable <= s_tmp2 AND ALU_Opcode(5);
	s_CMP_opcode(3) <= s_CMP_enable AND ALU_Opcode(3);
	s_CMP_opcode(2) <= s_CMP_enable AND ALU_Opcode(2);
	s_CMP_opcode(1) <= s_CMP_enable AND ALU_Opcode(1);
	s_CMP_opcode(0) <= s_CMP_enable AND ALU_Opcode(0);
	
	CMPL : Comparison_Logic GENERIC MAP (NBIT_DATA => NBIT_ALU) PORT MAP (
							CMPL_OpA => s_from_BS_to_units_opA,
							CMPL_OpB => ALU_OpB,
							CMPL_OPCODE => s_CMP_opcode,
							CMPL_Y => s_from_CMP_to_out_mux
							);
---------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------
	
	s_mux_signals(0)(0) <= s_from_P4_to_out_sum;
	s_mux_signals(0)(1) <= s_from_LU_to_out_mux;
	s_mux_signals(0)(2) <= s_from_CMP_to_out_mux;
	
	depth1: for i in 0 to 1 generate 				--0,  1, 2,  3
		width1: for j in 0 to 1 generate 	         --15,  7, 3,  1
			mod_if1: if(j mod(2**(i+1)) = 0) generate 	--2,  4, 8, 16
				MUX1: Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_ALU) 
				           PORT MAP (port0 => s_mux_signals(i)(j),
						 port1 => s_mux_signals(i)(j+2**i),
						 Sel => ALU_Opcode(5-i),
						 portY => s_mux_signals(i+1)(j));
			end generate mod_if1;
			
		end generate width1;
	end generate depth1;
	
	ALU_output <= s_mux_signals(2)(0);
---------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------
	FG : Flag_Generator GENERIC MAP (NBIT_ALU => NBIT_ALU) PORT MAP (
							FG_ALU_out => s_mux_signals(2)(0),
							FG_sgn_usgn => s_CMP_opcode(3), --it's a SIGNED/unsigned bit
							FG_carry => s_from_P4_c_out,
							FG_ZF => ALU_flags(0),
							FG_PF => ALU_flags(1),
							FG_SF => ALU_flags(2),
							FG_CF => ALU_flags(3),
							FG_OF => ALU_flags(4)
							);
	
---------------------------------------------------------------------------------------------

end Structural;

