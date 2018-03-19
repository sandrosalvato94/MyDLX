--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:37:42 10/01/2017
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/BTB/BranchTargetBuffer/TB_CU_SatCounter.vhd
-- Project Name:  BranchTargetBuffer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CU_SatCounter
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
 
ENTITY TB_CU_SatCounter IS
END TB_CU_SatCounter;
 
ARCHITECTURE behavior OF TB_CU_SatCounter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CU_SatCounter
    PORT(
         CU_reset : IN  std_logic;
         CU_enable : IN  std_logic;
         CU_Ud : IN  std_logic;
         CU_update : IN  std_logic;
         CU_loadDefault : IN  std_logic;
         CU_TcMax : IN  std_logic;
         CU_TcMin : IN  std_logic;
         UDC_Ud : OUT  std_logic;
         UDC_enable : OUT  std_logic;
         UDC_reset : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CU_reset : std_logic := '0';
   signal CU_enable : std_logic := '0';
   signal CU_Ud : std_logic := '0';
   signal CU_update : std_logic := '0';
   signal CU_loadDefault : std_logic := '0';
   signal CU_TcMax : std_logic := '0';
   signal CU_TcMin : std_logic := '0';

 	--Outputs
   signal UDC_Ud : std_logic;
   signal UDC_enable : std_logic;
   signal UDC_reset : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CU_SatCounter PORT MAP (
          CU_reset => CU_reset,
          CU_enable => CU_enable,
          CU_Ud => CU_Ud,
          CU_update => CU_update,
          CU_loadDefault => CU_loadDefault,
          CU_TcMax => CU_TcMax,
          CU_TcMin => CU_TcMin,
          UDC_Ud => UDC_Ud,
          UDC_enable => UDC_enable,
          UDC_reset => UDC_reset
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
     
      wait for 5 ns;	

     --INVALID INPUT PATTERN---
     CU_reset <= '0';
     CU_enable <= '1';
     CU_Ud <= '0' ;
     CU_update <= '0';
     CU_loadDefault <= '0';
     CU_TcMax <= '1';
     CU_TcMin <= '1';

     wait for 5 ns;
     ---------------------------
     
     --JUST ENABLE--------------
     CU_reset <= '0';
     CU_enable <= '1';
     CU_Ud <= '0' ;
     CU_update <= '0';
     CU_loadDefault <= '0';
     CU_TcMax <= '0';
     CU_TcMin <= '0';

     wait for 5 ns;
     ---------------------------
     
     --RESETTING----------------
     CU_reset <= '1';
     CU_enable <= '0';
     CU_Ud <= '0' ;
     CU_update <= '0';
     CU_loadDefault <= '0';
     CU_TcMax <= '1';
     CU_TcMin <= '1';

     wait for 5 ns;
     ---------------------------
     
     --LOADING DEFAULT VALUE----
     CU_reset <= '0';
     CU_enable <= '1';
     CU_Ud <= '0' ;
     CU_update <= '0';
     CU_loadDefault <= '1';
     CU_TcMax <= '0';
     CU_TcMin <= '0';

     wait for 5 ns;
     ---------------------------
     
     --INVALID INPUT PATTERN---
     CU_reset <= '0';
     CU_enable <= '1';
     CU_Ud <= '0' ;
     CU_update <= '0';
     CU_loadDefault <= '1';
     CU_TcMax <= '1';
     CU_TcMin <= '1';

     wait for 5 ns;
     ---------------------------
     
     --COUNT UP-----------------
     CU_reset <= '0';
     CU_enable <= '1';
     CU_Ud <= '1' ;
     CU_update <= '1';
     CU_loadDefault <= '0';
     CU_TcMax <= '0';
     CU_TcMin <= '0';

     wait for 5 ns;
     ---------------------------
     
     --COUNT DOWN---------------
     CU_reset <= '0';
     CU_enable <= '1';
     CU_Ud <= '0' ;
     CU_update <= '1';
     CU_loadDefault <= '0';
     CU_TcMax <= '0';
     CU_TcMin <= '0';

     wait for 5 ns;
     ---------------------------
     
     --CANNOT COUNT UP----------
     CU_reset <= '0';
     CU_enable <= '1';
     CU_Ud <= '1' ;
     CU_update <= '1';
     CU_loadDefault <= '0';
     CU_TcMax <= '1';
     CU_TcMin <= '0';

     wait for 5 ns;
     ---------------------------
     
     --COUNT DOWN---------------
     CU_reset <= '0';
     CU_enable <= '1';
     CU_Ud <= '0' ;
     CU_update <= '1';
     CU_loadDefault <= '0';
     CU_TcMax <= '1';
     CU_TcMin <= '0';

     wait for 5 ns;
     ---------------------------
     
     --COUNT UP-----------------
     CU_reset <= '0';
     CU_enable <= '1';
     CU_Ud <= '1' ;
     CU_update <= '1';
     CU_loadDefault <= '0';
     CU_TcMax <= '0';
     CU_TcMin <= '1';

     wait for 5 ns;
     ---------------------------
     
     --CANNOT COUNT DOWN--------
     CU_reset <= '0';
     CU_enable <= '1';
     CU_Ud <= '0' ;
     CU_update <= '1';
     CU_loadDefault <= '0';
     CU_TcMax <= '0';
     CU_TcMin <= '1';

     wait for 5 ns;
     ---------------------------

      wait;
   end process;

END;
