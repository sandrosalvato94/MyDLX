----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:16:00 09/28/2017 
-- Design Name: 
-- Module Name:    JK_FF - Behavioral 
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
use work.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity JK_FF is
    Port ( J : in  STD_LOGIC;
           K : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           notQ : out  STD_LOGIC);
end JK_FF;

architecture ResetToZero of JK_FF is

	signal data : std_logic;

begin
	process(clk, reset)
	begin
		if(reset = '1') then
			data <= '0';
		elsif(clk'event and clk= '1') then
			if(J = '1' and K = '0') then
				data <= '1';
			end if;
			if(J = '0' and K = '1') then
				data <= '0';
			end if;
			if(J = '1' and K = '1') then
				data <= NOT(data);
			end if;
		end if;
		
	end process;
	
	Q <= data;
	notQ <= not(data);
	
end ResetToZero;

architecture ResetToOne of JK_FF is

	signal data : std_logic;

begin
	process(clk, reset)
	begin
		if(reset = '1') then
			data <= '1';
		elsif(clk'event and clk= '1') then
			if(J = '1' and K = '0') then
				data <= '1';
			end if;
			if(J = '0' and K = '1') then
				data <= '0';
			end if;
			if(J = '1' and K = '1') then
				data <= NOT(data);
			end if;
		end if;
		
	end process;
	
	Q <= data;
	notQ <= not(data);
	
end ResetToOne;

--configuration CFG_JK_FF_RST0 of JK_FF is
--    for ResetToZero
--    end for;
--end configuration CFG_JK_FF_RST0;
--
--configuration CFG_JK_FF_RST1 of JK_FF is
--    for ResetToOne
--    end for;
--end configuration CFG_JK_FF_RST1;

