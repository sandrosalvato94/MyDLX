--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:46:26 09/20/2017
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/BTB/BranchTargetBuffer/TB_BTB.vhd
-- Project Name:  BranchTargetBuffer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BTB
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

 
ENTITY TB_BTB IS
END TB_BTB;
 
ARCHITECTURE behavior OF TB_BTB IS 

	-------------CHANGE HERE GENERICS-------------
	constant N_ENTRY		: integer := 4;
	constant NBIT_ENTRY		: integer := 8;
	constant NBIT_TARGET	: integer := 8;
	constant NBIT_PREDICTION	: integer := 2;
	-----------------------------------------------
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BTB is
    GENERIC (
	N_ENTRY: 		integer := 32;
	NBIT_ENTRY: 	integer := 32;
	NBIT_TARGET:	integer := 32;
	NBIT_PREDICTION:	integer := 2
    );
    PORT(
         BTB_clk : IN  std_logic;
         BTB_rst : IN  std_logic;
         BTB_enable : IN  std_logic;
         BTB_PC_From_IF : IN  std_logic_vector(NBIT_ENTRY-1 downto 0);
         BTB_PC_From_DE : IN  std_logic_vector(NBIT_ENTRY-1 downto 0);
         --BTB_NPC_From_DE : IN  std_logic_vector(31 downto 0);
         BTB_target_From_DE : IN  std_logic_vector(NBIT_TARGET-1 downto 0);
         BTB_is_branch : IN  std_logic;
         BTB_branch_taken : IN  std_logic;
         BTB_target_prediction : OUT  std_logic_vector(NBIT_TARGET-1 downto 0);
         BTB_prediction : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal BTB_clk : std_logic := '0';
   signal BTB_rst : std_logic := '1';
   signal BTB_enable : std_logic := '0';
   signal BTB_PC_From_IF : std_logic_vector(NBIT_ENTRY-1 downto 0) := (others => '0');
   signal BTB_PC_From_DE : std_logic_vector(NBIT_ENTRY-1 downto 0) := (others => '0');
   signal BTB_NPC_From_DE : std_logic_vector(NBIT_ENTRY-1 downto 0) := (others => '0');
   signal BTB_target_From_DE : std_logic_vector(NBIT_TARGET-1 downto 0) := (others => '0');
   signal BTB_is_branch : std_logic := '0';
   signal BTB_branch_taken : std_logic := '0';

 	--Outputs
   signal BTB_target_prediction : std_logic_vector(NBIT_TARGET-1 downto 0);
   signal BTB_prediction : std_logic;

   -- Clock period definitions
   constant BTB_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BTB GENERIC MAP (N_ENTRY => N_ENTRY,
		     NBIT_ENTRY => NBIT_ENTRY,
		     NBIT_TARGET => NBIT_TARGET,
		     NBIT_PREDICTION => NBIT_PREDICTION) 
	PORT MAP (
          BTB_clk => BTB_clk,
          BTB_rst => BTB_rst,
          BTB_enable => BTB_enable,
          BTB_PC_From_IF => BTB_PC_From_IF,
          BTB_PC_From_DE => BTB_PC_From_DE,
--          BTB_NPC_From_DE => BTB_NPC_From_DE,
          BTB_target_From_DE => BTB_target_From_DE,
          BTB_is_branch => BTB_is_branch,
          BTB_branch_taken => BTB_branch_taken,
          BTB_target_prediction => BTB_target_prediction,
          BTB_prediction => BTB_prediction
        );

   -- Clock process definitions
   BTB_clk_process :process
   begin
		BTB_clk <= '0';
		wait for BTB_clk_period/2;
		BTB_clk <= '1';
		wait for BTB_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns; --10 ns
      
      --TEST 1: first approach, no updating.--
      BTB_rst <= '0';
      BTB_enable <= '1';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(4 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(0 , NBIT_ENTRY));
      BTB_is_branch <= '0';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(100 , NBIT_TARGET));
      BTB_branch_taken <= '0';	

      wait for BTB_clk_period;
      --SUCCESFULL----------------
      
      --TEST 2: writing a row.------------------------------ 20 ns
      BTB_rst <= '0'; 
      BTB_enable <= '1';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(8 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(4 , NBIT_ENTRY));
      BTB_is_branch <= '0';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(105 , NBIT_TARGET));
      BTB_branch_taken <= '0';	

      wait for BTB_clk_period;
      
      BTB_rst <= '0';
      BTB_enable <= '1';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(12 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(8 , NBIT_ENTRY));
      BTB_is_branch <= '1';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(105 , NBIT_TARGET));
      BTB_branch_taken <= '0';	

      wait for BTB_clk_period;
      --SUCCESFULL------------------------------------------
      
      --TEST 3: writing another row.------------------------ 40 ns
      BTB_rst <= '0';
      BTB_enable <= '1';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(16 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(12 , NBIT_ENTRY));
      BTB_is_branch <= '1';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(8 , NBIT_TARGET));
      BTB_branch_taken <= '0';	

      wait for BTB_clk_period;
      
      BTB_rst <= '0';
      BTB_enable <= '1';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(20 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(16 , NBIT_ENTRY));
      BTB_is_branch <= '0';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(0 , NBIT_TARGET));
      BTB_branch_taken <= '0';	

      wait for BTB_clk_period;
      --SUCCESFULL----------------------------------------
      
      --TEST 4: matching.---------------------------------- 60 ns
      BTB_rst <= '0';
      BTB_enable <= '1';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(8 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(20 , NBIT_ENTRY));
      BTB_is_branch <= '0';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(0 , NBIT_TARGET));
      BTB_branch_taken <= '0';	

      wait for BTB_clk_period;
      
      BTB_rst <= '0';
      BTB_enable <= '1';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(12 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(8 , NBIT_ENTRY));
      BTB_is_branch <= '1';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(105 , NBIT_TARGET));
      BTB_branch_taken <= '0';	

      wait for BTB_clk_period;
      ---------------------------------------------------------------
      
      ---------------------------------------------------------------- 80 ns
      BTB_rst <= '0';
      BTB_enable <= '1';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(1 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(12 , NBIT_ENTRY));
      BTB_is_branch <= '1';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(8 , NBIT_TARGET));
      BTB_branch_taken <= '0';	

      wait for BTB_clk_period;
      
      BTB_rst <= '0';
      BTB_enable <= '1';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(0 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(1 , NBIT_ENTRY));
      BTB_is_branch <= '0';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(112 , NBIT_TARGET));
      BTB_branch_taken <= '0';	

      wait for BTB_clk_period;
      ----------------------------------------------------------------
      
       --TEST 5: freezing cache if enable kept down.-------- 100 ns
      BTB_rst <= '0';
      BTB_enable <= '1';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(1 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(12 , NBIT_ENTRY));
      BTB_is_branch <= '0';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(0 , NBIT_TARGET));
      BTB_branch_taken <= '0';	

      wait for BTB_clk_period;
      
      BTB_rst <= '0';
      BTB_enable <= '0';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(142 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(1 , NBIT_ENTRY));
      BTB_is_branch <= '0'; -- alternate 0 and 1
      BTB_target_From_DE <= std_logic_vector(to_unsigned(198 , NBIT_TARGET));
      BTB_branch_taken <= '0';	

      wait for BTB_clk_period;
      ------------------------------------------------------------------------
      --Note: The outputs are driven to 0----------------------------
      


      --TEST 7a: introducing a stall on a branch instruction cycle.-------- 120 ns
      BTB_rst <= '0';
      BTB_enable <= '0';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(9 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(142 , NBIT_ENTRY));
      BTB_is_branch <= '1';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(40 , NBIT_TARGET));
      BTB_branch_taken <= '0';	

      wait for BTB_clk_period;
      
      BTB_rst <= '0';
      BTB_enable <= '0';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(9 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(142 , NBIT_ENTRY));
      BTB_is_branch <= '1';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(40 , NBIT_TARGET));
      BTB_branch_taken <= '0';	

      wait for BTB_clk_period;
      ------------------------------------------------------------------------
      
      ---------------------------------------------------------------------- 140 ns
      BTB_rst <= '0';
      BTB_enable <= '1';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(38 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(9 , NBIT_ENTRY));
      BTB_is_branch <= '0';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(9 , NBIT_TARGET));
      BTB_branch_taken <= '0';	

      wait for BTB_clk_period;
      
      BTB_rst <= '0';
      BTB_enable <= '1';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(8 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(38 , NBIT_ENTRY));
      BTB_is_branch <= '1';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(38 , NBIT_TARGET));
      BTB_branch_taken <= '0';	

      wait for BTB_clk_period;
      ------------------------------------------------------------------------
      
      --TEST 7b: introducing a stall on a no branch instruction cycle.-------- 160 ns
      BTB_rst <= '0';
      BTB_enable <= '0';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(8 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(142 , NBIT_ENTRY));
      BTB_is_branch <= '0';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(40 , NBIT_TARGET));
      BTB_branch_taken <= '0';	

      wait for BTB_clk_period;
      
      BTB_rst <= '0';
      BTB_enable <= '0';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(8 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(142 , NBIT_ENTRY));
      BTB_is_branch <= '1';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(40 , NBIT_TARGET));
      BTB_branch_taken <= '0';	

      wait for BTB_clk_period;
      ----------------------------------------------------------------------------
      
      --TEST 8: checking saturation counter behaviour.----------------------- 180 ns
      BTB_rst <= '0';
      BTB_enable <= '1';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(12 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(8 , NBIT_ENTRY));
      BTB_is_branch <= '1';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(40 , NBIT_TARGET));
      BTB_branch_taken <= '1';	

      wait for BTB_clk_period;
      
      BTB_rst <= '0';
      BTB_enable <= '0';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(12 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(8 , NBIT_ENTRY));
      BTB_is_branch <= '1';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(40 , NBIT_TARGET));
      BTB_branch_taken <= '1';	

      wait for BTB_clk_period;
      
      BTB_rst <= '0';
      BTB_enable <= '1';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(8 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(12 , NBIT_ENTRY));
      BTB_is_branch <= '1';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(40 , NBIT_TARGET));
      BTB_branch_taken <= '1';	

      wait for BTB_clk_period;
      
      BTB_rst <= '0';
      BTB_enable <= '1';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(12 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(8 , NBIT_ENTRY));
      BTB_is_branch <= '1';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(40 , NBIT_TARGET));
      BTB_branch_taken <= '1';	

      wait for BTB_clk_period;
      
      BTB_rst <= '0';
      BTB_enable <= '1';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(8 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(12 , NBIT_ENTRY));
      BTB_is_branch <= '1';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(40 , NBIT_TARGET));
      BTB_branch_taken <= '1';	

      wait for BTB_clk_period;
      
      BTB_rst <= '0';
      BTB_enable <= '1';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(12 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(8 , NBIT_ENTRY));
      BTB_is_branch <= '1';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(40 , NBIT_TARGET));
      BTB_branch_taken <= '1';	

      wait for BTB_clk_period;
      
      BTB_rst <= '0';
      BTB_enable <= '1';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(8 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(12 , NBIT_ENTRY));
      BTB_is_branch <= '1';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(40 , NBIT_TARGET));
      BTB_branch_taken <= '1';	

      wait for BTB_clk_period;
      
      BTB_rst <= '0';
      BTB_enable <= '1';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(12 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(8 , NBIT_ENTRY));
      BTB_is_branch <= '1';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(40 , NBIT_TARGET));
      BTB_branch_taken <= '1';	

      wait for BTB_clk_period;
      
      BTB_rst <= '0';
      BTB_enable <= '1';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(8 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(12 , NBIT_ENTRY));
      BTB_is_branch <= '1';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(40 , NBIT_TARGET));
      BTB_branch_taken <= '0';	

      wait for BTB_clk_period;
      
      BTB_rst <= '0';
      BTB_enable <= '1';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(12 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(8 , NBIT_ENTRY));
      BTB_is_branch <= '1';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(40 , NBIT_TARGET));
      BTB_branch_taken <= '0';	

      wait for BTB_clk_period;
      
      BTB_rst <= '0';
      BTB_enable <= '1';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(8 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(12 , NBIT_ENTRY));
      BTB_is_branch <= '1';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(40 , NBIT_TARGET));
      BTB_branch_taken <= '0';	

      wait for BTB_clk_period;
      
      BTB_rst <= '0';
      BTB_enable <= '1';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(12 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(8 , NBIT_ENTRY));
      BTB_is_branch <= '1';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(40 , NBIT_TARGET));
      BTB_branch_taken <= '0';	

      wait for BTB_clk_period;
      ----------------------------------------------------------------------------
      
--      --TEST 6: reset filled cache.---------------------------------------- 300 ns
      BTB_rst <= '1';
      BTB_enable <= '1';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(8 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(20 , NBIT_ENTRY));
      BTB_is_branch <= '1';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(0 , NBIT_TARGET));
      BTB_branch_taken <= '0';	

      wait for BTB_clk_period;
      
      BTB_rst <= '1';
      BTB_enable <= '1';
      BTB_PC_From_IF <= std_logic_vector(to_unsigned(8 , NBIT_ENTRY));
      BTB_PC_From_DE <= std_logic_vector(to_unsigned(20 , NBIT_ENTRY));
      BTB_is_branch <= '1';
      BTB_target_From_DE <= std_logic_vector(to_unsigned(0 , NBIT_TARGET));
      BTB_branch_taken <= '0';	

      wait for BTB_clk_period;
--      ---------------------------------------------------------------------
      
      
      

      wait;
   end process;

END;
