----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:42:25 10/05/2017 
-- Design Name: 
-- Module Name:    Carry_Network - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
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

entity Carry_Network is
	generic(N : integer := 32);
	port(
		G	: in  std_logic_vector(N-1 downto 0);
		P	: in  std_logic_vector(N-1 downto 0);
		Cin	: in  std_logic;
		Cout	: out std_logic;
		Gout	: out std_logic_vector(N-1 downto 0);
		Pout	: out std_logic_vector(N-1 downto 0)
	);
end Carry_Network;



architecture Behavioral of Carry_Network is
	signal s_tmp, s_carry : std_logic_vector(N-1 downto 0);
begin
	
	cyc: for i in 0 to N-1 generate
		if0 : if i = 0 generate
			Gout(i) <= Cin;
			Pout(i) <= P(i);
			s_tmp(i) <= Cin AND P(i);
			s_carry(i) <= s_tmp(i) OR G(i);
		end generate if0;
		
		ifi : if i > 0 AND i < N-1 generate
			Gout(i) <= s_carry(i-1);
			Pout(i) <= P(i);
			s_tmp(i) <= s_carry(i-1) AND P(i);
			s_carry(i) <= s_tmp(i) OR G(i);
		end generate ifi;
		
		ifN : if i = N-1 generate
			Gout(i) <= s_carry(i-1);
			Pout(i) <= P(i);
			s_tmp(i) <= s_carry(i-1) AND P(i);
			Cout <= s_tmp(i) OR G(i);
		end generate ifN;
		
	end generate cyc;

end Behavioral;

