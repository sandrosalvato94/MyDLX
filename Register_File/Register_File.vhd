----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:49:24 06/29/2018 
-- Design Name: 
-- Module Name:    Register_File - Structural 
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
use work.constants.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register_File is
	generic(NBIT_ADDR	: integer := 5;
			  NBIT_DATA : integer := 32);
	port(
			RF_clk		: in  std_logic;
			RF_reset 	: in  std_logic;
			RF_enable	: in  std_logic;
			RF_RD1		: in  std_logic;
			RF_RD2		: in  std_logic;
			RF_WR			: in  std_logic;
			RF_AddrRd1	: in  std_logic_vector(NBIT_ADDR-1 downto 0);
			RF_AddrRd2	: in  std_logic_vector(NBIT_ADDR-1 downto 0);
			RF_AddrWr	: in  std_logic_vector(NBIT_ADDR-1 downto 0);
			RF_data_in	: in  std_logic_vector(NBIT_DATA-1 downto 0);
			RF_out1		: out std_logic_vector(NBIT_DATA-1 downto 0);
			RF_out2		: out std_logic_vector(NBIT_DATA-1 downto 0)
	);
end Register_File;

architecture Structural of Register_File is

	component Decoder is
    generic(
        DEC_NBIT    :   integer :=  5);
    port(
        DEC_address :   in  std_logic_vector(DEC_NBIT-1 downto 0);
        DEC_enable  :   in  std_logic;
        DEC_output  :   out std_logic_vector(2**DEC_NBIT-1 downto 0));
	end component;
	
	component NRegister is
	generic(N: integer:= 32);
	port(
		clk:	in  std_logic;
		reset:	in  std_logic; --Active high
		data_in:	in  std_logic_vector(N-1 downto 0);
		enable:	in  std_logic;
		load:	in  std_logic; --Load enable high
		data_out: out std_logic_vector(N-1 downto 0));
	end component;
	
	component Enable_Interface is
	generic(NBIT_DATA : integer := 32);
	port(
		EI_datain	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		EI_enable	: in  std_logic;
		EI_dataout: out std_logic_vector(NBIT_DATA-1 downto 0) 
	);
	end component;
	
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


end Structural;

