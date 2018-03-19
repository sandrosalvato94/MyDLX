--------------------------------------------------------------------------------
-- Company: 
-- Engineer:	Alessandro Salvato
--
-- Create Date:   11:26:51 04/22/2017
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/Laboratories/Lab02/P4Adder/TB_P4Adder.vhd
-- Project Name:  P4Adder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: P4Adder
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
 
ENTITY TB_P4Adder IS
END TB_P4Adder;
 
ARCHITECTURE behavior OF TB_P4Adder IS 
 
    -- *******CHANGE HERE TO PARAMETRIZE********
	constant N: integer:= 32;		
    --******************************************
    
    COMPONENT P4Adder
    GENERIC(N: integer := N);
    PORT(
         A : IN  std_logic_vector(N-1 downto 0);
         B : IN  std_logic_vector(N-1 downto 0);
         c_in : IN  std_logic;
         c_out: OUT std_logic;
         Sum : OUT  std_logic_vector(N-1 downto 0)
        );
    END COMPONENT;
    
    
	
   --Inputs
   signal A : std_logic_vector(N-1 downto 0) := (others => '0');
   signal B : std_logic_vector(N-1 downto 0) := (others => '0');
   signal c_in : std_logic := '0';

 	--Outputs
   signal c_out: std_logic;
   signal Sum : std_logic_vector(N-1 downto 0);
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: P4Adder GENERIC MAP (N=>N) PORT MAP (
          A => A,
          B => B,
          c_in => c_in,
	c_out => c_out,
          Sum => Sum
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

     A <= std_logic_vector(to_unsigned(0, N)); 
     B <= std_logic_vector(to_unsigned(0, N)) ;
     
     wait for 50 ns;
     
     A <= std_logic_vector(to_unsigned(1, N)); 
     B <= std_logic_vector(to_unsigned(0, N)) ;

     wait for 50 ns;
	
     A <= std_logic_vector(to_unsigned(1, N)); 
     B <= std_logic_vector(to_unsigned(1, N)) ;

     wait for 50 ns;
     
     A <= (others =>'1');
     B <= std_logic_vector(to_unsigned(1, N)) ;

     wait for 50 ns;
     
     A <= std_logic_vector(to_unsigned(2, N)); 
     B <= std_logic_vector(to_unsigned(2, N)) ;

     wait for 50 ns;
     
      A <= std_logic_vector(to_unsigned(3, N)); 
     B <= std_logic_vector(to_unsigned(3, N)) ;

     wait for 50 ns;
     
      A <= std_logic_vector(to_unsigned(10, N)); 
     B <= std_logic_vector(to_unsigned(256, N)) ;

     wait for 50 ns;
     
     A <= std_logic_vector(to_unsigned(65535, N)); 
     B <= std_logic_vector(to_unsigned(1, N)) ;

     wait for 50 ns;
     
      A <= std_logic_vector(to_unsigned(65535, N)); 
     B <= std_logic_vector(to_unsigned(0, N)) ;

     wait for 50 ns;
     
     A <= std_logic_vector(to_unsigned(0, N)); 
     B <= std_logic_vector(to_unsigned(0, N)) ;
     c_in <= '1';

     wait for 50 ns;
     
      A <= (others => '1');
     B <= std_logic_vector(to_unsigned(0, N)) ;
     c_in <= '1';

     wait for 50 ns;
     
     A <= (others => '1');
     B <= std_logic_vector(to_unsigned(1, N)) ;
     c_in <= '1';

     wait for 50 ns;
     
     A <= std_logic_vector(to_unsigned(13, N)); 
     B <= (1 => '0', 0 => '0', others => '1'); -- 2 NEG
     c_in <= '1';
     
     wait for 50 ns;
     
      A <= std_logic_vector(to_unsigned(13, N)); 
     B <= (0 => '0', others => '1'); -- 1 NEG
     c_in <= '1';
     
     wait for 50 ns;
     
      A <= std_logic_vector(to_unsigned(13, N)); 
     B <= (3 => '0', 2 => '1', 1 => '0', 0 => '1', others => '1'); -- 10 NEG
     c_in <= '1';
     
     wait for 50 ns;
     
     
     A <= (others => '1'); 
     B <= std_logic_vector(to_unsigned(1, N));
     c_in <= '0';
     
     wait for 50 ns;
     
     A <= (others => '1'); 
     B <= std_logic_vector(to_unsigned(1, N));
     c_in <= '1';
     
     wait for 50 ns;
     
     A <= (N-1 => '1', others => '0'); 
     B <= (N-1 => '1', others => '0');
     c_in <= '0';
     
     wait for 50 ns;
     
     A <= std_logic_vector(to_unsigned(7, N)); 
     B <= std_logic_vector(to_unsigned(8, N));
     c_in <= '0';
     
     wait for 50 ns;
	
     A <= (N-1 => '1', others => '0'); 
     B <= (N-1 => '1', others => '0');
     c_in <= '1';
     
     wait for 50 ns;

      wait;
   end process;

END;
