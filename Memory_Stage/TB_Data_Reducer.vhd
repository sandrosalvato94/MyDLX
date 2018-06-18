--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:45:54 06/18/2018
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/Memory_Stage/TB_Data_Reducer.vhd
-- Project Name:  Memory_Stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Data_Reducer
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
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Data_Reducer IS
END TB_Data_Reducer;
 
ARCHITECTURE behavior OF TB_Data_Reducer IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    --------CHANGE HERE GENERICS--------
    constant NBIT_DATA : integer := 32;
    ------------------------------------
 
    COMPONENT Data_Reducer
    GENERIC(NBIT_DATA : integer := 32);
    PORT(
         DR_data_in : IN  std_logic_vector(NBIT_DATA-1 downto 0);
         DR_reduce : IN  std_logic;
         DR_BYTE_half : IN  std_logic;
         DR_data_out : OUT  std_logic_vector(NBIT_DATA-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DR_data_in : std_logic_vector(NBIT_DATA-1 downto 0) := (others => '0');
   signal DR_reduce : std_logic := '0';
   signal DR_BYTE_half : std_logic := '0';

 	--Outputs
   signal DR_data_out : std_logic_vector(NBIT_DATA-1 downto 0);
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Data_Reducer GENERIC MAP (NBIT_DATA => NBIT_DATA)
	PORT MAP (
          DR_data_in => DR_data_in,
          DR_reduce => DR_reduce,
          DR_BYTE_half => DR_BYTE_half,
          DR_data_out => DR_data_out
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 1 ns;

      --T1: Transparent mode-------------------------------------
      DR_data_in <= "0000000000010000" & "00000010" & "00010000";
      DR_reduce <= '0';
      DR_BYTE_half <= '0';
      wait for 1 ns;
      assert (DR_data_in = DR_data_out) report "Component should work in transparent mode";
      wait for 1 ns;
      
      DR_data_in <= "0000000000010000" & "00001000" & "00000001";
      DR_reduce <= '0';
      DR_BYTE_half <= '1';
      wait for 1 ns;
      assert (DR_data_in = DR_data_out) report "Component should work in transparent mode";
      wait for 1 ns;
      ----------------------------------------------------------
      
      --T2: byte mode-------------------------------------------
      DR_data_in <= "0000000000010000" & "00000010" & "00010000";
      DR_reduce <= '1';
      DR_BYTE_half <= '1';
      wait for 1 ns;
      assert (DR_data_out = "00000000000000000000000000010000") report "Component should work in byte mode";
      wait for 1 ns;
      ----------------------------------------------------------
      
      --T3: half mode-------------------------------------------
      DR_data_in <= "0000000000010000" & "00000010" & "00010000";
      DR_reduce <= '1';
      DR_BYTE_half <= '0';
      wait for 1 ns;
      assert (DR_data_out = "00000000000000000000001000010000") report "Component should work in half mode";
      wait for 1 ns;
      ----------------------------------------------------------

    
      -- insert stimulus here 

      wait;
   end process;

END;
