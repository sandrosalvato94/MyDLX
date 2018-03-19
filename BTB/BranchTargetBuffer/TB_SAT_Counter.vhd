--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:35:06 10/01/2017
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/BTB/BranchTargetBuffer/TB_SAT_Counter.vhd
-- Project Name:  BranchTargetBuffer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SAT_Counter_BTB
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
 
ENTITY TB_SAT_Counter IS
END TB_SAT_Counter;
 
ARCHITECTURE behavior OF TB_SAT_Counter IS 
 
    -------CHANGE HERE GENERICS-------
         constant N: integer := 2;
    ----------------------------------
 
    COMPONENT SAT_Counter_BTB
    GENERIC ( N: integer := 2);
    PORT(
         SAT_clk : IN  std_logic;
         SAT_reset : IN  std_logic;
         SAT_enable : IN  std_logic;
         SAT_Ud : IN  std_logic;
         SAT_update : IN  std_logic;
         SAT_setToDef : IN  std_logic;
         SAT_SO : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal SAT_clk : std_logic := '0';
   signal SAT_reset : std_logic := '0';
   signal SAT_enable : std_logic := '0';
   signal SAT_Ud : std_logic := '0';
   signal SAT_update : std_logic := '0';
   signal SAT_setToDef : std_logic := '0';

 	--Outputs
   signal SAT_SO : std_logic;

   -- Clock period definitions
   constant SAT_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SAT_Counter_BTB GENERIC MAP (N => N) 
	PORT MAP (
          SAT_clk => SAT_clk,
          SAT_reset => SAT_reset,
          SAT_enable => SAT_enable,
          SAT_Ud => SAT_Ud,
          SAT_update => SAT_update,
          SAT_setToDef => SAT_setToDef,
          SAT_SO => SAT_SO
        );

   -- Clock process definitions
   SAT_clk_process :process
   begin
		SAT_clk <= '0';
		wait for SAT_clk_period/2;
		SAT_clk <= '1';
		wait for SAT_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;

      ------------------------------------ 5 ns
      SAT_reset <= '1';
      SAT_enable <='0';
      SAT_Ud <= '0';
      SAT_update <='0';
      SAT_setToDef <= '0';      

      wait for SAT_clk_period*2;
      ------------------------------------
      
      --TEST 1a: COUNT UNTIL TCMAX--------- 25 ns
      SAT_reset <= '0';
      SAT_enable <='1';
      SAT_Ud <= '1';
      SAT_update <='1';
      SAT_setToDef <= '0';      

      wait for SAT_clk_period*20;
      --SUCCESFULL------------------------
      
      --TEST 2: WRONG INPUT PATTERN------- 225 ns
      SAT_reset <= '0';
      SAT_enable <='0';
      SAT_Ud <= '0';
      SAT_update <='0';
      SAT_setToDef <= '1';      

      wait for SAT_clk_period;
      --SUCCESFULL------------------------
      
      --TEST 3: SET TO DEFAULT VALUE------- 235 ns
      SAT_reset <= '0';
      SAT_enable <='1';
      SAT_Ud <= '0';
      SAT_update <='0';
      SAT_setToDef <= '1';      

      wait for SAT_clk_period;
      --SUCCESFULL------------------------ 
      
      --TEST 4: COUNT UNTIL TCMIN---------- 245 ns
      SAT_reset <= '0';
      SAT_enable <='1';
      SAT_Ud <= '0';
      SAT_update <='1';
      SAT_setToDef <= '0';      

      wait for SAT_clk_period*20;
      --SUCCESFULL------------------------
      
      --TEST 1bis: COUNT UNTIL TCMAX------  445 ns
      SAT_reset <= '0';
      SAT_enable <='1';
      SAT_Ud <= '1';
      SAT_update <='1';
      SAT_setToDef <= '0';      

      wait for SAT_clk_period*20;
      --SUCCESFULL------------------------  
      
      --TEST 5: RESET A FILLED COUNTER----  645 ns
      SAT_reset <= '1';
      SAT_enable <='1';
      SAT_Ud <= '0';
      SAT_update <='0';
      SAT_setToDef <= '0';      

      wait for SAT_clk_period*2;
      --SUCCESFULL------------------------
      
      
       

      wait;
   end process;

END;
