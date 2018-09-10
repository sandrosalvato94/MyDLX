----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:30:33 06/26/2018 
-- Design Name: 
-- Module Name:    DLX_plus_memories - Behavioral 
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

entity DLX_plus_memories is
	port(
		DLX_PM_enable	: in  std_logic;
		DLX_PM_reset	: in  std_logic;
		DLX_PM_clk		: in  std_logic;
		
		DLX_PM_error	: out std_logic
	);
end DLX_plus_memories;

architecture Behavioral of DLX_plus_memories is

	component DLX_Core is
	generic(	NBIT_DATA			 : integer := 32;
				NBIT_IRAM_ADDRESS	 : integer := 5;
				N_BTB_ENTRY			 : integer := 32;
				NBIT_BTB_PREDICTION: integer := 2);
	port(
		DLX_clk							: in  std_logic;
		DLX_reset						: in  std_logic;
		DLX_enable						: in  std_logic;
		DLX_IR							: in  std_logic_vector(31 downto 0);
		DLX_read_data					: in  std_logic_vector(NBIT_DATA-1 downto 0);
		
		DLX_written_data				: out std_logic_vector(NBIT_DATA-1 downto 0);
		DLX_address_written_data	: out std_logic_vector(2**NBIT_IRAM_ADDRESS-1 downto 0);
		DLX_PC							: out std_logic_vector(2**NBIT_IRAM_ADDRESS-1 downto 0);
		DLX_enable_DRAM				: out std_logic;
		DLX_RD_wr_DRAM					: out std_logic;
		DLX_error						: out std_logic
	);
	end component;
	
	component DRAM is
	generic (
	NBIT_ADDRESS : integer := 10;
	D_SIZE : integer := 32
   ); 
  port (
    Rst        : in  std_logic;
    Addr       : in  std_logic_vector(NBIT_ADDRESS - 1 downto 0);
    Enable     : in  std_logic;
    RD_wr	     : in  std_logic;
    Din        : in std_logic_vector(D_SIZE - 1 downto 0);
    Dout        : out std_logic_vector(D_SIZE - 1 downto 0)
    );
	end component;
	
	component IRAM is
  generic (
	IRAM_DEPTH : integer := 1024;
	I_SIZE : integer := 32
   ); 
  port (
    Rst        : in  std_logic;
    Addr       : in  std_logic_vector(I_SIZE - 1 downto 0);
    Enable     : in  std_logic;
    Dout       : out std_logic_vector(I_SIZE - 1 downto 0)
    );

	end component;
	
	constant NBIT_DATA				: integer := 32;
	constant NBIT_IRAM_ADDRESS	 	: integer := 5;
	constant	N_BTB_ENTRY			 	: integer := 32;
	constant	NBIT_BTB_PREDICTION	: integer := 2;

	signal s_IR_Firam_Tcore		: std_logic_vector(31 downto 0);
	signal s_data_Fdram_Tcore	: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_data_Fcore_Tdram	: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_not_RAM_reset		: std_logic;
	signal s_address_Fcor_Tdram: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_PC_Fcore_Tiram		: std_logic_vector(2**NBIT_IRAM_ADDRESS-1 downto 0);
	signal s_enable_Fcore_Tdram: std_logic;
	signal s_RD_wr_Fcore_Tdram	: std_logic;

begin

	DLX : DLX_Core GENERIC MAP (NBIT_DATA			   => NBIT_DATA,
										 NBIT_IRAM_ADDRESS	=> NBIT_IRAM_ADDRESS,
										 N_BTB_ENTRY			=> N_BTB_ENTRY,
										 NBIT_BTB_PREDICTION => NBIT_BTB_PREDICTION)
						PORT MAP (
		DLX_clk							=> DLX_PM_clk,
		DLX_reset						=> DLX_PM_reset,
		DLX_enable						=> DLX_PM_enable,
		DLX_IR							=> s_IR_Firam_Tcore,
		DLX_read_data					=> s_data_Fdram_Tcore,
		DLX_written_data				=> s_data_Fcore_Tdram,
		DLX_address_written_data	=> s_address_Fcor_Tdram,
		DLX_PC							=> s_PC_Fcore_Tiram,
		DLX_enable_DRAM				=> s_enable_Fcore_Tdram,
		DLX_RD_wr_DRAM					=> s_RD_wr_Fcore_Tdram,
		DLX_error						=> DLX_PM_error				
	 );
	
	s_not_RAM_reset <= NOT(DLX_PM_reset);
	
	Data_Memory : DRAM GENERIC MAP (NBIT_ADDRESS => 10, D_SIZE => NBIT_DATA) PORT MAP (
		Rst        => s_not_RAM_reset,
		Addr       => s_address_Fcor_Tdram(9 downto 0),
		Enable     => s_enable_Fcore_Tdram,
		RD_wr	     => s_RD_wr_Fcore_Tdram,
		Din        => s_data_Fcore_Tdram,
		Dout       => s_data_Fdram_Tcore
	 );
	 
	Instr_Memory : IRAM GENERIC MAP (IRAM_DEPTH => 1024, I_SIZE => 32) PORT MAP (
		Rst        => s_not_RAM_reset, 
		Addr       => s_PC_Fcore_Tiram,
		Enable     => DLX_PM_enable,
		Dout       => s_IR_Firam_Tcore
	 );

end Behavioral;

