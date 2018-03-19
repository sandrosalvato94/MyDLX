--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:43:09 10/05/2017
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/Adders/RippleCarryAdder/TB_RippleCarryAdder.vhd
-- Project Name:  RippleCarryAdder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RippleCarryAdder
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
 
ENTITY TB_RippleCarryAdder IS
END TB_RippleCarryAdder;
 
ARCHITECTURE behavior OF TB_RippleCarryAdder IS 
 
    -------CHANGE HERE GENERICS-------
    constant N: integer := 32;
    ----------------------------------
 
    COMPONENT RippleCarryAdder
    GENERIC (N : integer := 32);
    PORT(
         A : IN  std_logic_vector(N-1 downto 0);
         B : IN  std_logic_vector(N-1 downto 0);
         Cin : IN  std_logic;
         Sum : OUT  std_logic_vector(N-1 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(N-1 downto 0) := (others => '0');
   signal B : std_logic_vector(N-1 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal Sum : std_logic_vector(N-1 downto 0);
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RippleCarryAdder GENERIC MAP (N=>N)
	PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Sum => Sum,
          Cout => Cout
        );

  

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 1 ns;

      A <= std_logic_vector(to_unsigned(0, N));
      B <= std_logic_vector(to_unsigned(1, N));
      Cin <= '0';
      
      wait for 5 ns;
      
      A <= std_logic_vector(to_unsigned(0, N));
      B <= std_logic_vector(to_unsigned(1, N));
      Cin <= '1';
      
      wait for 5 ns;
      
      A <= std_logic_vector(to_unsigned(1, N));
      B <= std_logic_vector(to_unsigned(0, N));
      Cin <= '1';
      
      wait for 5 ns;
      
      A <= (others => '1');
      B <= (others => '1');
      Cin <= '0';
      
      wait for 5 ns;
      
      A <= (others => '1');
      B <= (others => '1');
      Cin <= '1';
      
      wait for 5 ns;
      
       
      A <= (others => '1');
      B <= (others => '0');
      Cin <= '0';
      
      wait for 5 ns;
      
      A <= (others => '1');
      B <= (others => '0');
      Cin <= '1';
      
      wait for 5 ns;
      
      A <= std_logic_vector(to_unsigned(527, N));
      B <= std_logic_vector(to_unsigned(1000, N));
      Cin <= '1';
      
      wait for 5 ns;
      wait;
   end process;

END;
