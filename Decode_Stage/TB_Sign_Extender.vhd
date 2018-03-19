--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:50:10 10/16/2017
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/Decode_Stage/TB_Sign_Extender.vhd
-- Project Name:  Decode_Stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Sign_Extender
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
 
ENTITY TB_Sign_Extender IS
END TB_Sign_Extender;
 
ARCHITECTURE behavior OF TB_Sign_Extender IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sign_Extender	
    PORT(
         SE_I_J : IN  std_logic;
         SE_S_U : IN  std_logic;
         SE_in : IN  std_logic_vector(31 downto 0);
         SE_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SE_I_J : std_logic := '0';
   signal SE_S_U : std_logic := '0';
   signal SE_in : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal SE_out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sign_Extender PORT MAP (
          SE_I_J => SE_I_J,
          SE_S_U => SE_S_U,
          SE_in => SE_in,
          SE_out => SE_out
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 1 ns;
      
      SE_in(14 downto 0) <= std_logic_vector(to_unsigned(16 ,15));
      SE_in(15) <= '0';
      SE_I_J <= '1';
      SE_S_U <= '0';
      
      wait for 1 ns;
      
      SE_in(14 downto 0) <= std_logic_vector(to_unsigned(16 ,15));
      SE_in(15) <= '0';
      SE_I_J <= '1';
      SE_S_U <= '1';
      
      wait for 1 ns;
      
      SE_in(14 downto 0) <= std_logic_vector(to_unsigned(16 ,15));
      SE_in(15) <= '1';
      SE_I_J <= '1';
      SE_S_U <= '0';
      
      wait for 1 ns;
      
      SE_in(14 downto 0) <= std_logic_vector(to_unsigned(16 ,15));
      SE_in(15) <= '1';
      SE_I_J <= '1';
      SE_S_U <= '1';
      
      wait for 1 ns;
      
      SE_in(14 downto 0) <= std_logic_vector(to_unsigned(16 ,15));
      SE_in(15) <= '1';
      SE_in(25) <= '1';
      SE_I_J <= '1';
      SE_S_U <= '0';
      
      wait for 1 ns;
      
      SE_in(14 downto 0) <= std_logic_vector(to_unsigned(16 ,15));
      SE_in(15) <= '1';
      SE_in(25) <= '1';
      SE_I_J <= '0';
      SE_S_U <= '1';
      
      wait for 1 ns;
      
      SE_in(14 downto 0) <= std_logic_vector(to_unsigned(16 ,15));
      SE_in(15) <= '0';
      SE_in(25) <= '1';
      SE_I_J <= '1';
      SE_S_U <= '1';
      
      wait for 1 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
