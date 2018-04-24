----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Alessandro Salvato
-- 
-- Create Date:    19:18:08 10/20/2017 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
	generic(NBIT_DATA : integer := 32);
	port(
		ALU_OpA		: in  std_logic_vector(NBIT_DATA-1 downto 0);
		ALU_OpB		: in  std_logic_vector(NBIT_DATA-1 downto 0);
		--ALU_func_unit_enable: in  std_logic_vector(1 downto 0); --2 bits as 3 functional unit
		ALU_Opcode	: in  std_logic_vector(4 downto 0);
		
		ALU_output	: out std_logic_vector(NBIT_DATA-1 downto 0);
		ALU_flags		: out std_logic_vector(4 downto 0)
	);
end ALU;

architecture Structural of ALU is

	component Barrel_Shifter is
	generic(--NBIT_DATA : integer := 16; NBIT_DATA = 2**NBIT_AMOUNT
	        NBIT_AMOUNT : integer := 5);
	port(
		BS_data_in	: in  std_logic_vector(2**NBIT_AMOUNT-1 downto 0);
		BS_opcode		: in  std_logic_vector(1 downto 0); 
		BS_amount		: in  std_logic_vector(NBIT_AMOUNT-1 downto 0);
		BS_data_out	: out std_logic_vector(2**NBIT_AMOUNT-1 downto 0)
	);
	end component;

begin


end Structural;

