----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:30:27 06/18/2018 
-- Design Name: 
-- Module Name:    Data_Reducer - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 1.0
-- Revision: 1.0 - Test T1, T2, T3 passed
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

entity Data_Reducer is
	generic(NBIT_DATA : integer := 32);
	port(
		DR_data_in	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		DR_reduce		: in  std_logic;
		DR_BYTE_half	: in  std_logic;
		DR_data_out	: out std_logic_vector(NBIT_DATA-1 downto 0)
	);
end Data_Reducer;

architecture Behavioral of Data_Reducer is

	component Mux_NBit_2x1 is
	generic(NBIT_IN: integer := 32);
	port(
		port0	: in  std_logic_vector(NBIT_IN-1 downto 0);
		port1	: in  std_logic_vector(NBIT_IN-1 downto 0);
		sel	: in  std_logic;
		portY	: out std_logic_vector(NBIT_IN-1 downto 0)
	);
	end component;
	
	signal s_zeros_byte	: std_logic_vector(NBIT_DATA-1 downto 8)  := (others => '0');
	signal s_zeros_half : std_logic_vector(NBIT_DATA-1 downto 16) := (others => '0');
	
	signal s_tmpB	: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_tmpH	: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_tmp	: std_logic_vector(NBIT_DATA-1 downto 0);


begin

	s_tmpB <= s_zeros_byte & DR_data_in(7 downto 0);
	s_tmpH <= s_zeros_half & DR_data_in(15 downto 0);
	
	MUX_B_H : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) PORT MAP (
							port0 => s_tmpH,
							port1 => s_tmpB,
							sel => DR_BYTE_half,
							portY => s_tmp
							);
	MUX_OUT : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) PORT MAP (
							port0 => DR_data_in,
							port1 => s_tmp,
							sel => DR_reduce,
							portY => DR_data_out
							);

end Behavioral;

