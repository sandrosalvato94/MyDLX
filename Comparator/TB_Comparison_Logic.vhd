--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:10:41 05/08/2018
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/Comparator/TB_Comparison_Logic.vhd
-- Project Name:  Comparator
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Comparison_Logic
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
 
ENTITY TB_Comparison_Logic IS
END TB_Comparison_Logic;
 
ARCHITECTURE behavior OF TB_Comparison_Logic IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    -------CHANGE HERE GENERICS--------
    constant NBIT_DATA : integer := 32;
    -----------------------------------
 
    COMPONENT Comparison_Logic
    GENERIC(NBIT_DATA : integer := 32);
    PORT(
         CMPL_OpA : IN  std_logic_vector(NBIT_DATA-1 downto 0);
         CMPL_OpB : IN  std_logic_vector(NBIT_DATA-1 downto 0);
         CMPL_OPCODE : IN  std_logic_vector(3 downto 0);
         CMPL_Y : OUT  std_logic_vector(NBIT_DATA-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CMPL_OpA : std_logic_vector(NBIT_DATA-1 downto 0) := (others => '0');
   signal CMPL_OpB : std_logic_vector(NBIT_DATA-1 downto 0) := (others => '0');
   signal CMPL_OPCODE : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal CMPL_Y : std_logic_vector(NBIT_DATA-1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
   
   --constants
   
   constant OP_LT	: std_logic_vector(2 downto 0) := "000";
   constant OP_GT	: std_logic_vector(2 downto 0) := "001";
   constant OP_LE	: std_logic_vector(2 downto 0) := "010";
   constant OP_GE	: std_logic_vector(2 downto 0) := "011";
   constant OP_EQ	: std_logic_vector(2 downto 0) := "100";
   
   constant ZERO 	: std_logic_vector(NBIT_DATA-1 downto 0) := (others => '0');
   constant ONE	: std_logic_vector(NBIT_DATA-1 downto 0) := (0 => '1', others => '0');
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Comparison_Logic GENERIC MAP (NBIT_DATA => NBIT_DATA) PORT MAP (
          CMPL_OpA => CMPL_OpA,
          CMPL_OpB => CMPL_OpB,
          CMPL_OPCODE => CMPL_OPCODE,
          CMPL_Y => CMPL_Y
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
	--TEST 1: unvalid opcode--------------------
	CMPL_OpA <= std_logic_vector(to_unsigned(4 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_signed(-4 , NBIT_DATA));
	CMPL_Opcode <= "1111";
	--assert (CMPL_Y = ZERO) report "Expected zero for unvalid opcode";
	wait for 1 ns;
	assert (CMPL_Y = ZERO) report "Expected zero for unvalid opcode";
	wait for 9 ns;
	
	CMPL_OpA <= std_logic_vector(to_unsigned(4 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_signed(-4 , NBIT_DATA));
	CMPL_Opcode <= "0110";
	--assert (CMPL_Y = ZERO) report "Expected zero for unvalid opcode";
	wait for 1 ns;
	assert (CMPL_Y = ZERO) report "Expected zero for unvalid opcode";
	wait for 9 ns;
	
	CMPL_OpA <= std_logic_vector(to_unsigned(4 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_signed(-5 , NBIT_DATA));
	CMPL_Opcode <= "1100";
	--assert (CMPL_Y = ZERO) report "Expected zero for unvalid opcode";
	wait for 1 ns;
	assert (CMPL_Y = ZERO) report "Expected zero for unvalid opcode";
	wait for 9 ns;
	
	CMPL_OpA <= std_logic_vector(to_unsigned(4 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_signed(-5 , NBIT_DATA));
	CMPL_Opcode <= "0101";
	--assert (CMPL_Y = ZERO) report "Expected zero for unvalid opcode";
	wait for 1 ns;
	assert (CMPL_Y = ZERO) report "Expected zero for unvalid opcode";
	wait for 9 ns;
	--------------------------------------------
	
	--TEST 2: compare unsigned lt----------------
	CMPL_OpA <= std_logic_vector(to_unsigned(3 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_unsigned(4 , NBIT_DATA));
	CMPL_Opcode <= '0' & OP_LT;
	--assert (CMPL_Y = ONE) report "Expected one for A lt B"; 
	wait for 1 ns;
	assert (CMPL_Y = ONE) report "Expected one for A lt B"; 
	wait for 9 ns;
	
	CMPL_OpA <= std_logic_vector(to_unsigned(4 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_unsigned(3 , NBIT_DATA));
	CMPL_Opcode <= '0' & OP_LT;
	--assert (CMPL_Y = ZERO) report "Expected zero for !(A lt B)"; 
	wait for 1 ns;
	assert (CMPL_Y = ZERO) report "Expected zero for !(A lt B)"; 
	wait for 9 ns;
	--------------------------------------------
	
	--TEST 3: compare unsigned gt--------------
	CMPL_OpA <= std_logic_vector(to_unsigned(5 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_unsigned(1 , NBIT_DATA));
	CMPL_Opcode <= '0' & OP_GT;
	--assert (CMPL_Y = ONE) report "Expected one for A gt B";
	wait for 1 ns;
	assert (CMPL_Y = ONE) report "Expected one for A gt B";
	wait for 9 ns;
	
	CMPL_OpA <= std_logic_vector(to_unsigned(4 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_unsigned(5 , NBIT_DATA));
	CMPL_Opcode <= '0' & OP_GT;
	--assert (CMPL_Y = ZERO) report "Expected zero for !(A gt B)"; 
	wait for 1 ns;
	assert (CMPL_Y = ZERO) report "Expected zero for !(A gt B)"; 
	wait for 9 ns;
	--------------------------------------------
	
	--TEST 4: compare unsigned eq---------------
	CMPL_OpA <= std_logic_vector(to_unsigned(4 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_unsigned(4 , NBIT_DATA));
	CMPL_Opcode <= '0' & OP_EQ;
	--assert (CMPL_Y = ONE) report "Expected one for A eq B";
	wait for 1 ns;
	assert (CMPL_Y = ONE) report "Expected one for A eq B";
	wait for 9 ns;
	
	CMPL_OpA <= std_logic_vector(to_unsigned(4 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_unsigned(5 , NBIT_DATA));
	CMPL_Opcode <= '0' & OP_EQ;
	--assert (CMPL_Y = ZERO) report "Expected zero for !(A eq B)";
	wait for 1 ns;
	assert (CMPL_Y = ZERO) report "Expected zero for !(A eq B)";
	wait for 9 ns;
	--------------------------------------------
	
	--TEST 4: compare unsigned ge---------------
	CMPL_OpA <= std_logic_vector(to_unsigned(4 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_unsigned(4 , NBIT_DATA));
	CMPL_Opcode <= '0' & OP_GE;
	--assert (CMPL_Y = ONE) report "Expected one for A ge B";
	wait for 1 ns;
	assert (CMPL_Y = ONE) report "Expected one for A ge B";
	wait for 9 ns;
	
	CMPL_OpA <= std_logic_vector(to_unsigned(5 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_unsigned(4 , NBIT_DATA));
	CMPL_Opcode <= '0' & OP_GE;
	--assert (CMPL_Y = ONE) report "Expected one for A ge B";
	wait for 1 ns;
	assert (CMPL_Y = ONE) report "Expected one for A ge B";
	wait for 9 ns;
	
	CMPL_OpA <= std_logic_vector(to_unsigned(4 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_unsigned(5 , NBIT_DATA));
	CMPL_Opcode <= '0' & OP_GE;
	--assert (CMPL_Y = ZERO) report "Expected zero for !(A ge B)";
	wait for 1 ns;
	assert (CMPL_Y = ZERO) report "Expected zero for !(A ge B)";
	wait for 9 ns;
	--------------------------------------------
	
	--TEST 5: compare unsigned le---------------
	CMPL_OpA <= std_logic_vector(to_unsigned(4 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_unsigned(4 , NBIT_DATA));
	CMPL_Opcode <= '0' & OP_LE;
	--assert (CMPL_Y = ONE) report "Expected one for A le B";
	wait for 1 ns;
	assert (CMPL_Y = ONE) report "Expected one for A le B";
	wait for 9 ns;
	
	CMPL_OpA <= std_logic_vector(to_unsigned(4 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_unsigned(5 , NBIT_DATA));
	CMPL_Opcode <= '0' & OP_LE;
	--assert (CMPL_Y = ONE) report "Expected one for A le B";
	wait for 1 ns;
	assert (CMPL_Y = ONE) report "Expected one for A le B";
	wait for 9 ns;
	
	CMPL_OpA <= std_logic_vector(to_unsigned(5 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_unsigned(4 , NBIT_DATA));
	CMPL_Opcode <= '0' & OP_LE;
	--assert (CMPL_Y = ZERO) report "Expected zero for !(A le B)";
	wait for 1 ns;
	assert (CMPL_Y = ZERO) report "Expected zero for !(A le B)";
	wait for 9 ns;
	--------------------------------------------
	
	--TEST 5: compare signed  lt----------------
	CMPL_OpA <= std_logic_vector(to_signed(-75 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_signed(7 , NBIT_DATA));
	CMPL_Opcode <= '1' & OP_LT;
	--assert (CMPL_Y = ONE) report "Expected one for A lt B";
	wait for 1 ns;
	assert (CMPL_Y = ONE) report "Expected one for A lt B";
	wait for 9 ns;
	
	CMPL_OpA <= std_logic_vector(to_signed(7 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_signed(4 , NBIT_DATA));
	CMPL_Opcode <= '1' & OP_LT;
	--assert (CMPL_Y = ZERO) report "Expected zero for !(A lt B)";
	wait for 1 ns;
	assert (CMPL_Y = ZERO) report "Expected zero for !(A lt B)";
	wait for 9 ns;
	--------------------------------------------
	
	--TEST 6: compare signed gt------
	CMPL_OpA <= std_logic_vector(to_signed(-5 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_signed(-6 , NBIT_DATA));
	CMPL_Opcode <= '1' & OP_GT;
	--assert (CMPL_Y = ONE) report "Expected one for A gt B";
	wait for 1 ns;
	assert (CMPL_Y = ONE) report "Expected one for A gt B";
	wait for 9 ns;
	
	CMPL_OpA <= std_logic_vector(to_signed(-4 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_signed(-3 , NBIT_DATA));
	CMPL_Opcode <= '1' & OP_GT;
	--assert (CMPL_Y = ZERO) report "Expected zero for !(A gt B)";
	wait for 1 ns;
	assert (CMPL_Y = ZERO) report "Expected zero for !(A gt B)";
	wait for 9 ns;
	--------------------------------------------
	
	--TEST 7: compare signed eq---------------
	CMPL_OpA <= std_logic_vector(to_signed(-5 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_signed(-5 , NBIT_DATA));
	CMPL_Opcode <= '1' & OP_EQ;
	--assert (CMPL_Y = ONE) report "Expected one for A eq B";
	wait for 1 ns;
	assert (CMPL_Y = ONE) report "Expected one for A eq B";
	wait for 9 ns;
	
	CMPL_OpA <= std_logic_vector(to_signed(4, NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_signed(-3 , NBIT_DATA));
	CMPL_Opcode <= '1' & OP_EQ;
	--assert (CMPL_Y = ZERO) report "Expected zero for !(A et B)";
	wait for 1 ns;
	assert (CMPL_Y = ZERO) report "Expected zero for !(A et B)";
	wait for 9 ns;
	--------------------------------------------
	
	
	--TEST 8: compare signed le-----------------
	CMPL_OpA <= std_logic_vector(to_signed(-4 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_signed(-4 , NBIT_DATA));
	CMPL_Opcode <= '1' & OP_LE;
	--assert (CMPL_Y = ONE) report "Expected one for A le B";
	wait for 1 ns;
	assert (CMPL_Y = ONE) report "Expected one for A le B";
	wait for 9 ns;
	
	CMPL_OpA <= std_logic_vector(to_signed(-54 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_signed(5 , NBIT_DATA));
	CMPL_Opcode <= '1' & OP_LE;
--	assert (CMPL_Y = ONE) report "Expected one for A le B";
	wait for 1 ns;
	assert (CMPL_Y = ONE) report "Expected one for A le B";
	wait for 9 ns;
	
	CMPL_OpA <= std_logic_vector(to_signed(5 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_signed(-4 , NBIT_DATA));
	CMPL_Opcode <= '1' & OP_LE;
--	assert (CMPL_Y = ZERO) report "Expected zero for !(A le B)";
	wait for 1 ns;
	assert (CMPL_Y = ZERO) report "Expected zero for !(A le B)";
	wait for 9 ns;
	--------------------------------------------
	
	--TEST 9: compare signed ge-----------------
	CMPL_OpA <= std_logic_vector(to_signed(-4 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_signed(-4 , NBIT_DATA));
	CMPL_Opcode <= '1' & OP_GE;
--	assert (CMPL_Y = ONE) report "Expected one for A ge B";
	wait for 1 ns;
	assert (CMPL_Y = ONE) report "Expected one for A ge B";
	wait for 9 ns;
	
	CMPL_OpA <= std_logic_vector(to_signed(5 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_signed(-4 , NBIT_DATA));
	CMPL_Opcode <= '1' & OP_GE;
--	assert (CMPL_Y = ONE) report "Expected one for A ge B";
	wait for 1 ns;
	assert (CMPL_Y = ONE) report "Expected one for A ge B";
	wait for 9 ns;
	
	CMPL_OpA <= std_logic_vector(to_signed(4 , NBIT_DATA));
	CMPL_OpB <= std_logic_vector(to_signed(5 , NBIT_DATA));
	CMPL_Opcode <= '1' & OP_GE;
--	assert (CMPL_Y = ZERO) report "Expected zero for !(A ge B)";
	wait for 1 ns;
	assert (CMPL_Y = ZERO) report "Expected zero for !(A ge B)";
	wait for 9 ns;
	--------------------------------------------
	
	

      wait;
   end process;

END;
