----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:00:15 05/22/2018 
-- Design Name: 
-- Module Name:    Memory_plus_DRAM - Behavioral 
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

entity Memory_plus_DRAM is
	generic(NBIT_DATA : integer := 32;
	        NBIT_ADDRESS : integer := 10);
	port(
		MD_data_in	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		MD_address	: in  std_logic_vector(NBIT_ADDRESS-1 downto 0);
		MD_enable		: in  std_logic;
		MD_RD_wr		: in  std_logic;
		MD_rst		: in  std_logic;
		MD_clk		: in  std_logic;
		MD_reduce		: in  std_logic;
		MD_BYTE_half	: in  std_logic;
		
		MD_data_rd	: out std_logic_vector(NBIT_DATA-1 downto 0);
		MD_data_wr	: out std_logic_vector(NBIT_DATA-1 downto 0);
		MD_RD_wr_out	: out std_logic
	);

end Memory_plus_DRAM;

architecture Behavioral of Memory_plus_DRAM is
	
	component Memory_Stage is
	generic(NBIT_DATA 		: integer := 32;
	        NBIT_ADDRESS 	: integer := 32);
	port(
		ME_data_in	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		ME_address	: in  std_logic_vector(NBIT_ADDRESS-1 downto 0);
		ME_clk		: in  std_logic;
		ME_rst		: in  std_logic; -- 1 active, 0 else
		ME_enable		: in  std_logic; -- 1 active, 0 else
		ME_RD_wr		: in  std_logic;
		ME_reduce		: in  std_logic;
		ME_BYTE_half	: in  std_logic;
		
		ME_data_to_mem	: out  std_logic_vector(NBIT_DATA-1 downto 0);
		ME_address_to_mem	: out  std_logic_vector(NBIT_ADDRESS-1 downto 0);
		ME_rst_to_mem	: out  std_logic; -- 1 active, 0 else
		ME_enable_to_mem	: out  std_logic; -- 1 active, 0 else
		ME_RD_wr_to_mem	: out  std_logic;
		
		ME_data_from_mem	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		
		ME_data_rd_out	: out std_logic_vector(NBIT_DATA-1 downto 0);
		ME_data_wr_out	: out std_logic_vector(NBIT_DATA-1 downto 0);
		ME_RD_wr_out	: out std_logic
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
	
	signal s_data_from_ME_to_DRAM		: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_address_from_ME_to_DRAM	: std_logic_vector(NBIT_ADDRESS-1 downto 0);
	signal s_rst, s_enable, s_RD_wr	: std_logic;
	signal s_data_from_DRAM_to_ME		: std_logic_vector(NBIT_DATA-1 downto 0);
	
begin

	MEM : Memory_Stage GENERIC MAP (NBIT_DATA => NBIT_DATA, NBIT_ADDRESS => NBIT_ADDRESS)
			PORT MAP (
				ME_data_in => MD_data_in,
				ME_address => MD_address,
				ME_clk	 => MD_clk,
				ME_rst	=> MD_rst,	
				ME_enable	=> MD_enable,	
				ME_RD_wr	=> MD_RD_wr,
				ME_Reduce	=> MD_Reduce,
				ME_BYTE_half => MD_BYTE_half,
		
				ME_data_to_mem => s_data_from_ME_to_DRAM,	
				ME_address_to_mem	=> s_address_from_ME_to_DRAM,
				ME_rst_to_mem	=> s_rst,
				ME_enable_to_mem	=> s_enable,
				ME_RD_wr_to_mem     => s_RD_wr,
		
				ME_data_from_mem	=> s_data_from_DRAM_to_ME,
		
				ME_data_rd_out      => MD_data_rd,	
				ME_data_wr_out	=> MD_data_wr,
				ME_RD_wr_out	=> MD_RD_wr_out
			);
			
	DataRAM : DRAM GENERIC MAP (NBIT_ADDRESS => NBIT_ADDRESS, D_SIZE => NBIT_DATA)
			PORT MAP (
				Rst => s_rst,
				Addr => s_address_from_ME_to_DRAM,
				Enable => s_enable,
				RD_wr => s_RD_wr,
				Din => s_data_from_ME_to_DRAM,
				Dout => s_data_from_DRAM_to_ME
			);

end Behavioral;

