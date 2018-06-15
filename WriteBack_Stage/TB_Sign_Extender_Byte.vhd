--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:25:10 06/15/2018
-- Design Name:   
-- Module Name:   C:/Users/Alessandro/Documents/GitHub/MyDLX/WriteBack_Stage/TB_Sign_Extender_Byte.vhd
-- Project Name:  WriteBack_Stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Sign_Extender_Byte
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY TB_Sign_Extender_Byte IS
END TB_Sign_Extender_Byte;
 
ARCHITECTURE behavior OF TB_Sign_Extender_Byte IS 
	
	-------CHANGE HERE GENERICS--------
	constant NBIT_DATA : integer := 32;
	-----------------------------------
	
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sign_Extender_Byte
	 GENERIC(NBIT_DATA : integer := 32);
    PORT(
         SEB_data_in : IN  std_logic_vector(NBIT_DATA-1 downto 0);
         SEB_is_byte : IN  std_logic;
         SEB_data_out : OUT  std_logic_vector(NBIT_DATA-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SEB_data_in : std_logic_vector(NBIT_DATA-1 downto 0) := (others => '0');
   signal SEB_is_byte : std_logic := '0';

 	--Outputs
   signal SEB_data_out : std_logic_vector(NBIT_DATA-1 downto 0);
   
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sign_Extender_Byte GENERIC MAP (NBIT_DATA => NBIT_DATA) PORT MAP (
          SEB_data_in => SEB_data_in,
          SEB_is_byte => SEB_is_byte,
          SEB_data_out => SEB_data_out
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 1 ns;	
		
		--TEST 1a: Transparent mode------------------------------
		SEB_data_in <= "000000100000000000000000" & "00000000";
		SEB_is_byte <= '0';
		wait for 1 ns;
		--------------------------------------------------------
		
		--TEST 1b: Transparent mode------------------------------
		SEB_data_in <= "000000100000000000000000" & "10000000";
		SEB_is_byte <= '0';
		wait for 1 ns;
		--------------------------------------------------------
		
		--TEST 2: Byte mode positive-----------------------------
		SEB_data_in <= "001000100000000000000000" & "00000100";
		SEB_is_byte <= '1';
		wait for 1 ns;
		--------------------------------------------------------
		
		--TEST 3: Byte mode negative-----------------------------
		SEB_data_in <= "001000100001000000000000" & "10000100";
		SEB_is_byte <= '1';
		wait for 1 ns;
		--------------------------------------------------------


      wait;
   end process;

END;
