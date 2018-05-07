--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:53:42 05/07/2018
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/MultiplierBehavioral/Multiplier/TB_Multiplier.vhd
-- Project Name:  Multiplier
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Multiplier
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


ENTITY TB_Multiplier IS
END TB_Multiplier;
 
ARCHITECTURE behavior OF TB_Multiplier IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    --------CHANGE HERE GENERICS---------
      constant NBIT_DATA: integer := 32;
    -------------------------------------
    
 
    COMPONENT Multiplier
    GENERIC(NBIT_DATA : integer := 32);
    PORT(
         MUL_OpA : IN  std_logic_vector(NBIT_DATA-1 downto 0);
         MUL_OpB : IN  std_logic_vector(NBIT_DATA-1 downto 0);
         MUL_SGN_usgn : IN  std_logic;
         MUL_product : OUT  std_logic_vector(2*NBIT_DATA-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal MUL_OpA : std_logic_vector(NBIT_DATA-1 downto 0) := (others => '0');
   signal MUL_OpB : std_logic_vector(NBIT_DATA-1 downto 0) := (others => '0');
   signal MUL_SGN_usgn : std_logic := '0';

 	--Outputs
   signal MUL_product : std_logic_vector(2*NBIT_DATA-1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Multiplier GENERIC MAP (NBIT_DATA => NBIT_DATA) PORT MAP (
          MUL_OpA => MUL_OpA,
          MUL_OpB => MUL_OpB,
          MUL_SGN_usgn => MUL_SGN_usgn,
          MUL_product => MUL_product
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
	
	--TEST 1 : One time one. Unsigned and Signed----------
	MUL_OpA <= std_logic_vector(to_unsigned(1, NBIT_DATA));
	MUL_OpB <= std_logic_vector(to_unsigned(1, NBIT_DATA));
	MUL_SGN_usgn <= '0';
	wait for 10 ns;
	
	MUL_OpA <= std_logic_vector(to_signed(1, NBIT_DATA));
	MUL_OpB <= std_logic_vector(to_signed(1, NBIT_DATA));
	MUL_SGN_usgn <= '1';
	wait for 10 ns;
	--------------------------------------------------------
	
	--TEST 2 : Mul by 0. Unsigned and Signed----------------
	MUL_OpA <= std_logic_vector(to_unsigned(16, NBIT_DATA));
	MUL_OpB <= std_logic_vector(to_unsigned(0, NBIT_DATA));
	MUL_SGN_usgn <= '0';
	wait for 10 ns;
	
	MUL_OpA <= std_logic_vector(to_signed(16, NBIT_DATA));
	MUL_OpB <= std_logic_vector(to_signed(0, NBIT_DATA));
	MUL_SGN_usgn <= '1';
	wait for 10 ns;
	
	MUL_OpA <= std_logic_vector(to_unsigned(15, NBIT_DATA));
	MUL_OpB <= std_logic_vector(to_unsigned(0, NBIT_DATA));
	MUL_SGN_usgn <= '0';
	wait for 10 ns;
	
	MUL_OpA <= std_logic_vector(to_signed(-15, NBIT_DATA));
	MUL_OpB <= std_logic_vector(to_signed(0, NBIT_DATA));
	MUL_SGN_usgn <= '1';
	wait for 10 ns;
	--------------------------------------------------------
	
	--TEST 3 : Mul times 2**(NBIT_DATA-1)Unsigned and Signed
	MUL_OpA <= (NBIT_DATA-1 => '1', others => '0');
	MUL_OpB <= (NBIT_DATA-1 => '1', others => '0');
	MUL_SGN_usgn <= '0';
	wait for 10 ns;
	
	MUL_OpA <= (NBIT_DATA-1 => '1', others => '0');
	MUL_OpB <= (NBIT_DATA-1 => '1', others => '0');
	MUL_SGN_usgn <= '1';
	wait for 10 ns;
	--------------------------------------------------------
	
	--TEST 4 : Extreme conditions---------------------------
	MUL_OpA <= (others => '1');
	MUL_OpB <= (others => '1');
	MUL_SGN_usgn <= '0';
	wait for 10 ns;
	
	MUL_OpA <= (others => '1');
	MUL_OpB <= (others => '1');
	MUL_SGN_usgn <= '1';
	wait for 10 ns;
	
	MUL_OpA <= (others => '1');
	MUL_OpB <= (others => '0');
	MUL_SGN_usgn <= '0';
	wait for 10 ns;
	
	MUL_OpA <= (others => '1');
	MUL_OpB <= (others => '0');
	MUL_SGN_usgn <= '1';
	wait for 10 ns;
	--------------------------------------------------------
	
	--TEST 5 : Shifting operations--------------------------
	MUL_OpA <= (0 => '1', others => '0');
	MUL_OpB <= std_logic_vector(to_signed(2, NBIT_DATA));
	MUL_SGN_usgn <= '0';
	wait for 10 ns;
	
	MUL_OpA <= (1 => '1', others => '0');
	MUL_OpB <= std_logic_vector(to_signed(NBIT_DATA, NBIT_DATA));
	MUL_SGN_usgn <= '1';
	wait for 10 ns;
	
	MUL_OpA <= (NBIT_DATA-1 => '1', others => '0');
	MUL_OpB <= std_logic_vector(to_signed(NBIT_DATA, NBIT_DATA));
	MUL_SGN_usgn <= '0';
	wait for 10 ns;
	--------------------------------------------------------

      -- insert stimulus here 

      wait;
   end process;

END;
