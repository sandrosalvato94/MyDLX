
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PG_cell is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           p : out  STD_LOGIC;
           g : out  STD_LOGIC);
end PG_cell;

architecture Behavioral of PG_cell is

begin
	p <= A XOR B;
	g <= A AND B;


end Behavioral;

