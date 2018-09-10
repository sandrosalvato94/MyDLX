library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity CarrySelectBlock is
	generic (N : integer := 4);
	port (A : in std_logic_vector(N-1 downto 0);
			B : in std_logic_vector(N-1 downto 0);
			Cin : in std_logic;
			S : out std_logic_vector(N-1 downto 0)
			);
end CarrySelectBlock;

architecture Structural of CarrySelectBlock is
	
	component RCA is
			generic (N : natural := 4);
			Port (A: In	std_logic_vector(N-1 downto 0);
					B:	In	std_logic_vector(N-1 downto 0);
					Ci: In std_logic;
					S:	Out std_logic_vector(N-1 downto 0);
					Co: Out std_logic
					);
	end component;
	
	component MUX21_GENERIC is
		Generic (N: integer := 4);
		Port (A:	In	std_logic_vector(N-1 downto 0) ;
				B:	In	std_logic_vector(N-1 downto 0);
				SEL: In std_logic;
				Y:	Out std_logic_vector(N-1 downto 0)
				);
	end component;
	
	signal sum1, sum2 : std_logic_vector(N-1 downto 0);
	constant C_0 : std_logic := '0';
	constant C_1 : std_logic := '1';

begin

	rca1 : RCA 
				generic map (4)
				port map (
					A => A,
					B => B,
					Ci => C_0,
					S => sum1
					);
				
	rca2 : RCA 
				generic map (4)
				port map (
					A => A,
					B => B,
					Ci => C_1,
					S => sum2
					);
	
	mux : MUX21_GENERIC 
				generic map (4)
				port map (
					A => sum1,
					B => sum2,
					SEL => Cin,
					Y => S
					);
			
end Structural;











