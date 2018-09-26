library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CarrySelect is
	generic (N : integer := 32;
				K : integer := 4);
	port (A : in std_logic_vector(N-1 downto 0);
			B : in std_logic_vector(N-1 downto 0);
			Cin : in std_logic_vector((N/K)-1 downto 0);
			S : out std_logic_vector(N-1 downto 0)
			);
end CarrySelect;

architecture Structural of CarrySelect is
	
	component CarrySelectBlock is
		generic (N : integer := 4);
		port (A : in std_logic_vector(N-1 downto 0);
				B : in std_logic_vector(N-1 downto 0);
				Cin : in std_logic;
				S : out std_logic_vector(N-1 downto 0)
				);
	end component;
	

begin

	cyc: for i in 0 to (N-1) generate
		check : if (i mod 4) = 0 generate
				CSB_i : CarrySelectBlock 
							generic map (K)
							port map (
								A => A(i+3 downto i),
								B => B(i+3 downto i),
								Cin => Cin(i/4),
								S => S(i+3 downto i)
								);
		end generate check;
	end generate cyc;


end Structural;

