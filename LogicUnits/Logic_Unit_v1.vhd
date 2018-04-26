----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Alessandro Salvato
-- 
-- Create Date:    12:05:44 04/24/2018 
-- Design Name: 
-- Module Name:    Logic_Unit_v1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--		Opcode    BooleanFunction
--		  00	      AND
--		  01            OR
--		  10            XOR
--		  11      never generated
--
-- Dependencies: 
--
-- Revision: 1.0
-- Additional Comments: 
--	Version 0.2 : Described algorithm. Not yet tested
--        Version 1.0 : Test 1a, 1b, 1c, 2a, 2b, 2c, 3a, 3b, 3c, passed
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Logic_Unit is
	generic(NBIT_DATA : integer := 32);
	port(
		LU_OpA 	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		LU_OpB 	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		LU_Opcode	: in  std_logic_vector(1 downto 0);
		LU_Y	: out std_logic_vector(NBIT_DATA-1 downto 0)
	);
end Logic_Unit;

architecture Behavioral of Logic_Unit is

	signal s1, s2, s3, s4, s5, s6, s7, s8 : std_logic_vector(NBIT_DATA-1 downto 0);
	
begin

	cyc : for i in 0 to NBIT_DATA-1 generate
		s1(i) <= LU_OpA(i) AND LU_OpB(i);
		s8(i) <= NOT(LU_Opcode(1));
		
		s3(i) <= LU_OpA(i) OR LU_OpB(i);
		
		s5(i) <= LU_OpA(i) XOR LU_OpB(i);
		
		s2(i) <= s1(i) AND s8(i);
		s4(i) <= s3(i) AND LU_Opcode(0);
		s6(i) <= s5(i) AND LU_Opcode(1);
		
		s7(i) <= s4(i) OR s6(i);
		
		LU_Y(i) <= s2(i) OR s7(i);
	end generate cyc;

end Behavioral;

