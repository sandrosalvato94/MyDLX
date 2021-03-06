----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 	Alessandro Salvato
-- 
-- Create Date:    16:07:05 05/22/2018 
-- Design Name: 
-- Module Name:    WriteBack_Stage - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision 0.4
-- Revision 0.2 - Added Sign Extender Byte component
--				0.3 - Changed pinout in according to Sign Extender Byte modifications.
--					   WB_SGN_usg signal added
--	  0.4 - Changed the pinout (WB_reduce) due to Sign Reducer modifications
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

entity WriteBack_Stage is
	generic(NBIT_DATA : integer := 32);
	port(
		WB_OpA		: in  std_logic_vector(NBIT_DATA-1 downto 0);
		WB_OpB		: in  std_logic_vector(NBIT_DATA-1 downto 0);
		WB_sel		: in  std_logic;
		WB_reduce		: in  std_logic;
		WB_BYTE_half 	: in  std_logic;
		WB_SGN_usg	: in  std_logic;
		WB_out		: out std_logic_vector(NBIT_DATA-1 downto 0)
	);
end WriteBack_Stage;

architecture Structural of WriteBack_Stage is

	component Mux_NBit_2x1 is
	generic(NBIT_IN: integer := 32);
	port(
		port0	: in  std_logic_vector(NBIT_IN-1 downto 0);
		port1	: in  std_logic_vector(NBIT_IN-1 downto 0);
		sel	: in  std_logic;
		portY	: out std_logic_vector(NBIT_IN-1 downto 0)
	);
	end component;
	
	component Sign_Reducer is
	generic(NBIT_data	: integer := 32);
	port(
		SR_data_in		: in  std_logic_vector(NBIT_DATA - 1 downto 0);
		SR_reduce		: in  std_logic;
		SR_BYTE_half	: in  std_logic;
		SR_SGN_usg		: in  std_logic; --[1 for signed or transparent / 0 for unsigned]
		SR_data_out	: out std_logic_vector(NBIT_DATA - 1 downto 0)
	);
	end component;
	
	signal s_tmp : std_logic_vector(NBIT_DATA-1 downto 0);
	
begin

	WB_MUX : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) PORT MAP (
							port0 => WB_OpA,
							port1 => WB_OpB,
							sel => WB_sel,
							portY => s_tmp
						);
						
	WB_SGB : Sign_Reducer GENERIC MAP (NBIT_DATA => NBIT_DATA) PORT MAP (
									SR_data_in => s_tmp,
									SR_reduce => WB_reduce,
									SR_BYTE_half => WB_BYTE_half,
									SR_SGN_usg => WB_SGN_usg,
									SR_data_out => WB_out
								);
	
end Structural;

