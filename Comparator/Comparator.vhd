----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:11:20 04/26/2018 
-- Design Name: 
-- Module Name:    Comparator - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision 0.3
--  	Version	0.1 - Layout defined. Tests not yet performed.
--	Version	0.2 - The previous versions did non take into account the
--		      very important difference between the role of the MSB
--		      It worked at the same regardless of unsigned and signed
--		      values. So I add an additional pin, CMP_sgn_usgn, to
--		      distinguish between the two scenarios.
--	Version	0.3 - Bitwise AND performed between CMP_sgn_usgn and CMP_enable.
--		      CMP_sgn_usgn = 0 : unsigned
--		      CMP_sgn_usgn = 1 : signed
--		      Any Test not yet passed.
--
-- Additional Comments: 
-- 		This comparator is composed of N stages, where the ith 
--		determis whether the ith-1 has reason to be performed. In fact,
--		if x_i != y_i, it is not useful any more checking the equality
--		of less significant bits.
--		This component takes into account both unsigned and signed values.
--		For unsigned numbers it's necessary verify the (in)equality
--		at most for N bits. It's the same for signed numbers where the
--		MSBs are both equal to 0, or both equal to 1. If the comparator gets 
--		as inputs two signed values, where the former is positive and the
--		latter is negative, or viceversa, the only operation to be done
--		is the comparison between the two MSBs. VERY IMPORTANT to distinguish 
--		between the cases unsigned and signed, because the meaning of 
--		the MSB is very different.
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

entity Comparator is
	generic(NBIT_DATA : integer := 32);
	port(
		CMP_OpA : 	in  std_logic_vector(NBIT_DATA-1 downto 0);
		CMP_OpB : 	in  std_logic_vector(NBIT_DATA-1 downto 0);
		CMP_sgn_usgn : 	in  std_logic;
		CMP_enable :	in  std_logic;
		CMP_A_gt_B :	out std_logic;
		CMP_A_ge_B :	out std_logic;
		CMP_A_lt_B :	out std_logic;
		CMP_A_le_B :	out std_logic;
		CMP_A_eq_B :	out std_logic
	);
end Comparator;

architecture Structural of Comparator is
	
	component ORGate_NX1 is
	generic(N: integer:= 8);
	port(
		A:	in  std_logic_vector(N-1 downto 0);
		B:	in  std_logic_vector(N-1 downto 0);
		Y:	out std_logic);
	     
	end component;
	
	component Mux_1Bit_2X1 is
	Port ( port0 : in  STD_LOGIC;
           port1 : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           portY : out  STD_LOGIC);
	end component;

	
	signal s_en_opa, s_en_opb 		: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_neq_eq, s_not_neq_eq		: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_gt, s_lt			: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_tmp_neq_eq			: std_logic;
	signal s_tmp_gt, s_tmp_lt		: std_logic;
	signal s_not_tmp_gt, s_not_tmp_lt	: std_logic;
	signal s_out_gt, s_out_lt		: std_logic;
	signal s_en_mux			: std_logic;

begin
-----------------------------------------------------------------------------------
	cyc : for i in NBIT_DATA-1 downto 0 generate
		ifN : if(i = NBIT_DATA-1) generate
			s_en_opa(i) <= CMP_OpA(i) AND CMP_enable;
			s_en_opb(i) <= CMP_OpB(i) AND CMP_enable;
			s_neq_eq(i) <= s_en_opa(i) XOR s_en_opb(i);
			s_gt(i) <= s_neq_eq(i) AND s_en_opa(i);
			s_lt(i) <= s_neq_eq(i) AND s_en_opb(i);
			s_not_neq_eq(i) <= NOT(s_neq_eq(i));
		end generate ifN;
		
		ifi : if((i < NBIT_DATA-1) AND (i>=0)) generate
			s_en_opa(i) <= CMP_OpA(i) AND s_not_neq_eq(i+1);
			s_en_opb(i) <= CMP_OpB(i) AND s_not_neq_eq(i+1);
			s_neq_eq(i) <= s_en_opa(i) XOR s_en_opb(i);
			s_gt(i) <= s_neq_eq(i) AND s_en_opa(i);
			s_lt(i) <= s_neq_eq(i) AND s_en_opb(i);
			s_not_neq_eq(i) <= NOT(s_neq_eq(i));
		end generate ifi;
	end generate cyc;
-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
	
	s_en_mux <= CMP_sgn_usgn AND CMP_enable;
	
	OR_gt : ORGate_NX1 GENERIC MAP (N => NBIT_DATA) PORT MAP(
					A => s_gt,
					B => (others => '0'),
					Y => s_tmp_gt
					);
	OR_lt : ORGate_NX1 GENERIC MAP (N => NBIT_DATA) PORT MAP(
					A => s_lt,
					B => (others => '0'),
					Y => s_tmp_lt
					);
	s_not_tmp_gt <= NOT(s_tmp_gt);
	s_not_tmp_lt <= NOT(s_tmp_lt);
	
	MUX_gt : Mux_1Bit_2X1 PORT MAP(
			port0 => s_tmp_gt,
			port1 => s_not_tmp_gt,
			sel => s_en_mux,
			portY => s_out_gt
			);
			
	MUX_lt : Mux_1Bit_2X1 PORT MAP(
			port0 => s_tmp_lt,
			port1 => s_not_tmp_lt,
			sel => s_en_mux,
			portY => s_out_lt
			);
			
			
	
	CMP_A_gt_B <= s_out_gt;
	CMP_A_lt_B <= s_out_lt;
	CMP_A_eq_B <= s_not_neq_eq(0);
	CMP_A_ge_B <= s_out_gt OR s_not_neq_eq(0);
	CMP_A_le_B <= s_out_lt OR s_not_neq_eq(0);
					

-------------------------------------------------------------------------------------
end Structural;

