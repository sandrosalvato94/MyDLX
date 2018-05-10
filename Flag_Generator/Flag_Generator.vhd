----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 	Alessandro Salvato
-- 
-- Create Date:    10:36:15 05/10/2018 
-- Design Name: 
-- Module Name:    Flag_Generator - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 	The flag generator is a component embedded in the ALU, it
--		generates 5 bit flags:
--			- Zero Flag (ZF)		1 FG_ALU_out all 0's, 0 else
--			- Parity Flag (PF)		1 FG_ALU_out ows an even number of 1's, 0 else
--			- Sign Flag (SF)		1 FG_ALU_out negative, 0 else
--			- Carry Flag (CF)		1 occurs carry, 0 else
--			- Overflow Flag (OF)	1 occurs overflow, 0 else
--			
-- Dependencies: 
--
-- Revision	0.9 - All components tied up. Tests T1, T2, T3, T4, T5, T6 passed.
--		      Ready for synthesis. 
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

entity Flag_Generator is
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
end Flag_Generator;

architecture Structural of Flag_Generator is

	component NORGate_NX1 is
	generic(N: integer:= 8);
	port(
		A:	in  std_logic_vector(N-1 downto 0);
		B:	in  std_logic_vector(N-1 downto 0);
		Y:	out std_logic);
	     
	end component;
	
	component XNORGate_NX1 is
	generic(N: integer:= 8);
	port(
		A:	in  std_logic_vector(N-1 downto 0);
		B:	in  std_logic_vector(N-1 downto 0);
		Y:	out std_logic);
	     
	end component;
	
	signal s_not_sgn_usgn	: std_logic;

begin

------------------------------------------------------------------------------
	NOR32X1 : NORGate_NX1 GENERIC MAP (N => NBIT_ALU) PORT MAP (
					A => FG_ALU_out,
					B => (others => '0'),
					Y => FG_ZF
					);
------------------------------------------------------------------------------

------------------------------------------------------------------------------
	XNOR32X1 : XNORGate_NX1  GENERIC MAP (N => NBIT_ALU) PORT MAP (
					A => FG_ALU_out,
					B => (others => '0'),
					Y => FG_PF
					);
------------------------------------------------------------------------------

------------------------------------------------------------------------------
	FG_SF <= FG_ALU_out(NBIT_ALU-1) AND FG_sgn_usgn;
------------------------------------------------------------------------------


------------------------------------------------------------------------------
	s_not_sgn_usgn <= NOT(FG_sgn_usgn);
	FG_CF <= s_not_sgn_usgn AND FG_carry;
------------------------------------------------------------------------------


------------------------------------------------------------------------------
	FG_OF <= FG_sgn_usgn AND FG_carry;
------------------------------------------------------------------------------


end Structural;

