--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:39:40 06/22/2018
-- Design Name:   
-- Module Name:   C:/Users/Alessandro/Documents/GitHub/MyDLX/Datapath/TB_Datapath.vhd
-- Project Name:  Datapath
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Datapath
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
 
ENTITY TB_DLX_PM IS
END TB_DLX_PM;
 
ARCHITECTURE behavior OF TB_DLX_PM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DLX_plus_memories is
		port(
		DLX_PM_enable	: in  std_logic;
		DLX_PM_reset	: in  std_logic;
		DLX_PM_clk		: in  std_logic;
		
		DLX_PM_error	: out std_logic
	);
	end component;

    

   --Inputs
	signal DLX_PM_enable	: std_logic := '1';
	signal DLX_PM_clk	: std_logic := '0';
	signal DLX_PM_reset : std_logic := '1';
	

 	--Outputs
   signal DLX_PM_error	: std_logic := '0';
   -- Clock period definitions
   constant DLX_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DLX_plus_memories PORT MAP(
			DLX_PM_enable => DLX_PM_enable,
			DLX_PM_clk	  => DLX_PM_clk,
			DLX_PM_reset  => DLX_PM_reset,
			DLX_PM_error  => DLX_PM_error
        );

   -- Clock process definitions
   DLX_clk_process :process
   begin
		DLX_PM_clk <= '0';
		wait for DLX_clk_period/2;
		DLX_PM_clk <= '1';
		wait for DLX_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      
      wait for DLX_clk_period;
		DLX_PM_enable <= '1';
		DLX_PM_reset  <= '0';

     
      -- insert stimulus here 

      wait;
   end process;

END;
