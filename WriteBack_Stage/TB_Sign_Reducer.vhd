--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:25:10 06/15/2018
-- Design Name:   
-- Module Name:   C:/Users/Alessandro/Documents/GitHub/MyDLX/WriteBack_Stage/TB_Sign_Reducer.vhd
-- Project Name:  WriteBack_Stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Sign_Reducer
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
 
ENTITY TB_Sign_Reducer IS
END TB_Sign_Reducer;
 
ARCHITECTURE behavior OF TB_Sign_Reducer IS 
	
	-------CHANGE HERE GENERICS--------
	constant NBIT_DATA : integer := 32;
	-----------------------------------
	
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sign_Reducer
	 GENERIC(NBIT_DATA : integer := 32);
    PORT(
         SR_data_in : IN  std_logic_vector(NBIT_DATA-1 downto 0);
         SR_reduce	: IN std_logic;
			SR_BYTE_half : IN  std_logic;
			SR_SGN_usg		: in  std_logic; --[1 for signed or transparent / 0 for unsigned]
         SR_data_out : OUT  std_logic_vector(NBIT_DATA-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SR_data_in : std_logic_vector(NBIT_DATA-1 downto 0) := (others => '0');
	signal SR_Reduce	: std_logic := '0';
   signal SR_BYTE_half : std_logic := '0';
	signal SR_SGN_usg : std_logic := '0'; --[1 for signed or transparent / 0 for unsigned]

 	--Outputs
   signal SR_data_out : std_logic_vector(NBIT_DATA-1 downto 0);
   
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sign_Reducer GENERIC MAP (NBIT_DATA => NBIT_DATA) PORT MAP (
          SR_data_in => SR_data_in,
          SR_Reduce => SR_Reduce,
			 SR_BYTE_half => SR_BYTE_half,
			 SR_SGN_usg => SR_SGN_usg,
          SR_data_out => SR_data_out
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 1 ns;	
		
		--TEST 1a: Transparent mode------------------------------
		SR_data_in <= "0000001000000000" & "00000000" & "00000000";
		SR_Reduce <= '0';
		SR_BYTE_half <= '0';
		SR_SGN_usg <= '0';
		wait for 1 ns;
		
		SR_data_in <= "0000001000000000" & "00000000" & "00000000";
		SR_Reduce <= '0';
		SR_BYTE_half <= '0';
		SR_SGN_usg <= '1';
		wait for 1 ns;
		
		SR_data_in <= "0000001000000000" & "00000000" & "00000000";
		SR_Reduce <= '0';
		SR_BYTE_half <= '1';
		SR_SGN_usg <= '0';
		wait for 1 ns;
		
		SR_data_in <= "0000001000000000" & "00000000" & "00000000";
		SR_Reduce <= '0';
		SR_BYTE_half <= '1';
		SR_SGN_usg <= '1';
		wait for 1 ns;
		----------------------------------------------------------
		
		--TEST 1b: Transparent mode------------------------------
		SR_data_in <= "0000001000000000" & "00000000" & "10000000";
		SR_Reduce <= '0';
		SR_BYTE_half <= '0';
		SR_SGN_usg <= '0';
		wait for 1 ns;
		
		SR_data_in <= "0000001000000000" & "00000000" & "10000000";
		SR_Reduce <= '0';
		SR_BYTE_half <= '0';
		SR_SGN_usg <= '1';
		wait for 1 ns;
		
		SR_data_in <= "0000001000000000" & "00000000" & "10000000";
		SR_Reduce <= '0';
		SR_BYTE_half <= '1';
		SR_SGN_usg <= '0';
		wait for 1 ns;
		
		SR_data_in <= "0000001000000000" & "00000000" & "10000000";
		SR_Reduce <= '0';
		SR_BYTE_half <= '1';
		SR_SGN_usg <= '1';
		wait for 1 ns;
		----------------------------------------------------------
		
		--TEST 1c: Transparent mode------------------------------
		SR_data_in <= "0000001000000000" & "10000000" & "00000000";
		SR_Reduce <= '0';
		SR_BYTE_half <= '0';
		SR_SGN_usg <= '0';
		wait for 1 ns;
		
		SR_data_in <= "0000001000000000" & "10000000" & "00000000";
		SR_Reduce <= '0';
		SR_BYTE_half <= '0';
		SR_SGN_usg <= '1';
		wait for 1 ns;
		
		SR_data_in <= "0000001000000000" & "10000000" & "00000000";
		SR_Reduce <= '0';
		SR_BYTE_half <= '1';
		SR_SGN_usg <= '0';
		wait for 1 ns;
		
		SR_data_in <= "0000001000000000" & "10000000" & "00000000";
		SR_Reduce <= '0';
		SR_BYTE_half <= '1';
		SR_SGN_usg <= '1';
		wait for 1 ns;
		----------------------------------------------------------
		
		--TEST 1d: Transparent mode------------------------------
		SR_data_in <= "0000001000000000" & "10000000" & "10000000";
		SR_Reduce <= '0';
		SR_BYTE_half <= '0';
		SR_SGN_usg <= '0';
		wait for 1 ns;
		
		SR_data_in <= "0000001000000000" & "10000000" & "10000000";
		SR_Reduce <= '0';
		SR_BYTE_half <= '0';
		SR_SGN_usg <= '1';
		wait for 1 ns;
		
		SR_data_in <= "0000001000000000" & "10000000" & "10000000";
		SR_Reduce <= '0';
		SR_BYTE_half <= '1';
		SR_SGN_usg <= '0';
		wait for 1 ns;
		
		SR_data_in <= "0000001000000000" & "10000000" & "10000000";
		SR_Reduce <= '0';
		SR_BYTE_half <= '1';
		SR_SGN_usg <= '1';
		wait for 1 ns;
		----------------------------------------------------------

		
		--TEST 2: Byte mode positive-----------------------------
		SR_data_in <= "0000001000000000" & "00000000" & "00000000";
		SR_Reduce <= '1';
		SR_BYTE_half <= '1';
		SR_SGN_usg <= '0';
		wait for 1 ns;
		
		SR_data_in <= "0000001000000000" & "00000000" & "00000000";
		SR_Reduce <= '1';
		SR_BYTE_half <= '1';
		SR_SGN_usg <= '1';
		wait for 1 ns;
		--------------------------------------------------------
		
		--TEST 3: Byte mode negative-----------------------------
		SR_data_in <= "0000001000000000" & "00000000" & "10000000";
		SR_Reduce <= '1';
		SR_BYTE_half <= '1';
		SR_SGN_usg <= '0';
		wait for 1 ns;
		
		SR_data_in <= "0000001000000000" & "00000000" & "10000000";
		SR_Reduce <= '1';
		SR_BYTE_half <= '1';
		SR_SGN_usg <= '1';
		wait for 1 ns;
		--------------------------------------------------------
		
		--TEST 4: Half mode positive-----------------------------
		SR_data_in <= "0000001000000000" & "00000100" & "10000000";
		SR_Reduce <= '1';
		SR_BYTE_half <= '0';
		SR_SGN_usg <= '0';
		wait for 1 ns;
		
		SR_data_in <= "0000001000000000" & "00010000" & "10000000";
		SR_Reduce <= '1';
		SR_BYTE_half <= '0';
		SR_SGN_usg <= '1';
		wait for 1 ns;
		--------------------------------------------------------
		
		--TEST 5: Half mode negative-----------------------------
		SR_data_in <= "0000001000000000" & "10000000" & "00000100";
		SR_Reduce <= '1';
		SR_BYTE_half <= '0';
		SR_SGN_usg <= '0';
		wait for 1 ns;
		
		SR_data_in <= "0000001000000000" & "10000000" & "00010000";
		SR_Reduce <= '1';
		SR_BYTE_half <= '0';
		SR_SGN_usg <= '1';
		wait for 1 ns;
		--------------------------------------------------------


      wait;
   end process;

END;
