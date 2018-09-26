----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:50:52 04/26/2018 
-- Design Name: 
-- Module Name:    Logic_Unit_v2 - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 	LU_OPCODE		3	2	1	0
--		----------------------------------------------------
--		   AND		1	0	0	0
--		   NAND		0	1	1	1
--		   OR		1	1	1	0
--		   NOR		0	0	0	1
--		   XOR		0	1	1	0
--		   XNOR		1	0	0	1
--
-- Dependencies: 
--
-- Revision 1.0 
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

entity Logic_Unit is
	generic(NBIT_DATA : integer := 32);
	port(
		LU_OpA 	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		LU_OpB 	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		LU_Opcode	: in  std_logic_vector(3 downto 0);
		LU_Y	: out std_logic_vector(NBIT_DATA-1 downto 0)
	);
end Logic_Unit;

architecture Structural of Logic_Unit is
	
	signal s_not_opA, s_not_opB : std_logic_vector(NBIT_DATA-1 downto 0);
	signal s1, s2, s3, s4       : std_logic_vector(NBIT_DATA-1 downto 0);
	
begin

	cyc : for i in 0 to NBIT_DATA-1 generate 
		s_not_opA(i) <= NOT(LU_OpA(i));
		s_not_opB(i) <= NOT(LU_OpB(i));
		
		s1(i) <= (LU_Opcode(0) AND s_not_opA(i)) NAND s_not_opB(i);
		s2(i) <= (LU_Opcode(1) AND s_not_opA(i)) NAND LU_OpB(i);
		s3(i) <= (LU_Opcode(2) AND LU_OpA(i)) NAND s_not_opB(i);
		s4(i) <= (LU_Opcode(3) AND LU_OpA(i)) NAND LU_OpB(i);
		
		LU_Y(i) <= ((s1(i) AND s2(i)) AND s3(i)) NAND s4(i);
	end generate cyc;

end Structural;

