--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:22:35 09/14/2017
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/BTB/BranchTargetBuffer/TB_NPriorityEncoder.vhd
-- Project Name:  BranchTargetBuffer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: NPriorityEncoder
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
use ieee.std_logic_unsigned.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_NPriorityEncoder IS
END TB_NPriorityEncoder;
 
ARCHITECTURE behavior OF TB_NPriorityEncoder IS 
 
    
    ----------CHANGE HERE GENERICS----------
	constant NBIT_OUT: integer := 5;
    ----------------------------------------
    
    COMPONENT NPriorityEncoder
    GENERIC (NBIT_OUT : integer := 5);
    PORT(
         data_in : in  std_logic_vector(0 to 2**NBIT_OUT-1);
	enable:	in  std_logic;
	data_out: out std_logic_vector(0 to NBIT_OUT-1)
        );
    END COMPONENT;
    

   --Inputs
   signal data_in : std_logic_vector(0 to 2**NBIT_OUT-1) := (others => '0');
   signal enable : std_logic := '0';

 	--Outputs
   signal data_out : std_logic_vector(0 to NBIT_OUT-1);
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: NPriorityEncoder 
   GENERIC MAP (NBIT_OUT => NBIT_OUT) 
   PORT MAP (
          data_in => data_in,
          enable => enable,
          data_out => data_out
        );

  

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;

      for i in 0 to 2**(2**NBIT_OUT)-1 loop
	data_in <= data_in + 1;
	wait for 10 ns;
      end loop;
      
      
      enable <= '1';
      data_in <= (others => '0');
      wait for 10 ns;
      
       for i in 0 to 2**(2**NBIT_OUT)-1 loop
	data_in <= data_in + 1;
	wait for 10 ns;
      end loop;

      -- insert stimulus here 

      wait;
   end process;

END;
