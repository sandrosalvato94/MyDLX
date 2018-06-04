--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:55:43 06/04/2018
-- Design Name:   
-- Module Name:   C:/Users/Alessandro/Documents/GitHub/MyDLX/Forwarding_ControlUnit/TB_Comparator5Bit.vhd
-- Project Name:  Forwarding_ControlUnit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Comparator5Bit
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
 
ENTITY TB_Comparator5Bit IS
END TB_Comparator5Bit;
 
ARCHITECTURE behavior OF TB_Comparator5Bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Comparator5Bit
    PORT(
         CMP_A : IN  std_logic_vector(4 downto 0);
         CMP_B : IN  std_logic_vector(4 downto 0);
         CMP_EQ_neq : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CMP_A : std_logic_vector(4 downto 0) := (others => '0');
   signal CMP_B : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal CMP_EQ_neq : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Comparator5Bit PORT MAP (
          CMP_A => CMP_A,
          CMP_B => CMP_B,
          CMP_EQ_neq => CMP_EQ_neq
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 1 ns;	
		
		--T1: Equal operands------------------------------------------
		CMP_A <= "00001";
		CMP_B <= "00001";
		wait for 1 ns;
		assert (CMP_EQ_neq = '1') report "Operands A and B are equal";
		wait for 5 ns;
		
		CMP_A <= "00000";
		CMP_B <= "00000";
		wait for 1 ns;
		assert (CMP_EQ_neq = '1') report "Operands A and B are equal";
		wait for 5 ns;
		---------------------------------------------------------------
		
		--T2: Not Equal operands---------------------------------------
		CMP_A <= "10001";
		CMP_B <= "00101";
		wait for 1 ns;
		assert (CMP_EQ_neq = '0') report "Operands A and B aren't equal";
		wait for 5 ns;
		
		CMP_A <= "11111";
		CMP_B <= "11101";
		wait for 1 ns;
		assert (CMP_EQ_neq = '0') report "Operands A and B aren't equal";
		wait for 5 ns;
		---------------------------------------------------------------
 

      -- insert stimulus here 

      wait;
   end process;

END;
