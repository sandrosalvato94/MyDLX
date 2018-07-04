
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:09:17 05/21/2018 
-- Design Name: 
-- Module Name:    DRAM - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DRAM is
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
end DRAM;

architecture Behavioral of DRAM is

   type RAMtype is array (0 to 2**NBIT_ADDRESS - 1) of std_logic_vector(D_SIZE - 1 downto 0);
   signal DRAM_mem : RAMtype;	
	
begin
	
   READ_MEM_P: process(Rst, Enable, Addr, RD_wr)
   BEGIN
    Dout <= (others => '0');
    if (Rst = '1' and Enable = '1' and RD_wr = '1') then
      Dout <= DRAM_mem(to_integer(unsigned(Addr(NBIT_ADDRESS-1 downto 2))));
    end if;
  end process;
  
  WRITE_MEM_P: process(Rst, Enable, Addr, RD_wr, Din)
  begin
	if(Rst = '0') then
		DRAM_mem(0 to 2**NBIT_ADDRESS - 1) <= (others => (others => '0'));
	elsif(Rst = '1' and Enable = '1' and RD_wr = '0') then
		DRAM_mem(to_integer(unsigned(Addr(NBIT_ADDRESS-1 downto 2)))) <= Din;
	end if;	
  end process;

end Behavioral;

