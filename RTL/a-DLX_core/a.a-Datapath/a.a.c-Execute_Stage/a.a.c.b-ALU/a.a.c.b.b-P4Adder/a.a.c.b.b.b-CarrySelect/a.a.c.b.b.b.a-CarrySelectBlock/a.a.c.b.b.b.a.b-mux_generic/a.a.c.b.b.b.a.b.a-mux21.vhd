library IEEE;
use IEEE.std_logic_1164.all;

entity MUX21 is
	Port (A:	In	std_logic;
			B:	In	std_logic;
			S:	In	std_logic;
			Y:	Out	std_logic);
end MUX21;


architecture BEHAVIORAL of MUX21 is

begin
	
	process(A, B, S)
	begin
		if(S = '0') then
			Y <= A;
		else
			Y <= B;
		end if;
	end process;

end BEHAVIORAL;


configuration CFG_MUX21_BEHAVIORAL of MUX21 is
	for BEHAVIORAL
	end for;
end CFG_MUX21_BEHAVIORAL;

