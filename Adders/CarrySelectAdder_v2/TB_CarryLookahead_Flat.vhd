--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:36:38 10/07/2017
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/Adders/CarrySelectAdder_v2/TB_CarryLookahead_Flat.vhd
-- Project Name:  CarrySelectAdder_v2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CarryLookahead_Flat
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
 
ENTITY TB_CarryLookahead_Flat IS
END TB_CarryLookahead_Flat;
 
ARCHITECTURE behavior OF TB_CarryLookahead_Flat IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    constant N : integer := 4;
 
    COMPONENT CarryLookahead_Flat
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Cin : IN  std_logic;
         Cout : OUT  std_logic;
         Sum : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal Cout : std_logic;
   signal Sum : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CarryLookahead_Flat PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Cout => Cout,
          Sum => Sum
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 2 ns;
    
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
     B <= std_logic_vector(to_unsigned(15, N)) ;

     wait for 50 ns;
     
     A <= std_logic_vector(to_unsigned(7, N)); 
     B <= std_logic_vector(to_unsigned(1, N)) ;

     wait for 50 ns;
     
      A <= std_logic_vector(to_unsigned(9, N)); 
     B <= std_logic_vector(to_unsigned(0, N)) ;

     wait for 50 ns;
     
     A <= std_logic_vector(to_unsigned(0, N)); 
     B <= std_logic_vector(to_unsigned(0, N)) ;
     Cin <= '1';

     wait for 50 ns;
     
      A <= (others => '1');
     B <= std_logic_vector(to_unsigned(0, N)) ;
     Cin <= '1';

     wait for 50 ns;
     
     A <= (others => '1');
     B <= std_logic_vector(to_unsigned(1, N)) ;
     Cin <= '1';

     wait for 50 ns;
     
     A <= std_logic_vector(to_unsigned(13, N)); 
     B <= (1 => '0', 0 => '0', others => '1'); -- 2 NEG
     Cin <= '1';
     
     wait for 50 ns;
     
      A <= std_logic_vector(to_unsigned(13, N)); 
     B <= (0 => '0', others => '1'); -- 1 NEG
     Cin <= '1';
     
     wait for 50 ns;
     
      A <= std_logic_vector(to_unsigned(13, N)); 
     B <= (3 => '0', 2 => '1', 1 => '0', 0 => '1', others => '1'); -- 10 NEG
     Cin <= '1';
     
     wait for 50 ns;
     
     
     A <= (others => '1'); 
     B <= std_logic_vector(to_unsigned(1, N));
     Cin <= '0';
     
     wait for 50 ns;
     
     A <= (others => '1'); 
     B <= std_logic_vector(to_unsigned(1, N));
     Cin <= '1';
     
     wait for 50 ns;
     
     A <= (N-1 => '1', others => '0'); 
     B <= (N-1 => '1', others => '0');
     Cin <= '0';
     
     wait for 50 ns;
     
     A <= std_logic_vector(to_unsigned(7, N)); 
     B <= std_logic_vector(to_unsigned(8, N));
     Cin <= '0';
     
     wait for 50 ns;
	
     A <= (N-1 => '1', others => '0'); 
     B <= (N-1 => '1', others => '0');
     Cin <= '1';
     
     wait for 50 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
