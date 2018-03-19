--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:36:08 09/17/2017
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/BTB/BranchTargetBuffer/TB_MuxBit.vhd
-- Project Name:  BranchTargetBuffer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Mux_Bit
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
--USE ieee.numeric_std.ALL;
 
ENTITY TB_MuxBit IS
END TB_MuxBit;
 
ARCHITECTURE behavior OF TB_MuxBit IS 
 
------------CHANGE HERE GENERICS------------
	constant NBIT_Sel : integer := 2;
--------------------------------------------
 
	component Mux_Bit is
	generic(NBIT_Sel : integer := 2);
	port(
		inputs : in  std_logic_vector(2**NBIT_Sel-1 downto 0);
		sel    : in  std_logic_vector(NBIT_Sel-1 downto 0);
		output : out std_logic
	);
	end component;
    

   --Inputs
   signal inputs : std_logic_vector(2**NBIT_Sel-1 downto 0) := (others => '0');
   signal sel : std_logic_vector(NBIT_Sel-1 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux_Bit GENERIC MAP (NBIT_Sel => NBIT_Sel) 
   PORT MAP (
          inputs => inputs,
          sel => sel,
          output => output
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
	wait for 5 ns;

	inputs <= (others => '0');
	sel <= (others => '0');
	wait for 5 ns;
	
	inputs <= (0 => '1', others => '0');
	sel <= (others => '0');
	wait for 5 ns;
	
	inputs <= (0 => '1', others => '0');
	sel <= (others => '1');
	wait for 5 ns;
	
	inputs <= (2**NBIT_Sel-1 => '1', others => '0');
	sel <= (others => '1');
	wait for 5 ns;


	wait;
   end process;

END;
