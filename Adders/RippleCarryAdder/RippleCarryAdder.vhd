----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:31:47 10/05/2017 
-- Design Name: 
-- Module Name:    RippleCarryAdder - Behavioral 
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

entity RippleCarryAdder is
	generic(N : integer := 32);
	port(
		A 	: in  std_logic_vector(N-1 downto 0);
		B 	: in  std_logic_vector(N-1 downto 0);
		Cin 	: in  std_logic;
		Sum 	: out std_logic_vector(N-1 downto 0);
		Cout 	: out std_logic
	);
end RippleCarryAdder;

architecture Behavioral of RippleCarryAdder is
	
	component Full_adder is
	Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Y : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
	end component;
	
	signal s_carry : std_logic_vector(N-1 downto 0);
	
begin

	GEN_FA : for i in 0 to N-1 generate
		IF0 : if i = 0 generate
			FA0 : Full_adder PORT MAP(
						A => A(i),
						B => B(i),
						Cin => Cin,
						Y => Sum(i),
						Cout => s_carry(i)
					      );
		end generate IF0;
		
		IFi : if i > 0 AND i < N-1 generate
			FAi : Full_adder PORT MAP(
						A => A(i),
						B => B(i),
						Cin => s_carry(i-1),
						Y => Sum(i),
						Cout => s_carry(i)
					      );
		end generate IFi;
		
		IFN : if i = N-1 generate
			FAN : Full_adder PORT MAP(
						A => A(i),
						B => B(i),
						Cin => s_carry(i-1),
						Y => Sum(i),
						Cout => Cout
					      );
		end generate IFN;
	end generate GEN_FA;

end Behavioral;

