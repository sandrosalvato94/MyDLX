--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:32:32 10/04/2017
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/Fetch_Stage/TB_Full_adder.vhd
-- Project Name:  
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Full_adder
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
 
ENTITY TB_Full_adder IS
END TB_Full_adder;
 
ARCHITECTURE behavior OF TB_Full_adder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Full_adder
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Cin : IN  std_logic;
         Y : OUT  std_logic;
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal Y : std_logic;
   signal Cout : std_logic;
   
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Full_adder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Y => Y,
          Cout => Cout
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      
      
      wait for 1 ns;	
	
      A <= '0';
      B <= '0';
      Cin <= '0';
      wait for 1 ns;
      
      A <= '0';
      B <= '0';
      Cin <= '1';
      wait for 1 ns;
      
      A <= '0';
      B <= '1';
      Cin <= '0';
      wait for 1 ns;
      
      A <= '0';
      B <= '1';
      Cin <= '1';
      wait for 1 ns;
      
      A <= '1';
      B <= '0';
      Cin <= '0';
      wait for 1 ns;
      
      A <= '1';
      B <= '0';
      Cin <= '1';
      wait for 1 ns;
      
      A <= '1';
      B <= '1';
      Cin <= '0';
      wait for 1 ns;
      
      A <= '1';
      B <= '1';
      Cin <= '1';
      wait for 1 ns;

     

      wait;
   end process;

END;
