--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:56:04 10/17/2017
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/Decode_Stage/TB_Jmp_Branch_Manager.vhd
-- Project Name:  Decode_Stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Jmp_Branch_Manager
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
 
ENTITY TB_Jmp_Branch_Manager IS
END TB_Jmp_Branch_Manager;
 
ARCHITECTURE behavior OF TB_Jmp_Branch_Manager IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Jmp_Branch_Manager
    PORT(
         JBM_iszero : IN  std_logic;
         JBM_Reg : IN  std_logic_vector(31 downto 0);
         JBM_Imm : IN  std_logic_vector(31 downto 0);
         JBM_NPC : IN  std_logic_vector(31 downto 0);
         JBM_Opcode : IN  std_logic_vector(5 downto 0);
         JBM_Upd_PC : OUT  std_logic_vector(31 downto 0);
         JBM_taken : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal JBM_iszero : std_logic := '0';
   signal JBM_Reg : std_logic_vector(31 downto 0) := (others => '0');
   signal JBM_Imm : std_logic_vector(31 downto 0) := (others => '0');
   signal JBM_NPC : std_logic_vector(31 downto 0) := (others => '0');
   signal JBM_Opcode : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal JBM_Upd_PC : std_logic_vector(31 downto 0);
   signal JBM_taken : std_logic;
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Jmp_Branch_Manager PORT MAP (
          JBM_iszero => JBM_iszero,
          JBM_Reg => JBM_Reg,
          JBM_Imm => JBM_Imm,
          JBM_NPC => JBM_NPC,
          JBM_Opcode => JBM_Opcode,
          JBM_Upd_PC => JBM_Upd_PC,
          JBM_taken => JBM_taken
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      

      -- insert stimulus here 

      wait;
   end process;

END;
