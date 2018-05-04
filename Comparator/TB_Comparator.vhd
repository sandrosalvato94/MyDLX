--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:43:27 05/04/2018
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/Comparator/TB_Comparator.vhd
-- Project Name:  Comparator
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Comparator
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
use ieee.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Comparator IS
END TB_Comparator;
 
ARCHITECTURE behavior OF TB_Comparator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    -------CHANGE HERE GENERICS--------
    constant NBIT_DATA : integer := 32;
    -----------------------------------
 
    COMPONENT Comparator
    GENERIC (NBIT_DATA : integer := 32);
    PORT(
         CMP_OpA : IN  std_logic_vector(NBIT_DATA-1 downto 0);
         CMP_OpB : IN  std_logic_vector(NBIT_DATA-1 downto 0);
         CMP_sgn_usgn : in  std_logic;
         --CMP_enable : IN  std_logic;
         CMP_A_gt_B : OUT  std_logic;
         CMP_A_ge_B : OUT  std_logic;
         CMP_A_lt_B : OUT  std_logic;
         CMP_A_le_B : OUT  std_logic;
         CMP_A_eq_B : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CMP_OpA : std_logic_vector(NBIT_DATA-1 downto 0) := (others => '0');
   signal CMP_OpB : std_logic_vector(NBIT_DATA-1 downto 0) := (others => '0');
   signal CMP_enable : std_logic := '0';
   signal CMP_sgn_usgn : std_logic := '0';

 	--Outputs
   signal CMP_A_gt_B : std_logic;
   signal CMP_A_ge_B : std_logic;
   signal CMP_A_lt_B : std_logic;
   signal CMP_A_le_B : std_logic;
   signal CMP_A_eq_B : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Comparator GENERIC MAP (NBIT_DATA => NBIT_DATA) PORT MAP (
          CMP_OpA => CMP_OpA,
          CMP_OpB => CMP_OpB,
	CMP_sgn_usgn => CMP_sgn_usgn,
          --CMP_enable => CMP_enable,
          CMP_A_gt_B => CMP_A_gt_B,
          CMP_A_ge_B => CMP_A_ge_B,
          CMP_A_lt_B => CMP_A_lt_B,
          CMP_A_le_B => CMP_A_le_B,
          CMP_A_eq_B => CMP_A_eq_B
        );

  

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
	
	--TEST 1: random values on the input---------
	CMP_OpA <= std_logic_vector(to_unsigned(4 , NBIT_DATA));
	CMP_OpB <= std_logic_vector(to_signed(-4 , NBIT_DATA));
	--CMP_enable <= '0';
	CMP_sgn_usgn <= '0';
	wait for 10 ns;
	
	CMP_OpA <= std_logic_vector(to_unsigned(4 , NBIT_DATA));
	CMP_OpB <= std_logic_vector(to_signed(-4 , NBIT_DATA));
	--CMP_enable <= '0';
	CMP_sgn_usgn <= '1';
	wait for 10 ns;
	
	CMP_OpA <= std_logic_vector(to_unsigned(4 , NBIT_DATA));
	CMP_OpB <= std_logic_vector(to_signed(-5 , NBIT_DATA));
	--CMP_enable <= '0';
	CMP_sgn_usgn <= '0';
	wait for 10 ns;
	
	CMP_OpA <= std_logic_vector(to_unsigned(4 , NBIT_DATA));
	CMP_OpB <= std_logic_vector(to_signed(-5 , NBIT_DATA));
	--CMP_enable <= '0';
	CMP_sgn_usgn <= '1';
	wait for 10 ns;
	--------------------------------------------
	
	--TEST 2: compare unsigned best scenario--
	CMP_OpA <= (NBIT_DATA-1 => '1', others => '0');
	CMP_OpB <= std_logic_vector(to_unsigned(4 , NBIT_DATA));
	--CMP_enable <= '1';
	CMP_sgn_usgn <= '0';
	wait for 10 ns;
	
	CMP_OpA <= std_logic_vector(to_unsigned(4 , NBIT_DATA));
	CMP_OpB <= (NBIT_DATA-1 => '1', others => '0');
	--CMP_enable <= '1';
	CMP_sgn_usgn <= '0';
	wait for 10 ns;
	--------------------------------------------
	
	--TEST 3: compare unsigned middle scenario--
	CMP_OpA <= std_logic_vector(to_unsigned(5 , NBIT_DATA));
	CMP_OpB <= std_logic_vector(to_unsigned(1 , NBIT_DATA));
	--CMP_enable <= '1';
	CMP_sgn_usgn <= '0';
	wait for 10 ns;
	
	CMP_OpA <= std_logic_vector(to_unsigned(4 , NBIT_DATA));
	CMP_OpB <= std_logic_vector(to_unsigned(5 , NBIT_DATA));
	--CMP_enable <= '1';
	CMP_sgn_usgn <= '0';
	wait for 10 ns;
	--------------------------------------------
	
	--TEST 4: compare unsigned worst scenario--
	CMP_OpA <= (others => '0');
	CMP_OpB <= (0 => '1', others => '0');
	--CMP_enable <= '1';
	CMP_sgn_usgn <= '0';
	wait for 10 ns;
	
	CMP_OpA <= (0 => '1', others => '0');
	CMP_OpB <= (others => '0');
	--CMP_enable <= '1';
	CMP_sgn_usgn <= '0';
	wait for 10 ns;
	--------------------------------------------
	
	--TEST 5: compare signed both positive----
	CMP_OpA <= std_logic_vector(to_signed(5 , NBIT_DATA));
	CMP_OpB <= std_logic_vector(to_signed(7 , NBIT_DATA));
	--CMP_enable <= '1';
	CMP_sgn_usgn <= '1';
	wait for 10 ns;
	
	CMP_OpA <= std_logic_vector(to_signed(4 , NBIT_DATA));
	CMP_OpB <= std_logic_vector(to_signed(7 , NBIT_DATA));
	--CMP_enable <= '1';
	CMP_sgn_usgn <= '1';
	wait for 10 ns;
	--------------------------------------------
	
	--TEST 6: compare signed both negative------
	CMP_OpA <= std_logic_vector(to_signed(-5 , NBIT_DATA));
	CMP_OpB <= std_logic_vector(to_signed(-6 , NBIT_DATA));
	--CMP_enable <= '1';
	CMP_sgn_usgn <= '1';
	wait for 10 ns;
	
	CMP_OpA <= std_logic_vector(to_signed(-4 , NBIT_DATA));
	CMP_OpB <= std_logic_vector(to_signed(-3 , NBIT_DATA));
	--CMP_enable <= '1';
	CMP_sgn_usgn <= '1';
	wait for 10 ns;
	--------------------------------------------
	
	--TEST 7: compare signed discordant numbers-
	CMP_OpA <= std_logic_vector(to_signed(-5 , NBIT_DATA));
	CMP_OpB <= std_logic_vector(to_signed(1 , NBIT_DATA));
	--CMP_enable <= '1';
	CMP_sgn_usgn <= '1';
	wait for 10 ns;
	
	CMP_OpA <= std_logic_vector(to_signed(4, NBIT_DATA));
	CMP_OpB <= std_logic_vector(to_signed(-3 , NBIT_DATA));
	--CMP_enable <= '1';
	CMP_sgn_usgn <= '1';
	wait for 10 ns;
	--------------------------------------------
	
	
	--TEST 8: equality of zero-----------------
	CMP_OpA <= std_logic_vector(to_signed(0 , NBIT_DATA));
	CMP_OpB <= std_logic_vector(to_signed(0 , NBIT_DATA));
	CMP_sgn_usgn <= '1';
	wait for 10 ns;
	
	CMP_OpA <= std_logic_vector(to_signed(0 , NBIT_DATA));
	CMP_OpB <= std_logic_vector(to_signed(0 , NBIT_DATA));
	CMP_sgn_usgn <= '0';
	wait for 10 ns;
	--------------------------------------------
	
	--TEST 9: equality of unsigned---------------
	CMP_OpA <= (NBIT_DATA-1 => '1', others => '0');
	CMP_OpB <= (NBIT_DATA-1 => '1', others => '0');
	CMP_sgn_usgn <= '0';
	wait for 10 ns;
	
	CMP_OpA <= (NBIT_DATA-2 => '1', others => '0');
	CMP_OpB <= (NBIT_DATA-2 => '1', others => '0');
	CMP_sgn_usgn <= '0';
	wait for 10 ns;
	
	CMP_OpA <= (others => '1');
	CMP_OpB <= (others => '1');
	CMP_sgn_usgn <= '0';
	wait for 10 ns;
	--------------------------------------------
	
	--TEST 10: equality of signed---------------
	CMP_OpA <= (NBIT_DATA-1 => '1', others => '0');
	CMP_OpB <= (NBIT_DATA-1 => '1', others => '0');
	CMP_sgn_usgn <= '1';
	wait for 10 ns;
	
	CMP_OpA <= (NBIT_DATA-2 => '1', others => '0');
	CMP_OpB <= (NBIT_DATA-2 => '1', others => '0');
	CMP_sgn_usgn <= '1';
	wait for 10 ns;
	
	CMP_OpA <= (NBIT_DATA-1 => '1', others => '0');
	CMP_OpB <= (NBIT_DATA-2 => '1', others => '0');
	CMP_sgn_usgn <= '1';
	wait for 10 ns;
	
	CMP_OpA <= (others => '1');
	CMP_OpB <= (others => '1');
	CMP_sgn_usgn <= '1';
	wait for 10 ns;
	----------------------------------------------

	

      

      wait;
   end process;

END;
