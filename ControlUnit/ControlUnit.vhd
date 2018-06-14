----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:23:58 06/13/2018 
-- Design Name: 
-- Module Name:    ControlUnit - Behavioral 
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

entity ControlUnit is
	port(
		CU_instr_opcode	: in  std_logic_vector(5 downto 0);
		CU_instr_func		: in  std_logic_vector(10 downto 0);
		CU_enable			: in  std_logic;
		CU_reset				: in  std_logic;
		CU_clk				: in  std_logic;
		CU_CW_FE				: out	std_logic_vector(13 downto 0);
		CU_CW_DE				: out	std_logic_vector(13 downto 0);
		CU_CW_EX				: out	std_logic_vector(13 downto 0);
		CU_CW_MEM			: out	std_logic_vector(13 downto 0);
		CU_CW_WB				: out	std_logic_vector(13 downto 0);
		CU_error				: out std_logic
	);
end ControlUnit;

architecture Behavioral of ControlUnit is

begin

	instr_decoding_proc : process(CU_instr_opcode, CU_instr_func, CU_enable)
	begin
	
	end process;

end Behavioral;

