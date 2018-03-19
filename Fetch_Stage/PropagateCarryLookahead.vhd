----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:33:10 10/05/2017 
-- Design Name: 
-- Module Name:    PropagateCarryLookahead - Behavioral 
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

entity PropagateCarryLookahead is
	generic(N : integer := 32);
	port(
		A	: in  std_logic_vector(N-1 downto 0);
		B	: in  std_logic_vector(N-1 downto 0);
		Cin	: in  std_logic;
		Sum 	: out std_logic_vector(N-1 downto 0);
		Cout 	: out std_logic
	);
	
end PropagateCarryLookahead;

architecture Behavioral of PropagateCarryLookahead is
	
	component PG_network is
	Generic(N: integer := 32);
	Port ( A : in  STD_LOGIC_VECTOR (N-1 downto 0);
           B : in  STD_LOGIC_VECTOR (N-1 downto 0);
	 c_in : in std_logic;
           G : out  STD_LOGIC_VECTOR (N-1 downto 0);
           P : out  STD_LOGIC_VECTOR (N-1 downto 0));
	end component;
	
	component Carry_Network is
	generic(N : integer := 32);
	port(
		G	: in  std_logic_vector(N-1 downto 0);
		P	: in  std_logic_vector(N-1 downto 0);
		Cin	: in  std_logic;
		Cout	: out std_logic;
		Gout	: out std_logic_vector(N-1 downto 0);
		Pout	: out std_logic_vector(N-1 downto 0)
	);
	end component;
	
	component  Sum_Network is
	generic(N : integer := 32);
	port(
		G : in  std_logic_vector(N-1 downto 0);
		P : in  std_logic_vector(N-1 downto 0);
		S : out  std_logic_vector(N-1 downto 0)
	);
	end component;
	
	signal s_G1, s_P1, s_G2, s_P2 : std_logic_vector(N-1 downto 0);

begin

	PG : PG_network GENERIC MAP (N => N) PORT MAP(
						A => A,
						B => B,
						C_in => '0',
						G => s_G1,
						P => s_P1
					);
	CN : Carry_Network GENERIC MAP (N => N) PORT MAP(
						G => s_G1,
						P => s_P1,
						Cin => Cin,
						Cout => Cout,
						Gout => s_G2,
						Pout => s_P2
					);
	SN : Sum_Network GENERIC MAP (N => N) PORT MAP(
						G => s_G2,
						P => s_P2,
						S => Sum
					);

end Behavioral;

