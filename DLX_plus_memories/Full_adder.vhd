----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:28:31 10/04/2017 
-- Design Name:    Alessandro Salvato
-- Module Name:    Full_adder - Structural 
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

entity Full_adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Y : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end Full_adder;

architecture Structural of Full_adder is

	signal s1, s2, s3 : std_logic;
begin
	
	s1   <= A  XOR B;
	s2   <= s1 AND Cin;
	s3   <= A  AND B;
	
	Y    <= s1 XOR Cin;
	Cout <= s2 OR s3;


end Structural;

