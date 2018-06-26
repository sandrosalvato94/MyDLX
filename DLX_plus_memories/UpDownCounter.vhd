----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Alessandro Salvato
-- 
-- Create Date:    19:31:23 09/28/2017 
-- Design Name:    Saturation Counter for Branch Target Buffer & Branch History Table
-- Module Name:    UpDownCounter - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: This component is customized for BTB. If fact two kind of JK FF
--	      are instantiated. The former sets to 0 when is under resetting, 
--	      the latter sets to 1 instead. This feature is useful when a new
--	      row is written: the entry and target fields are updated as well
--	      as the prediction state, stored in the saturation counter. The 
--	      default state, for a new entry, is forced to 1000 (if the number
--	      of prediction bit is 4), it's a WEAK_TAKEN state as near as 
--	      possible to the WEAK_UNTAKEN state.
--
-- Dependencies: 
--
-- Revision: 1.0
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

entity UpDownCounter is
	generic(N: integer := 2);
	port(
		UPD_clk		: in  std_logic;
		UPD_reset		: in  std_logic;
		UPD_enable	: in  std_logic;
		UPD_Ud		: in  std_logic;
		UPD_out		: out std_logic_vector(N-1 downto 0)
	);
end UpDownCounter;

architecture Structural of UpDownCounter is

	component JK_FF is
	Port ( J : in  STD_LOGIC;
	       K : in  STD_LOGIC;
	       clk : in  STD_LOGIC;
	       reset : in  STD_LOGIC;
                 Q : out  STD_LOGIC;
                 notQ : out  STD_LOGIC);
	end component;
	
	
	signal s_clk_enable	: std_logic;
	signal s_and1 	: std_logic_vector(N-1 downto 0);
	signal s_and2 	: std_logic_vector(N-1 downto 0);
	signal s_tmp_not 	: std_logic;
	signal s_and3 	: std_logic_vector(N-1 downto 0);
	signal s_and4 	: std_logic_vector(N-1 downto 0);
	signal s_or1	: std_logic_vector(N-1 downto 0);
	signal s_or2	: std_logic_vector(N-1 downto 0);
	signal s_ud	: std_logic_vector(N-1 downto 0);
	   
	
begin
	
	s_clk_enable <= UPD_clk AND UPD_enable;
	
	s_tmp_not <= NOT(UPD_Ud);
	s_and1(0) <= UPD_Ud;
	s_and4(0) <= s_tmp_not;
	
	GEN_FF: for i in 0 to N-1 generate
		
		IF0 : if (i = 0) generate --LSB
			FF_JK0 : entity work.JK_FF(ResetToZero) 
				     PORT MAP (J => '1',
					     K => '1',
					     clk => s_clk_enable,
					     reset => UPD_reset,
					     Q => s_and2(i),
					     notQ => s_and3(i));
			s_and1(i+1) <= s_or1(i);
			s_and4(i+1) <= s_or2(i);
			s_or1(i) <= s_and1(i) AND s_and2(i);
			s_or2(i) <= s_and3(i) AND s_and4(i);
			s_ud(i) <= s_or1(i) OR s_or2(i);
		end generate IF0;
		
		IFi_Rst1 : if (i > 0 AND i < N-1) generate
			FF_JKi_Rst1 : entity work.JK_FF(ResetToZero) 
				     PORT MAP (J => s_ud(i-1),
					     K => s_ud(i-1),
					     clk => s_clk_enable,
					     reset => UPD_reset,
					     Q => s_and2(i),
					     notQ => s_and3(i));
			s_and1(i+1) <= s_or1(i);
			s_and4(i+1) <= s_or2(i);
			s_or1(i) <= s_and1(i) AND s_and2(i);
			s_or2(i) <= s_and3(i) AND s_and4(i);
			s_ud(i) <= s_or1(i) OR s_or2(i);
		end generate IFi_Rst1;
		
		
		IFN : if (i = N-1) generate --MSB
			FF_JKN : entity work.JK_FF(ResetToOne) 
			               PORT MAP (J => s_ud(i-1),
					     K => s_ud(i-1),
					     clk => s_clk_enable,
					     reset => UPD_reset,
					     Q => s_and2(i));
					     --notQ => );
		
		end generate IFN;
		
--		s_and1(i+1) <= s_or1(i);
--		s_and4(i+1) <= s_or2(i);
--		s_or1(i) <= s_and1(i) AND s_and2(i);
--		s_or2(i) <= s_and3(i) AND s_and4(i);
--		s_ud(i) <= s_or1(i) OR s_or2(i);
	end generate GEN_FF;
	
	UPD_out <= s_and2;
	
	

end Structural;

--configuration CFG_UPD_COUNTER_STR of UpDownCounter is
--  for Structural
--    for FF_JK0 : JK_FF
--      use entity JK_FF(ResetToZero);
--    end for;
--    for FF_JKi : JK_FF
--      use entity JK_FF(ResetToZero);
--    end for;
--    for FF_JKN : JK_FF
--      use entity JK_FF(ResetToOne);
--    end for;
--  end for;
--end configuration CFG_UPD_COUNTER_STR;
