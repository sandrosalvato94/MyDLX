library IEEE;
use IEEE.std_logic_1164.all; 

entity MUX21_GENERIC is
	Generic (N: integer := 4);
	Port (A:	In	std_logic_vector(N-1 downto 0) ;
			B:	In	std_logic_vector(N-1 downto 0);
			SEL: In std_logic;
			Y:	Out std_logic_vector(N-1 downto 0)
			);
	end MUX21_GENERIC;



architecture STRUCTURAL of MUX21_GENERIC is

 component MUX21 is
	Port (A:	In	std_logic;
			B:	In	std_logic;
			S:	In	std_logic;
			Y:	Out std_logic
			);
 end component;

begin
  GEN : FOR I in 0 to N-1 GENERATE
	    U : MUX21 port map (
				A => A(I),
				B => B(I),
				S => SEL,
				Y => Y(I)
				); 
 	END GENERATE GEN;	

end STRUCTURAL;


configuration CFG_MUX21_GEN_STRUCTURAL of MUX21_GENERIC is
	for STRUCTURAL
	end for;
end CFG_MUX21_GEN_STRUCTURAL;
