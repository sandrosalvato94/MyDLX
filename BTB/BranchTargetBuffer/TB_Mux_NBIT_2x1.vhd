--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:18:26 09/18/2017
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/BTB/BranchTargetBuffer/TB_Mux_NBIT_2x1.vhd
-- Project Name:  BranchTargetBuffer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Mux_NBit_2x1
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
 
ENTITY TB_Mux_NBIT_2x1 IS
END TB_Mux_NBIT_2x1;
 
ARCHITECTURE behavior OF TB_Mux_NBIT_2x1 IS 
 
    -------CHANGE HERE GENERICS-------
    constant NBIT_IN: integer := 32;
    ----------------------------------

 
    COMPONENT Mux_NBit_2x1
    GENERIC(NBIT_IN: integer := 32);
    PORT(
         port0 : IN  std_logic_vector(NBIT_IN-1 downto 0);
         port1 : IN  std_logic_vector(NBIT_IN-1 downto 0);
         sel : IN  std_logic;
         portY : OUT  std_logic_vector(NBIT_IN-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal port0 : std_logic_vector(NBIT_IN-1 downto 0) := (others => '0');
   signal port1 : std_logic_vector(NBIT_IN-1 downto 0) := (others => '0');
   signal sel : std_logic := '0';

 	--Outputs
   signal portY : std_logic_vector(NBIT_IN-1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_IN)
	PORT MAP (
          port0 => port0,
          port1 => port1,
          sel => sel,
          portY => portY
        );

   -- Stimulus process
   stim_proc: process
   begin		
	
	wait for 10 ns;
	
	port0 <= (others => '0');
	port1 <= (others => '1');
	sel <= '0';
	
	wait for 10 ns;
	
	port0 <= (others => '0');
	port1 <= (others => '1');
	sel <= '1';
	
	wait for 10 ns;
	
	port0 <= (1 => '1', others => '0');
	port1 <= (2 => '1', others => '0');
	sel <= '0';
	
	wait for 10 ns;
	
	port0 <= (1 => '1', others => '0');
	port1 <= (2 => '1', others => '0');
	sel <= '1';
	
	wait for 10 ns;
	
	
      -- insert stimulus here 

      wait;
   end process;

END;
