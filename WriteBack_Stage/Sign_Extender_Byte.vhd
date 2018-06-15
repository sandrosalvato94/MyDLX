----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:18:28 06/15/2018 
-- Design Name: 
-- Module Name:    Sign_Extender_Byte - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 1.0 - T1a, T1b, T2, T3 passed
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

entity Sign_Extender_Byte is
	generic(NBIT_data	: integer := 32);
	port(
		SEB_data_in		: in  std_logic_vector(NBIT_DATA - 1 downto 0);
		SEB_is_byte		: in  std_logic;
		SEB_SGN_usg		: in  std_logic; --[1 for signed or transparent / 0 for unsigned]
		SEB_data_out	: out std_logic_vector(NBIT_DATA - 1 downto 0)
	);
end Sign_Extender_Byte;

architecture Structural of Sign_Extender_Byte is

	component Mux_1Bit_2X1 is
    Port ( port0 : in  STD_LOGIC;
           port1 : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           portY : out  STD_LOGIC);
	end component;
	
	signal s_tmp : std_logic_vector(NBIT_data - 1 downto 8);

begin

--------------------------------------------------------------------------------
	cyc : for i in NBIT_data - 1 downto 8 generate
		
		s_tmp(i) <= SEB_data_in(i) AND SEB_SGN_usg; -- definizione da modificare
		
		MUX : Mux_1Bit_2X1 PORT MAP (
								port0 => s_tmp(i),
								port1 => SEB_data_in(7),
								sel => SEB_is_byte,
								portY => SEB_data_out(i)
								);
	end generate cyc;
	
	SEB_data_out(7 downto 0) <= SEB_data_in(7 downto 0);
--------------------------------------------------------------------------------

end Structural;

