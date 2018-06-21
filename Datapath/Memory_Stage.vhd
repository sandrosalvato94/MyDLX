----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 	Alessandro Salvato
-- 
-- Create Date:    14:59:27 05/21/2018 
-- Design Name: 
-- Module Name:    Memory_Stage - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 0.3
-- Revision 	0.1 - Components tied up. Not yet tested
--		0.2 - T1, T2, T3 passed. ME_RD_wr_out fixed.
--		0.3 - Changed pinout (+ ME_reduce, + ME_BYTE_half) due to 
--		      introduction of a new component: Data_Reducer. 
--		      Memory Stage not tested anymore.
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

entity Memory_Stage is
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
end Memory_Stage;

architecture Structural of Memory_Stage is

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
	
	component Data_Reducer is
	generic(NBIT_DATA : integer := 32);
	port(
		DR_data_in	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		DR_reduce		: in  std_logic;
		DR_BYTE_half	: in  std_logic;
		DR_data_out	: out std_logic_vector(NBIT_DATA-1 downto 0)
	);
	end component;

	
	signal s_data_Fdr_TDRAM	: std_logic_vector(NBIT_DATA-1 downto 0);

begin

------------------------------------------------------------------------------------
	DR : Data_Reducer GENERIC MAP (NBIT_DATA => NBIT_DATA) PORT MAP (
							DR_data_in => ME_data_in,
							DR_reduce => ME_reduce,
							DR_BYTE_half => ME_BYTE_half,
							DR_data_out => s_data_Fdr_TDRAM
							);
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
	ME_data_to_mem <= s_data_Fdr_TDRAM;
	ME_address_to_mem <= ME_address;
	ME_enable_to_mem <= ME_enable;
	ME_rst_to_mem <= NOT(ME_rst);
	ME_RD_wr_to_mem <= ME_RD_wr;
	ME_RD_wr_out <= ME_RD_wr;
------------------------------------------------------------------------------------	
	
------------------------------------------------------------------------------------
	REG_WR : NRegister GENERIC MAP (N => NBIT_DATA)
		         PORT MAP (
			clk => ME_clk,
			reset => ME_rst,
			data_in => ME_data_in,
			enable => ME_enable,
			load => '1',
			data_out => ME_data_wr_out
		         );
	REG_RD : NRegister GENERIC MAP (N => NBIT_DATA)
		         PORT MAP (
			clk => ME_clk,
			reset => ME_rst,
			data_in => ME_data_from_mem,
			enable => ME_enable,
			load => '1',
			data_out => ME_data_rd_out
		         );
------------------------------------------------------------------------------------
end Structural;

