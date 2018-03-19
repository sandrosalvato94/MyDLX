----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:01:37 10/07/2017 
-- Design Name: 
-- Module Name:    CarryLookahead_Flat - Behavioral 
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

entity CarryLookahead_Flat is
	port(
		A	: in  std_logic_vector(3 downto 0);
		B	: in  std_logic_vector(3 downto 0);
		Cin	: in  std_logic;
		Cout 	: out std_logic;
		Sum	: out  std_logic_vector(3 downto 0)
	);
end CarryLookahead_Flat;

architecture Behavioral of CarryLookahead_Flat is
	
	component PG_network is
	Generic(N: integer := 32);
	Port ( A : in  STD_LOGIC_VECTOR (N-1 downto 0);
           B : in  STD_LOGIC_VECTOR (N-1 downto 0);
	 c_in : in std_logic;
           G : out  STD_LOGIC_VECTOR (N-1 downto 0);
           P : out  STD_LOGIC_VECTOR (N-1 downto 0));
	end component;
	
	signal s_g, s_p : std_logic_vector(3 downto 0);
	
begin

	PGN : PG_network GENERIC MAP(N => 4) PORT MAP(
					A => A,
					B => B,
					c_in => '0',
					G => s_g,
					P => s_p
					);
					
	Sum(0) <= Cin XOR s_p(0);
	Sum(1) <= s_p(1) XOR (s_g(0) OR (Cin AND s_p(0)));
	Sum(2) <= s_p(2) XOR (s_g(1) OR (s_p(1) AND s_g(0)) OR (s_p(1) AND s_p(0) AND Cin));
	Sum(3) <= s_p(3) XOR (s_g(2) OR (s_p(2) AND s_g(1)) OR (s_p(2) AND s_p(1) AND s_g(0)) OR (s_p(2) AND s_p(1) AND s_p(0) AND Cin));
	Cout <= (s_g(3) OR (s_p(3) AND s_g(2)) OR (s_p(3) AND s_p(2) AND s_g(1)) OR ( s_p(3) AND s_p(2) AND s_p(1) AND s_g(0))) 
	         OR 
	        ((s_p(3) AND s_p(2) AND s_p(1) AND s_p(0))  AND Cin);

end Behavioral;

