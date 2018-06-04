----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 	Alessandro Salvato
-- 
-- Create Date:    10:54:17 05/25/2018 
-- Design Name: 
-- Module Name:    Forwarding_ControlUnit - Structural 
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

entity Forwarding_ControlUnit is
	port(
		FCU_enable	: in  std_logic;
		FCU_EX_MEM_IR_16_20	: in  std_logic_vector(4 downto 0);
		FCU_EX_MEM_IR_11_15	: in  std_logic_vector(4 downto 0);
		FCU_ID_EX_IR_11_15	: in  std_logic_vector(4 downto 0);
		FCU_ID_EX_IR_6_10	: in  std_logic_vector(4 downto 0);
		FCU_MEM_WB_IR_16_20	: in  std_logic_vector(4 downto 0);
		FCU_MEM_WB_IR_11_15	: in  std_logic_vector(4 downto 0);
		FCU_MUX_TOP_ALU	: out std_logic_vector(1 downto 0);
		FCU_MUX_BOT_ALU	: out std_logic_vector(1 downto 0)
	);
end Forwarding_ControlUnit;

architecture Structural of Forwarding_ControlUnit is
	
	
begin


end Structural;

