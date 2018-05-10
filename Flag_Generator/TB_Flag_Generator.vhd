--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:09:50 05/10/2018
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/Flag_Generator/TB_Flag_Generator.vhd
-- Project Name:  Flag_Generator
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Flag_Generator
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
 
ENTITY TB_Flag_Generator IS
END TB_Flag_Generator;
 
ARCHITECTURE behavior OF TB_Flag_Generator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    -------CHANGE HERE GENERICS-------
    constant NBIT_ALU : integer := 32;
    ----------------------------------
 
    COMPONENT Flag_Generator
    GENERIC (NBIT_ALU : integer := 32);
    PORT(
         FG_ALU_out : IN  std_logic_vector(NBIT_ALU-1 downto 0);
         FG_sgn_usgn : IN  std_logic;
         FG_carry : IN  std_logic;
         FG_ZF : OUT  std_logic;
         FG_PF : OUT  std_logic;
         FG_SF : OUT  std_logic;
         FG_CF : OUT  std_logic;
         FG_OF : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal FG_ALU_out : std_logic_vector(NBIT_ALU-1 downto 0) := (others => '0');
   signal FG_sgn_usgn : std_logic := '0';
   signal FG_carry : std_logic := '0';

 	--Outputs
   signal FG_ZF : std_logic;
   signal FG_PF : std_logic;
   signal FG_SF : std_logic;
   signal FG_CF : std_logic;
   signal FG_OF : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Flag_Generator GENERIC MAP (NBIT_ALU => NBIT_ALU)
	PORT MAP (
          FG_ALU_out => FG_ALU_out,
          FG_sgn_usgn => FG_sgn_usgn,
          FG_carry => FG_carry,
          FG_ZF => FG_ZF,
          FG_PF => FG_PF,
          FG_SF => FG_SF,
          FG_CF => FG_CF,
          FG_OF => FG_OF
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
	
	--TEST 1: Idle----------------------------
	FG_ALU_out <= std_logic_vector(to_unsigned(0, NBIT_ALU));
	FG_sgn_usgn <= '0';
	FG_carry <= '0';
	wait for 1 ns;
	assert (FG_ZF = '1') report "ZF expected to 1";
	assert (FG_PF = '1') report "PF expected to 1";
	assert (FG_SF = '0') report "SF expected to 0";
	assert (FG_CF = '0') report "CF expected to 0";
	assert (FG_OF = '0') report "OF expected to 0";
	wait for 9 ns;
	-------------------------------------------
	
	--TEST 2: All 1's no carry------------------
	FG_ALU_out <= (others => '1');
	FG_sgn_usgn <= '0';
	FG_carry <= '0';
	wait for 1 ns;
	assert (FG_ZF = '0') report "ZF expected to 0";
	assert (FG_PF = '1') report "PF expected to 1";
	assert (FG_SF = '0') report "SF expected to 0";
	assert (FG_CF = '0') report "CF expected to 0";
	assert (FG_OF = '0') report "OF expected to 0";
	wait for 9 ns;
	
	FG_ALU_out <= (others => '1');
	FG_sgn_usgn <= '1';
	FG_carry <= '0';
	wait for 1 ns;
	assert (FG_ZF = '0') report "ZF expected to 0";
	assert (FG_PF = '1') report "PF expected to 1";
	assert (FG_SF = '1') report "SF expected to 1";
	assert (FG_CF = '0') report "CF expected to 0";
	assert (FG_OF = '0') report "OF expected to 0";
	wait for 9 ns;
	-------------------------------------------
	
	--TEST 3: All 0's, yes carry---------------
	FG_ALU_out <= (others => '0');
	FG_sgn_usgn <= '0';
	FG_carry <= '1';
	wait for 1 ns;
	assert (FG_ZF = '1') report "ZF expected to 1";
	assert (FG_PF = '1') report "PF expected to 1";
	assert (FG_SF = '0') report "SF expected to 0";
	assert (FG_CF = '1') report "CF expected to 1";
	assert (FG_OF = '0') report "OF expected to 0";
	wait for 9 ns;
	
	FG_ALU_out <= (others => '0');
	FG_sgn_usgn <= '1';
	FG_carry <= '1';
	wait for 1 ns;
	assert (FG_ZF = '1') report "ZF expected to 1";
	assert (FG_PF = '1') report "PF expected to 1";
	assert (FG_SF = '0') report "SF expected to 0";
	assert (FG_CF = '0') report "CF expected to 0";
	assert (FG_OF = '1') report "OF expected to 1";
	wait for 9 ns;
	-------------------------------------------
	
	--TEST 4: All 1's, yes carry---------------
	FG_ALU_out <= (others => '1');
	FG_sgn_usgn <= '0';
	FG_carry <= '1';
	wait for 1 ns;
	assert (FG_ZF = '0') report "ZF expected to 0";
	assert (FG_PF = '1') report "PF expected to 1";
	assert (FG_SF = '0') report "SF expected to 0";
	assert (FG_CF = '1') report "CF expected to 1";
	assert (FG_OF = '0') report "OF expected to 0";
	wait for 9 ns;
	
	FG_ALU_out <= (others => '1');
	FG_sgn_usgn <= '1';
	FG_carry <= '1';
	wait for 1 ns;
	assert (FG_ZF = '0') report "ZF expected to 0";
	assert (FG_PF = '1') report "PF expected to 1";
	assert (FG_SF = '1') report "SF expected to 1";
	assert (FG_CF = '0') report "CF expected to 0";
	assert (FG_OF = '1') report "OF expected to 1";
	wait for 9 ns;
	-------------------------------------------
	
	--TEST 5: All flag 0s-----------------------
	FG_ALU_out <= std_logic_vector(to_unsigned(1, NBIT_ALU));
	FG_sgn_usgn <= '0';
	FG_carry <= '0';
	wait for 1 ns;
	assert (FG_ZF = '0') report "ZF expected to 0";
	assert (FG_PF = '0') report "PF expected to 1";
	assert (FG_SF = '0') report "SF expected to 0";
	assert (FG_CF = '0') report "CF expected to 0";
	assert (FG_OF = '0') report "OF expected to 0";
	wait for 9 ns;
	-------------------------------------------
	
	--TEST 6: All 1's, yes carry---------------
	FG_ALU_out <= (0 => '0', others => '1');
	FG_sgn_usgn <= '0';
	FG_carry <= '0';
	wait for 1 ns;
	assert (FG_ZF = '0') report "ZF expected to 0";
	assert (FG_PF = '0') report "PF expected to 0";
	assert (FG_SF = '0') report "SF expected to 0";
	assert (FG_CF = '0') report "CF expected to 0";
	assert (FG_OF = '0') report "OF expected to 0";
	wait for 9 ns;
	
	FG_ALU_out <= (0 => '0', others => '1');
	FG_sgn_usgn <= '1';
	FG_carry <= '0';
	wait for 1 ns;
	assert (FG_ZF = '0') report "ZF expected to 0";
	assert (FG_PF = '0') report "PF expected to 0";
	assert (FG_SF = '1') report "SF expected to 1";
	assert (FG_CF = '0') report "CF expected to 0";
	assert (FG_OF = '0') report "OF expected to 0";
	wait for 9 ns;
	
	FG_ALU_out <= (0 => '0', others => '1');
	FG_sgn_usgn <= '0';
	FG_carry <= '1';
	wait for 1 ns;
	assert (FG_ZF = '0') report "ZF expected to 0";
	assert (FG_PF = '0') report "PF expected to 0";
	assert (FG_SF = '0') report "SF expected to 0";
	assert (FG_CF = '1') report "CF expected to 1";
	assert (FG_OF = '0') report "OF expected to 0";
	wait for 9 ns;
	
	FG_ALU_out <= (0 => '0', others => '1');
	FG_sgn_usgn <= '1';
	FG_carry <= '1';
	wait for 1 ns;
	assert (FG_ZF = '0') report "ZF expected to 0";
	assert (FG_PF = '0') report "PF expected to 0";
	assert (FG_SF = '1') report "SF expected to 1";
	assert (FG_CF = '0') report "CF expected to 0";
	assert (FG_OF = '1') report "OF expected to 1";
	wait for 9 ns;
	-------------------------------------------

      wait;
   end process;

END;
