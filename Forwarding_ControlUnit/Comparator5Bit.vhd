----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 	Alessandro Salvato
-- 
-- Create Date:    09:49:45 06/04/2018 
-- Design Name: 
-- Module Name:    Comparator5Bit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 1.0
--
-- Revision	 0.1 - File Created
--				 1.0 - T1 and T2 passed
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

entity Comparator5Bit is
	port(
			CMP_A			: in  std_logic_vector(4 downto 0);
			CMP_B 		: in  std_logic_vector(4 downto 0);
			CMP_EQ_neq	: out std_logic
		);
end Comparator5Bit;

architecture Behavioral of Comparator5Bit is

	signal s_xor_out					: std_logic_vector(4 downto 0);
	signal s_tmp1, s_tmp2, s_tmp3	: std_logic;
	
begin

	cyc_xor : for i in 0 to 4 generate
		s_xor_out(i) <= CMP_A(i) XOR CMP_B(i);
	end generate cyc_xor;
	
	s_tmp1 <= s_xor_out(0) OR s_xor_out(1);
	s_tmp2 <= s_tmp1 OR s_xor_out(2);
	s_tmp3 <= s_xor_out(3) OR s_xor_out(4);
	CMP_EQ_neq <= s_tmp2 NOR s_tmp3;


end Behavioral;

