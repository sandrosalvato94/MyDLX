--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:04:37 04/26/2018
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/LogicUnits/TB_Logic_Unit2.vhd
-- Project Name:  LogicUnits
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Logic_Unit2
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
 
ENTITY TB_Logic_Unit2 IS
END TB_Logic_Unit2;
 
ARCHITECTURE behavior OF TB_Logic_Unit2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Logic_Unit2
    PORT(
         LU_OpA : IN  std_logic_vector(31 downto 0);
         LU_OpB : IN  std_logic_vector(31 downto 0);
         LU_Opcode : IN  std_logic_vector(3 downto 0);
         LU_Y : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal LU_OpA : std_logic_vector(31 downto 0) := (others => '0');
   signal LU_OpB : std_logic_vector(31 downto 0) := (others => '0');
   signal LU_Opcode : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal LU_Y : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Logic_Unit2 PORT MAP (
          LU_OpA => LU_OpA,
          LU_OpB => LU_OpB,
          LU_Opcode => LU_Opcode,
          LU_Y => LU_Y
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	

    --TEST 1a: AND works----------------
      LU_OpA <= (others => '1');
      LU_OpB <= (others => '1');
      LU_Opcode <= "1000";
      
      wait for 10 ns;
      ------------------------------------
      
      --TEST 1a: AND works----------------
      LU_OpA <= (others => '1');
      LU_OpB <= (others => '1');
      LU_Opcode <= "0111";
      
      wait for 10 ns;
      ------------------------------------
      
      --TEST 1a: AND works----------------
      LU_OpA <= (others => '1');
      LU_OpB <= (others => '1');
      LU_Opcode <= "1110";
      
      wait for 10 ns;
      ------------------------------------
      
      --TEST 1a: AND works----------------
      LU_OpA <= (others => '1');
      LU_OpB <= (others => '1');
      LU_Opcode <= "0001";
      
      wait for 10 ns;
      ------------------------------------
      
      --TEST 1a: AND works----------------
      LU_OpA <= (others => '1');
      LU_OpB <= (others => '1');
      LU_Opcode <= "0110";
      
      wait for 10 ns;
      ------------------------------------
      
       
      --TEST 1a: AND works----------------
      LU_OpA <= (others => '1');
      LU_OpB <= (others => '1');
      LU_Opcode <= "1001";
      
      wait for 10 ns;
      ------------------------------------
      
      --TEST 1b: AND works----------------
      LU_OpA <= (others => '1');
      LU_OpB <= (0 => '0', others => '1');
      LU_Opcode <= "1000";
      
      wait for 10 ns;
      ------------------------------------
      
      --TEST 1c: AND works----------------
      LU_OpA <= (others => '0');
      LU_OpB <= (others => '0');
      LU_Opcode <= "1110";
      
      wait for 10 ns;
      ------------------------------------
      
      --TEST 2a: OR works----------------
      LU_OpA <= (others => '1');
      LU_OpB <= (others => '1');
      LU_Opcode <= "1110";
      
      wait for 10 ns;
      ------------------------------------
      
      --TEST 2b: OR works----------------
      LU_OpA <= (others => '1');
      LU_OpB <= (0 => '0', others => '1');
      LU_Opcode <= "0001";
      
      wait for 10 ns;
      ------------------------------------
      
      --TEST 2c: OR works----------------
      LU_OpA <= (others => '0');
      LU_OpB <= (others => '0');
      LU_Opcode <= "0110";
      
      wait for 10 ns;
      ------------------------------------
      
      --TEST 3a: XOR works----------------
      LU_OpA <= (others => '1');
      LU_OpB <= (others => '1');
      LU_Opcode <= "1001";
      
      wait for 10 ns;
      ------------------------------------
     

      wait;
   end process;

END;
