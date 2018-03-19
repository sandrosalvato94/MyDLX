--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:23:02 10/20/2017
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/Execute_Stage/TB_Enable_Interface.vhd
-- Project Name:  Execute_Stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Enable_Interface
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
 
ENTITY TB_Enable_Interface IS
END TB_Enable_Interface;
 
ARCHITECTURE behavior OF TB_Enable_Interface IS 
 
    -------CHANGE HERE GENERICS-------
    constant NBIT_DATA : integer := 32;
    ----------------------------------
 
    COMPONENT Enable_Interface
    GENERIC(NBIT_DATA : INTEGER := 32);
    PORT(
         EI_datain : IN  std_logic_vector(NBIT_DATA-1 downto 0);
         EI_enable : IN  std_logic;
         EI_dataout : OUT  std_logic_vector(NBIT_DATA-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal EI_datain : std_logic_vector(NBIT_DATA-1 downto 0) := (others => '0');
   signal EI_enable : std_logic := '0';

 	--Outputs
   signal EI_dataout : std_logic_vector(NBIT_DATA-1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Enable_Interface 
	GENERIC MAP (NBIT_DATA => NBIT_DATA)
	PORT MAP (
          EI_datain => EI_datain,
          EI_enable => EI_enable,
          EI_dataout => EI_dataout
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 1 ns;

      EI_datain <= (others => '1');      
      EI_enable <= '0';
      
      wait for 2 ns;
      
      EI_datain <= (others => '1');      
      EI_enable <= '1';
      
      wait for 2 ns;
     

      EI_datain <= (others => '0');      
      EI_enable <= '1';
      
      wait for 2 ns;
      
      EI_datain <= (3 => '1', 6 => '1', others => '0');      
      EI_enable <= '1';
      
      wait for 2 ns;
      
      EI_datain <= (3 => '1', 6 => '1', others => '0');      
      EI_enable <= '0';
      
      wait for 2 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
