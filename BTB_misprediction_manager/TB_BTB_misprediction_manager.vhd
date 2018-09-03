--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:50:53 09/03/2018
-- Design Name:   
-- Module Name:   C:/Users/Alessandro/Documents/GitHub/MyDLX/BTB_misprediction_manager/TB_BTB_misprediction_manager.vhd
-- Project Name:  BTB_misprediction_manager
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BTB_misprediction_manager
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
 
ENTITY TB_BTB_misprediction_manager IS
END TB_BTB_misprediction_manager;
 
ARCHITECTURE behavior OF TB_BTB_misprediction_manager IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BTB_misprediction_manager
    PORT(
         BMM_clk : IN  std_logic;
         BMM_reset : IN  std_logic;
         BMM_enable : IN  std_logic;
         BMM_restore : IN  std_logic;
         BMM_PC : IN  std_logic_vector(31 downto 0);
         BMM_is_branch : IN  std_logic;
         BMM_branch_taken : IN  std_logic;
         BMM_PC_BTB : OUT  std_logic_vector(31 downto 0);
         BMM_is_branch_BTB : OUT  std_logic;
         BMM_branch_taken_BTB : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal BMM_clk : std_logic := '0';
   signal BMM_reset : std_logic := '0';
   signal BMM_enable : std_logic := '0';
   signal BMM_restore : std_logic := '0';
   signal BMM_PC : std_logic_vector(31 downto 0) := (others => '0');
   signal BMM_is_branch : std_logic := '0';
   signal BMM_branch_taken : std_logic := '0';

 	--Outputs
   signal BMM_PC_BTB : std_logic_vector(31 downto 0);
   signal BMM_is_branch_BTB : std_logic;
   signal BMM_branch_taken_BTB : std_logic;

   -- Clock period definitions
   constant BMM_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BTB_misprediction_manager PORT MAP (
          BMM_clk => BMM_clk,
          BMM_reset => BMM_reset,
          BMM_enable => BMM_enable,
          BMM_restore => BMM_restore,
          BMM_PC => BMM_PC,
          BMM_is_branch => BMM_is_branch,
          BMM_branch_taken => BMM_branch_taken,
          BMM_PC_BTB => BMM_PC_BTB,
          BMM_is_branch_BTB => BMM_is_branch_BTB,
          BMM_branch_taken_BTB => BMM_branch_taken_BTB
        );

   -- Clock process definitions
   BMM_clk_process :process
   begin
		BMM_clk <= '0';
		wait for BMM_clk_period/2;
		BMM_clk <= '1';
		wait for BMM_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
		 BMM_reset <= '1';
		 
		 wait for BMM_clk_period;
		 
		 BMM_reset <= '0';
		 
		 wait for BMM_clk_period;
		 wait for BMM_clk_period/2;
		 
		 --T1 : transparent mode---------------------------------
		 BMM_enable 	<= '1';
		 BMM_restore 	<= '0';
		 BMM_PC 		 	<= std_logic_vector(to_unsigned(12, 32));
		 BMM_is_branch <= '0';
		 BMM_branch_taken <= '0';
		 wait for BMM_clk_period;
		 
		 BMM_enable 	<= '1';
		 BMM_restore 	<= '0';
		 BMM_PC 		 	<= std_logic_vector(to_unsigned(16, 32));
		 BMM_is_branch <= '0';
		 BMM_branch_taken <= '0';
		 wait for BMM_clk_period;
		 
		 BMM_enable 	<= '1';
		 BMM_restore 	<= '0';
		 BMM_PC 		 	<= std_logic_vector(to_unsigned(20, 32));
		 BMM_is_branch <= '0';
		 BMM_branch_taken <= '0';
		 wait for BMM_clk_period;
      ---------------------------------------------------------
		
		 --T2 : branch taken-------------------------------------
		 BMM_enable 	<= '1';
		 BMM_restore 	<= '0';
		 BMM_PC 		 	<= std_logic_vector(to_unsigned(24, 32));
		 BMM_is_branch <= '1';
		 BMM_branch_taken <= '1';
		 wait for BMM_clk_period;
		 
		 BMM_enable 	<= '1';
		 BMM_restore 	<= '0';
		 BMM_PC 		 	<= std_logic_vector(to_unsigned(52, 32));
		 BMM_is_branch <= '0';
		 BMM_branch_taken <= '0';
		 wait for BMM_clk_period;
		 
		 BMM_enable 	<= '1';
		 BMM_restore 	<= '0';
		 BMM_PC 		 	<= std_logic_vector(to_unsigned(56, 32));
		 BMM_is_branch <= '0';
		 BMM_branch_taken <= '0';
		 wait for BMM_clk_period;
      ---------------------------------------------------------
		
		--T3 : misprediction-------------------------------------
		 BMM_enable 	<= '1';
		 BMM_restore 	<= '1';
		 BMM_PC 		 	<= std_logic_vector(to_unsigned(24, 32));
		 BMM_is_branch <= '1';
		 BMM_branch_taken <= '1';
		 wait for BMM_clk_period;
		 
		 BMM_enable 	<= '1';
		 BMM_restore 	<= '0';
		 BMM_PC 		 	<= std_logic_vector(to_unsigned(28, 32));
		 BMM_is_branch <= '0';
		 BMM_branch_taken <= '0';
		 wait for BMM_clk_period;
		 
		 BMM_enable 	<= '1';
		 BMM_restore 	<= '0';
		 BMM_PC 		 	<= std_logic_vector(to_unsigned(32, 32));
		 BMM_is_branch <= '0';
		 BMM_branch_taken <= '0';
		 wait for BMM_clk_period;
      ---------------------------------------------------------

     

      wait;
   end process;

END;
