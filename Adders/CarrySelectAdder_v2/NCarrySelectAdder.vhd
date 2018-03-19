----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:11:20 10/07/2017 
-- Design Name: 
-- Module Name:    NCarrySelectAdder - Behavioral 
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

entity NCarrySelectAdder is
	generic(N: integer := 32);
	port(
		A	: in  std_logic_vector(N-1 downto 0);
		B	: in  std_logic_vector(N-1 downto 0);
		Cin	: in  std_logic;
		Cout	: out std_logic;
		Sum	: out  std_logic_vector(N-1 downto 0)
	);
end NCarrySelectAdder;

architecture Behavioral of NCarrySelectAdder is
	
	component CarrySelectAdder is
	generic(N: integer := 4);
	port(
		A	: in  std_logic_vector(N-1 downto 0);
		B	: in  std_logic_vector(N-1 downto 0);
		Cin	: in  std_logic;
		Cout	: out std_logic;
		Sum	: out  std_logic_vector(N-1 downto 0)
	);
	end component;
	
	constant K 	: integer := N/4; --8
	signal s_carry 	: std_logic_vector(K-1 downto 0);
	
begin
	
	cyc : for i in 0 to K-1 generate
		if0 : if i = 0 generate 
			CSA0 : CarrySelectAdder GENERIC MAP(N=>4) 
					    PORT MAP(
							A => A((i+1)*4-1 downto i*4),
							B => B((i+1)*4-1 downto i*4),
							Cin => Cin,
							Cout => s_carry(i),
							Sum => Sum((i+1)*4-1 downto i*4)
						);
		end generate if0;
		
		ifi : if i > 0 and i<K-1 generate
			CSAi : CarrySelectAdder GENERIC MAP(N=>4) 
					    PORT MAP(
							A => A((i+1)*4-1 downto i*4),
							B => B((i+1)*4-1 downto i*4),
							Cin => s_carry(i-1),
							Cout => s_carry(i),
							Sum => Sum((i+1)*4-1 downto i*4)
						);
		end generate ifi;
		
		ifK : if i = K-1 generate 
			CSAi : CarrySelectAdder GENERIC MAP(N=>4) 
					    PORT MAP(
							A => A((i+1)*4-1 downto i*4),
							B => B((i+1)*4-1 downto i*4),
							Cin => s_carry(i-1),
							Cout => Cout,
							Sum => Sum((i+1)*4-1 downto i*4)
						);
		end generate ifK;
		
	end generate cyc;

end Behavioral;

