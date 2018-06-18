----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:18:28 06/15/2018 
-- Design Name: 
-- Module Name:    Sign_Reducer - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--				SR_is_byte	SR_SGN_usg				SR_data_out		TBChanged
--						0				0		   			data_in
--						0				1						data_in
--						1				0		 	 0[31..24] & data_in[7..0]
--						1				1			data_in[7] & data_in[7..0]
--
--					Combination of (0, 0) signals behaviors as transparent mode
-- Dependencies: 
--
-- Revision: 1.0 - T1a, T1b, T2, T3 passed.
--				 2.0 - 1.0 version doesn't take care LBU instruction, which has been
--						 added in the instruction set after the previous release.
--						 T1a, T1b, T2, T3 passed.
--				 3.0 - 2.0 version doesn't take care LH and LHU instruction, which
--				       have been added in the instruction set after the previous release.
--						 
--
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

entity Sign_Reducer is
	generic(NBIT_data	: integer := 32);
	port(
		SR_data_in		: in  std_logic_vector(NBIT_DATA - 1 downto 0);
		SR_reduce		: in  std_logic;
		SR_BYTE_half	: in  std_logic;
		SR_SGN_usg		: in  std_logic; --[1 for signed or transparent / 0 for unsigned]
		SR_data_out	: out std_logic_vector(NBIT_DATA - 1 downto 0)
	);
end Sign_Reducer;

architecture Structural of Sign_Reducer is

	component Mux_NBit_2x1 is
	generic(NBIT_IN: integer := 32);
	port(
		port0	: in  std_logic_vector(NBIT_IN-1 downto 0);
		port1	: in  std_logic_vector(NBIT_IN-1 downto 0);
		sel	: in  std_logic;
		portY	: out std_logic_vector(NBIT_IN-1 downto 0)
	);
	end component;
	
	component Mux_1Bit_2X1 is
    Port ( port0 : in  STD_LOGIC;
           port1 : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           portY : out  STD_LOGIC);
	end component;
	
	signal s_tmp : std_logic_vector(NBIT_DATA-1 downto 8);
	signal s_tmpB: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_tmpH: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_tmp2: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_msb : std_logic;

begin

--------------------------------------------------------------------------------
	MUX_msb	: Mux_1Bit_2X1 PORT MAP (
									port0 => SR_data_in(15),
									port1 => SR_data_in(7),
									sel => SR_BYTE_half,
									portY => s_msb
									);
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------	
	cyc : for i in NBIT_data - 1 downto 8 generate
		s_tmp(i) <= s_msb AND SR_SGN_usg;
	end generate cyc;
	
	s_tmpB <= s_tmp(NBIT_DATA-1 downto 8) & SR_data_in(7 downto 0);
	s_tmpH <= s_tmp(NBIT_DATA-1 downto 16) & SR_data_in(15 downto 0);
	
	MUX_B_H : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) PORT MAP (
																				port0 => s_tmpH,
																				port1 => s_tmpB, 
																				sel => SR_BYTE_half,
																				portY => s_tmp2
																			);
	
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
	MUX_OUT : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) PORT MAP (
																				port0 => SR_data_in,
																				port1 => s_tmp2, 
																				sel => SR_reduce,
																				portY => SR_data_out
																			);
--------------------------------------------------------------------------------

end Structural;

