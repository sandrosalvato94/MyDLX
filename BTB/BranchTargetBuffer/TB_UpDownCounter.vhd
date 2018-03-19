--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:03:44 10/01/2017
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/BTB/BranchTargetBuffer/TB_UpDownCounter.vhd
-- Project Name:  BranchTargetBuffer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UpDownCounter
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
 
ENTITY TB_UpDownCounter IS
END TB_UpDownCounter;
 
ARCHITECTURE behavior OF TB_UpDownCounter IS 
 
    -------CHANGE HERE GENERICS-------
    constant N: integer := 4;
    ----------------------------------
 
    COMPONENT UpDownCounter
    GENERIC (N: INTEGER := 2);
    PORT(
         UPD_clk : IN  std_logic;
         UPD_reset : IN  std_logic;
         UPD_enable : IN  std_logic;
         UPD_Ud : IN  std_logic;
         UPD_out : OUT  std_logic_vector(N-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal UPD_clk : std_logic := '0';
   signal UPD_reset : std_logic := '1';
   signal UPD_enable : std_logic := '0';
   signal UPD_Ud : std_logic := '0';

 	--Outputs
   signal UPD_out : std_logic_vector(N-1 downto 0);

   -- Clock period definitions
   constant UPD_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UpDownCounter GENERIC MAP (N=>N)
	PORT MAP (
          UPD_clk => UPD_clk,
          UPD_reset => UPD_reset,
          UPD_enable => UPD_enable,
          UPD_Ud => UPD_Ud,
          UPD_out => UPD_out
        );

   -- Clock process definitions
   UPD_clk_process :process
   begin
		UPD_clk <= '0';
		wait for UPD_clk_period/2;
		UPD_clk <= '1';
		wait for UPD_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
      
      UPD_reset <= '0';
      UPD_enable <= '0';
      UPD_Ud <= '0';

      wait for UPD_clk_period;
      
      UPD_reset <= '0';
      UPD_enable <= '0';
      UPD_Ud <= '1';

      wait for UPD_clk_period*2;
      
      UPD_reset <= '0';
      UPD_enable <= '1';
      UPD_Ud <= '0';

      wait for UPD_clk_period*2;
      
      UPD_reset <= '0';
      UPD_enable <= '1';
      UPD_Ud <= '1';

      wait for UPD_clk_period*4;
      
      UPD_reset <= '0';
      UPD_enable <= '1';
      UPD_Ud <= '0';

      wait for UPD_clk_period*4;
      
      UPD_reset <= '1';
      UPD_enable <= '0';
      UPD_Ud <= '0';

      wait for UPD_clk_period*2;
      
      ----------------------------
      
      UPD_reset <= '0';
      UPD_enable <= '1';
      UPD_Ud <= '0';

      wait for UPD_clk_period*3;
      
      UPD_reset <= '0';
      UPD_enable <= '0';
      UPD_Ud <= '1';

      wait for UPD_clk_period*10;
      
      UPD_reset <= '0';
      UPD_enable <= '0';
      UPD_Ud <= '0';

      wait for UPD_clk_period*10;
      wait for UPD_clk_period/2;
      
      UPD_reset <= '0';
      UPD_enable <= '0';
      UPD_Ud <= '1';

      wait for UPD_clk_period*10;
      
      
      
      

      -- insert stimulus here 

      wait;
   end process;

END;
