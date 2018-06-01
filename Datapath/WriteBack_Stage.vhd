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

entity WriteBack_Stage is
	generic(NBIT_DATA : integer := 32);
	port(
		WB_OpA	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		WB_OpB	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		WB_sel	: in  std_logic;
		WB_out	: out std_logic_vector(NBIT_DATA-1 downto 0)
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
	
begin

	WB_MUX : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) PORT MAP (
							port0 => WB_OpA,
							port1 => WB_OpB,
							sel => WB_sel,
							portY => WB_out
						);
	
end Structural;

