----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Alessandro Salvato
-- 
-- Create Date:    16:14:44 10/20/2017 
-- Design Name: 
-- Module Name:    Enable_Interface - Behavioral 
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

entity Enable_Interface is
	generic(NBIT_DATA : integer := 32);
	port(
		EI_datain	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		EI_enable	: in  std_logic;
		EI_dataout: out std_logic_vector(NBIT_DATA-1 downto 0) 
	);
end Enable_Interface;

architecture Behavioral of Enable_Interface is

begin

	cyc : for i in 0 to NBIT_DATA-1 generate
		EI_dataout(i) <= EI_datain(i) AND EI_enable;
	end generate cyc;

end Behavioral;

