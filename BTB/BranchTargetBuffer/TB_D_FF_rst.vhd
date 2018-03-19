--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:01:55 09/19/2017
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/BTB/BranchTargetBuffer/TB_D_FF_rst.vhd
-- Project Name:  BranchTargetBuffer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: D_FF_rst
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
 
ENTITY TB_D_FF_rst IS
END TB_D_FF_rst;
 
ARCHITECTURE behavior OF TB_D_FF_rst IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT D_FF_rst
    PORT(
         D : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         Q : OUT  std_logic;
         Not_Q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '1';

 	--Outputs
   signal Q : std_logic;
   signal Not_Q : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: D_FF_rst PORT MAP (
          D => D,
          clk => clk,
          rst => rst,
          Q => Q,
          Not_Q => Not_Q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
      
      rst <= '0';
      D <= '0';
      
      wait for clk_period;
      
      rst <= '0';
      D <= '1';
      
      wait for clk_period*2;
      
      rst <= '0';
      D <= '0';
      
      wait for clk_period*2;
      
      rst <= '0';
      D <= '1';
      
      wait for clk_period*2;
      
      rst <= '1';
      D <= '1';
      
      wait for clk_period*2;
      
      rst <= '0';
      D <= '0';
      
      wait for clk_period*2;
      
      rst <= '1';
      D <= '1';
      
      wait for clk_period*2;

      -- insert stimulus here 

      wait;
   end process;

END;
