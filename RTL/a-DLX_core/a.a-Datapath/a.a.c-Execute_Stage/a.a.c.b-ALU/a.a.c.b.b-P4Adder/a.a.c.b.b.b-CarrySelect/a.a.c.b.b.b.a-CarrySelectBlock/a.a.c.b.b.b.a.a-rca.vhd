library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity RCA is 
			generic (N : natural := 4);
			Port (A: In	std_logic_vector(N-1 downto 0);
					B:	In	std_logic_vector(N-1 downto 0);
					Ci: In std_logic;
					S:	Out std_logic_vector(N-1 downto 0);
					Co: Out std_logic
					);
end RCA; 

architecture STRUCTURAL of RCA is

  component FA 
			Port (A:	In	std_logic;
					B:	In	std_logic;
					Ci: In std_logic;
					S:	Out std_logic;
					Co: Out std_logic
					);
  end component; 
  
  
  signal STMP : std_logic_vector(N-1 downto 0);
  signal CTMP : std_logic_vector(N downto 0);

begin

  CTMP(0) <= Ci;
  S <= STMP;
  Co <= CTMP(N);
  
  ADDER1: for i in 1 to N generate
		FAI : FA  
				Port Map (A(i-1), B(i-1), CTMP(i-1), STMP(i-1), CTMP(i)); 
  end generate;

end STRUCTURAL;


configuration CFG_RCA_STRUCTURAL of RCA is
  for STRUCTURAL 
    for ADDER1
      for all : FA
        use configuration WORK.CFG_FA_BEHAVIORAL;
      end for;
    end for;
  end for;
end CFG_RCA_STRUCTURAL;

