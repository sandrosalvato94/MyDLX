--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:06:55 09/19/2017
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/BTB/BranchTargetBuffer/TB_NShiftRegisterSISO.vhd
-- Project Name:  BranchTargetBuffer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: NShiftRegisterSISO
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
 
ENTITY TB_NShiftRegisterSISO IS
END TB_NShiftRegisterSISO;
 
ARCHITECTURE behavior OF TB_NShiftRegisterSISO IS 
 
---------CHANGE HERE GENERICS---------
	constant N : integer := 2;
--------------------------------------
	
	component NShiftRegisterSISO is
	generic(N: integer := 2);
	port(
		clk     : in  std_logic;
		reset   : in  std_logic;
		enable  : in  std_logic;
		load    : in  std_logic;
		bit_in  : in  std_logic;
		shift   : in  std_logic;
		bit_out : out std_logic
	);
	end component;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';
   signal enable : std_logic := '0';
   signal load : std_logic := '0';
   signal bit_in : std_logic := '0';
   signal shift : std_logic := '0';

 	--Outputs
   signal bit_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: NShiftRegisterSISO GENERIC MAP (N=>N)
	PORT MAP (
          clk => clk,
          reset => reset,
          enable => enable,
          load => load,
          bit_in => bit_in,
          shift => shift,
          bit_out => bit_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      
      wait for clk_period;
      
      reset <= '1';
      enable <= '0';
      bit_in <= '0';
      shift <= '0';
      load <= '0';
      
      wait for clk_period;
      
      reset <= '1';
      enable <= '0';
      bit_in <= '0';
      shift <= '0';
      load <= '1';
      
      wait for clk_period;
      
      reset <= '1';
      enable <= '0';
      bit_in <= '0';
      shift <= '1';
      load <= '0';
      
      wait for clk_period;
      
      reset <= '1';
      enable <= '0';
      bit_in <= '0';
      shift <= '1';
      load <= '1';
      
      wait for clk_period;
      
      reset <= '1';
      enable <= '0';
      bit_in <= '1';
      shift <= '0';
      load <= '0';
      
      wait for clk_period;
      
      reset <= '1';
      enable <= '0';
      bit_in <= '1';
      shift <= '0';
      load <= '1';
      
      wait for clk_period;
      
      reset <= '1';
      enable <= '0';
      bit_in <= '1';
      shift <= '1';
      load <= '0';
      
      wait for clk_period;
      
      reset <= '1';
      enable <= '0';
      bit_in <= '1';
      shift <= '1';
      load <= '1';
      
      wait for clk_period;
      
      reset <= '1';
      enable <= '1';
      bit_in <= '1';
      shift <= '0';
      load <= '0';
      
      wait for clk_period;
      
      reset <= '1';
      enable <= '1';
      bit_in <= '1';
      shift <= '0';
      load <= '1';
      
      wait for clk_period;
      
      reset <= '1';
      enable <= '1';
      bit_in <= '1';
      shift <= '1';
      load <= '0';
      
      wait for clk_period;
      
      reset <= '1';
      enable <= '1';
      bit_in <= '1';
      shift <= '1';
      load <= '1';
      
      wait for clk_period;
      
      reset <= '1';
      enable <= '0';
      bit_in <= '1';
      shift <= '0';
      load <= '0';
      
      wait for clk_period;
      
      reset <= '1';
      enable <= '0';
      bit_in <= '1';
      shift <= '0';
      load <= '1';
      
      wait for clk_period;
      
      reset <= '1';
      enable <= '1';
      bit_in <= '0';
      shift <= '1';
      load <= '0';
      
      wait for clk_period;
      
      reset <= '1';
      enable <= '1';
      bit_in <= '0';
      shift <= '1';
      load <= '1';
      
      wait for clk_period;
      
      reset <= '1';
      enable <= '1';
      bit_in <= '1';
      shift <= '0';
      load <= '0';
      
      wait for clk_period;
      
      --reset low
    
      reset <= '0';
      enable <= '0';
      bit_in <= '0';
      shift <= '0';
      load <= '0';
      
      wait for clk_period;
      
      reset <= '0';
      enable <= '0';
      bit_in <= '0';
      shift <= '0';
      load <= '1';
      
      wait for clk_period;
      
      reset <= '0';
      enable <= '0';
      bit_in <= '0';
      shift <= '1';
      load <= '0';
      
      wait for clk_period;
      
      reset <= '0';
      enable <= '0';
      bit_in <= '0';
      shift <= '1';
      load <= '1';
      
      wait for clk_period;
      
      reset <= '0';
      enable <= '0';
      bit_in <= '1';
      shift <= '0';
      load <= '0';
      
      wait for clk_period;
      
      reset <= '0';
      enable <= '0';
      bit_in <= '1';
      shift <= '0';
      load <= '1';
      
      wait for clk_period;
      
      reset <= '0';
      enable <= '0';
      bit_in <= '1';
      shift <= '1';
      load <= '0';
      
      wait for clk_period;
      
      reset <= '0';
      enable <= '0';
      bit_in <= '1';
      shift <= '1';
      load <= '1';
      
      wait for clk_period;
      
      reset <= '0';
      enable <= '1';
      bit_in <= '1';
      shift <= '0';
      load <= '0';
      
      wait for clk_period;
      
      reset <= '0';
      enable <= '1';
      bit_in <= '1';
      shift <= '0';
      load <= '1';
      
      wait for clk_period;
      
      reset <= '0';
      enable <= '1';
      bit_in <= '1';
      shift <= '1';
      load <= '0';
      
      wait for clk_period;
      
      reset <= '0';
      enable <= '1';
      bit_in <= '1';
      shift <= '1';
      load <= '1';
      
      wait for clk_period;
      
      reset <= '0';
      enable <= '0';
      bit_in <= '1';
      shift <= '0';
      load <= '0';
      
      wait for clk_period;
      
      reset <= '0';
      enable <= '0';
      bit_in <= '1';
      shift <= '0';
      load <= '1';
      
      wait for clk_period;
      
      reset <= '0';
      enable <= '1';
      bit_in <= '0';
      shift <= '1';
      load <= '0';
      
      wait for clk_period;
      
      reset <= '0';
      enable <= '1';
      bit_in <= '0';
      shift <= '1';
      load <= '1';
      
      wait for clk_period;
      
      reset <= '0';
      enable <= '1';
      bit_in <= '1';
      shift <= '0';
      load <= '0';
      
      wait for clk_period;
      
      reset <= '0';
      enable <= '1';
      bit_in <= '1';
      shift <= '1';
      load <= '0';
     

      -- insert stimulus here 

      wait;
   end process;

END;
