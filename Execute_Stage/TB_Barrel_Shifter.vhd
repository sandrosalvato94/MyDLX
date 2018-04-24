--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:57:50 10/27/2017
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/Execute_Stage/TB_Barrel_Shifter.vhd
-- Project Name:  Execute_Stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Barrel_Shifter
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
 
ENTITY TB_Barrel_Shifter IS
END TB_Barrel_Shifter;
 
ARCHITECTURE behavior OF TB_Barrel_Shifter IS 

    --constant NBIT_DATA   : integer := 16;
    
    
    --------CHANGES HERE GENERICS---------
    constant NBIT_AMOUNT : integer := 5;
    --------------------------------------
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Barrel_Shifter
    GENERIC(
	--NBIT_DATA : integer := 32;
	NBIT_AMOUNT : integer := 5);
    PORT(
         BS_data_in : IN  std_logic_vector(2**NBIT_AMOUNT-1 downto 0);
         BS_opcode : IN  std_logic_vector(1 downto 0);
         BS_amount : IN  std_logic_vector(NBIT_AMOUNT-1 downto 0);
         --BS_is_shift : in  std_logic;
         BS_data_out : OUT  std_logic_vector(2**NBIT_AMOUNT-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal BS_data_in : std_logic_vector(2**NBIT_AMOUNT-1 downto 0) := (others => '0');
   signal BS_opcode : std_logic_vector(1 downto 0) := (others => '0');
   signal BS_amount : std_logic_vector(NBIT_AMOUNT-1 downto 0) := (others => '0');
   --signal BS_is_shift : std_logic := '0';

 	--Outputs
   signal BS_data_out : std_logic_vector(2**NBIT_AMOUNT-1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Barrel_Shifter GENERIC MAP(--NBIT_DATA => NBIT_DATA,
			     NBIT_AMOUNT => NBIT_AMOUNT)
	PORT MAP (
          BS_data_in => BS_data_in,
          BS_opcode => BS_opcode,
          BS_amount => BS_amount,
	--BS_is_shift => BS_is_shift,
          BS_data_out => BS_data_out
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      
      --TEST 1: no input applied---------------
      
      wait for 10 ns;	
      -----------------------------------------
      
      --TEST 2: transapernt mode---------------
      BS_data_in <= std_logic_vector(to_unsigned(3, 2**NBIT_AMOUNT));
      BS_opcode <= "00";
      BS_amount <=  std_logic_vector(to_unsigned(7, NBIT_AMOUNT));
      --BS_is_shift <= '0';
      wait for 10 ns;	
      -----------------------------------------
      
      --TEST 2: transapernt mode---------------
      BS_data_in <= std_logic_vector(to_unsigned(27, 2**NBIT_AMOUNT));
      BS_opcode <= "00";
      BS_amount <= std_logic_vector(to_unsigned(1, NBIT_AMOUNT));
      --BS_is_shift <= '0';
      wait for 10 ns;	
      -----------------------------------------
      
      --TEST NBIT_AMOUNT-1: left shift all bits long-------
      BS_data_in <= std_logic_vector(to_unsigned(1, 2**NBIT_AMOUNT));
      BS_opcode <= "10";
      BS_amount <= (others => '1');
      --BS_is_shift <= '0';
      wait for 10 ns;	
      -----------------------------------------
      
      --TEST NBIT_AMOUNT-1: left shift all bits long-------
      BS_data_in <= (2**NBIT_AMOUNT-1 => '1', others => '0');
      BS_opcode <= "01";
      BS_amount <= std_logic_vector(to_unsigned(1, NBIT_AMOUNT));
      --BS_is_shift <= '0';
      wait for 10 ns;	
      -----------------------------------------
      
      --TEST NBIT_AMOUNT-1: left shift all bits long-------
      BS_data_in <= (2**NBIT_AMOUNT-1 => '1', others => '0');
      BS_opcode <= "01";
      BS_amount <= (others => '1');
      --BS_is_shift <= '0';
      wait for 10 ns;	
      -----------------------------------------
      
      --TEST NBIT_AMOUNT-1: right arith shift -------------
      BS_data_in <= (2**NBIT_AMOUNT-1 => '1', others => '0');
      BS_opcode <= "11";
      BS_amount <= (others => '1');
      --BS_is_shift <= '0';
      wait for 10 ns;	
      -----------------------------------------
      
      --TEST 5: left shift overbouncing--------
      BS_data_in <= (7 => '1', others => '0');
      BS_opcode <= "10";
      BS_amount <= (others => '1');
      --BS_is_shift <= '0';
      wait for 10 ns;	
      -----------------------------------------
      
      --TEST 6: right shift overbouncing-------
      BS_data_in <= (7 => '1', others => '0');
      BS_opcode <= "01";
      BS_amount <= (others => '1');
      --BS_is_shift <= '0';
      wait for 10 ns;	
      -----------------------------------------
      
      --TEST 7a: right arith shift overbouncing-
      BS_data_in <= (7 => '1', others => '0');
      BS_opcode <= "11";
      BS_amount <= (others => '1');
      --BS_is_shift <= '0';
      wait for 10 ns;	
      -----------------------------------------
      
      --TEST 7b: right arith shift overbouncing-
      BS_data_in <= (7  => '1', others => '0');
      BS_opcode <= "11";
      BS_amount <= (others => '1');
      --BS_is_shift <= '0';
      wait for 10 ns;	
      -----------------------------------------

      

      wait;
   end process;

END;
