----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Alessandro Salvato
-- 
-- Create Date:    15:39:50 10/16/2017 
-- Design Name: 
-- Module Name:    Sign_Extender - Behavioral 
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

entity Sign_Extender is
	generic(NBIT_DATA : integer := 32);
	port(
		SE_I_J	: in  std_logic; -- high immediate, low jump
		SE_S_U	: in  std_logic; -- high signed,  low unsigned
		SE_in	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		SE_out	: out std_logic_vector(NBIT_DATA-1 downto 0)
	);
end Sign_Extender;

architecture Behavioral of Sign_Extender is

	component Mux_NBit_2x1 is
	generic(NBIT_IN: integer := 32);
	port(
		port0	: in  std_logic_vector(NBIT_IN-1 downto 0);
		port1	: in  std_logic_vector(NBIT_IN-1 downto 0);
		sel	: in  std_logic;
		portY	: out std_logic_vector(NBIT_IN-1 downto 0)
	);
	end component;

	signal s_and1, s_and2 : std_logic;
	signal s_tmp1, s_tmp3 : std_logic_vector(25 downto 16);
	signal s_tmp2	  : std_logic_vector(31 downto 26);
	
begin

	s_and1 <= SE_in(15) AND SE_S_U;
	s_and2 <= SE_in(25) AND SE_S_U;
	
	SE_out(15 downto 0) <= SE_in(15 downto 0);
	
	MUX_IMM : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => 10) PORT MAP(
						 port0 => (others => '0'),
						 port1 => (others => '1'),
						 sel => s_and1,
						 portY => s_tmp1
						 );
						 
	MUX_JMP : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => 6) PORT MAP(
						 port0 => (others => '0'),
						 port1 => (others => '1'),
						 sel => s_and2,
						 portY => s_tmp2
						 );
	MUX_IMM_OUT :Mux_NBit_2x1 GENERIC MAP (NBIT_IN => 10) PORT MAP(
						 port0 => SE_in(25 downto 16),
						 port1 => s_tmp1,
						 sel => SE_I_J,
						 portY => s_tmp3
						 );
	SE_out(25 downto 16) <= s_tmp3;
	
	MUX_JMP_OUT :Mux_NBit_2x1 GENERIC MAP (NBIT_IN => 6) PORT MAP(
						 port0 => s_tmp2,
						 port1 => s_tmp3(25 downto 20),
						 sel => SE_I_J,
						 portY => SE_out(31 downto 26)
						 );

end Behavioral;

