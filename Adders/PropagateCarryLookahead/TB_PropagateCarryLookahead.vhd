--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:12:59 10/05/2017
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/Adders/PropagateCarryLookahead/TB_PropagateCarryLookahead.vhd
-- Project Name:  PropagateCarryLookahead
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PropagateCarryLookahead
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
 
ENTITY TB_PropagateCarryLookahead IS
END TB_PropagateCarryLookahead;
 
ARCHITECTURE behavior OF TB_PropagateCarryLookahead IS 
 
    -------CHANGE HERE GENERICS-------
    constant N : integer := 32;
    ----------------------------------
 
    COMPONENT PropagateCarryLookahead
    GENERIC( N : integer := 32);
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
   uut: PropagateCarryLookahead GENERIC MAP (N=>N) PORT MAP (
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
