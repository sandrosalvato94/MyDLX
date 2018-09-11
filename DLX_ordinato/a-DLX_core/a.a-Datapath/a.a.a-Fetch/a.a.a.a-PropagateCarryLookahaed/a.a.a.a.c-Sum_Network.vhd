----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:42:38 10/05/2017 
-- Design Name: 
-- Module Name:    Sum_Network - Behavioral 
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

entity Sum_Network is
	generic(N : integer := 32);
	port(
		G : in  std_logic_vector(N-1 downto 0);
		P : in  std_logic_vector(N-1 downto 0);
		S : out  std_logic_vector(N-1 downto 0)
	);
end Sum_Network;

architecture Behavioral of Sum_Network is

begin

	cyc: for i in 0 to N-1 generate
		S(i) <= G(i) XOR P(i);
	end generate cyc;

end Behavioral;

