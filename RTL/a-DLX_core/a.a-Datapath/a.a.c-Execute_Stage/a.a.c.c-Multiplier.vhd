----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 	Alessandro Salvato
-- 
-- Create Date:    10:15:17 05/07/2018 
-- Design Name: 
-- Module Name:    Multiplier - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:	This is a simple behavioral multipliare which is able to
--		perform both signed and unsigned multiplications depending
--		on the value of MUL_SGN_usgn as input.
--	
--
--		MUL_SGN_usgn	0	Unsigned values
--		MUL_SGN_usgn	1	Signed values
--
--
--		The output is 2 times the parallelism of the input operands
--
-- Dependencies: 
--
-- Revision: 
--	Version 0.9 - Test T1, T2, T3, T4, T5 passed. Ready for synthesis.
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

entity Multiplier is
	generic(NBIT_DATA : integer := 32);
	port(
		MUL_OpA 		: in  std_logic_vector(NBIT_DATA-1 downto 0);
		MUL_OpB 		: in  std_logic_vector(NBIT_DATA-1 downto 0);
		MUL_SGN_usgn 	: in  std_logic; -- 1 signed, 0 unsigned
		MUL_product	: out std_logic_vector(2*NBIT_DATA-1 downto 0)
	);
end Multiplier;

architecture Behavioral of Multiplier is
	
	signal s_tmp_product	: std_logic_vector(2*NBIT_DATA-1 downto 0);
	
begin

	process(MUL_OpA, MUL_OpB, MUL_SGN_usgn)
	begin
	if_sgn : if (MUL_SGN_usgn = '1') then
		MUL_product <= std_logic_vector((signed(MUL_OpA)*signed(MUL_OpB)));
	end if;
	
	if_usg: if (MUL_SGN_usgn = '0') then
		MUL_product <= std_logic_vector((unsigned(MUL_OpA)*unsigned(MUL_OpB)));
	end if;
	end process;

end Behavioral;

