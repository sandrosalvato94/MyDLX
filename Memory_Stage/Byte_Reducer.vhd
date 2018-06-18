----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:25:43 06/18/2018 
-- Design Name: 
-- Module Name:    Byte_Reducer - Behavioral 
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

entity Byte_Reducer is
	generic(NBIT_DATA : integer := 32);
	port(
		BR_data_in	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		BR_reduce	: in  std_logic;
		BR_data_out	: out std_logic_vector(NBIT_DATA-1 downto 0);
	);
end Byte_Reducer;

architecture Behavioral of Byte_Reducer is

begin


end Behavioral;

