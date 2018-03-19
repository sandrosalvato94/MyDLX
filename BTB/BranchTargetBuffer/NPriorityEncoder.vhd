----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Alessandro Salvato
-- 
-- Create Date:    12:20:13 09/14/2017 
-- Design Name: 
-- Module Name:    NPriorityEncoder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: This is a generic priority encoder, whereby is needed to specify
--	      the parallelism for the output rather than the input port.
--	      This device works only if the enable signal is high, otherwise
--	      the output is forced to all 0s.
--	
--	      
--	      A(0) | A(1) | A(2) | A(3) | Y(0) | Y(1) 
--	       0	    0      0      0   |   0      0      
--	       0      0      0      1   |   1      1        
--               0      0      1      0   |   1      0
--               0      0      1      1	  |   1      1
--	       0      1      0      0   |   0      1
--	       0      1      0      1   |   1      1
--               0      1      1      0   |   1      0
--               0      1      1      1   |   1      1
--	       1      0      0      0   |   0      0
--	       1      0      0      1   |   1      1
--               1      0      1      0   |   1      0
--               1      0      1      1   |   1      1
--	       1      1      0      0   |   0      1
--	       1      1      0      1   |   1      1
--               1      1      1      0   |   1      0
--               1      1      1      1   |   1      1
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
-- Tested and synthetized (Xilinx) for NBIT_OUT = 1, 2, 3, 5
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity NPriorityEncoder is
	generic(NBIT_OUT : integer := 5);
	port(
		data_in : in  std_logic_vector(2**NBIT_OUT-1 downto 0);
		enable:	in  std_logic;
		data_out: out std_logic_vector(NBIT_OUT-1 downto 0)
	);
end NPriorityEncoder;

architecture Behavioral of NPriorityEncoder is

	signal s_zeros : std_logic_vector(0 to 2**NBIT_OUT-1) := (others => '0');

begin

	process(data_in, enable)
	begin
		if(enable = '0') then
			data_out <= (others => '0');
		else
			if (data_in = s_zeros) then
				data_out <= (others => '0');
			else
				for i in 0 to 2**NBIT_OUT-1 loop
					if(data_in(i) = '1') then
						data_out <= std_logic_vector(to_unsigned(i, NBIT_OUT));
					end if;
				end loop;
			end if;
		end if;
	end process;


end Behavioral;

