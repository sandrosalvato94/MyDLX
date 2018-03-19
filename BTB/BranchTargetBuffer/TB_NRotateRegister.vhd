--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:17:45 09/17/2017
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/BTB/BranchTargetBuffer/TB_NRotateRegister.vhd
-- Project Name:  BranchTargetBuffer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: NRotateRegister
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
 
ENTITY TB_NRotateRegister IS
END TB_NRotateRegister;
 
ARCHITECTURE behavior OF TB_NRotateRegister IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    ----------CHANGE HERE GENERICS---------
    constant N 	       : integer := 32;
    constant DEFAULT_VALUE : integer := 1;
    ---------------------------------------
 
    COMPONENT NRotateRegister
    GENERIC(N: integer := 32;
	  DEFAULT_VALUE : integer := 1);
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         enable : IN  std_logic;
         load : IN  std_logic;
         data_in : IN  std_logic_vector(N-1 downto 0);
         rotate : IN  std_logic;
         data_out : OUT  std_logic_vector(N-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';
   signal enable : std_logic := '0';
   signal load : std_logic := '0';
   signal data_in : std_logic_vector(N-1 downto 0) := (others => '0');
   signal rotate : std_logic := '0';

 	--Outputs
   signal data_out : std_logic_vector(N-1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: NRotateRegister GENERIC MAP (N => N, DEFAULT_VALUE => DEFAULT_VALUE)
	PORT MAP (
          clk => clk,
          reset => reset,
          enable => enable,
          load => load,
          data_in => data_in,
          rotate => rotate,
          data_out => data_out
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
      -- hold reset state for 100 ns.
      
      wait for clk_period;
      
      reset  <= '0';
      enable <= '0';
      rotate <= '0';
      
      wait for clk_period;
      
      reset  <= '0';
      enable <= '0';
      rotate <= '1';
      
      wait for clk_period;
      
      reset  <= '0';
      enable <= '1';
      rotate <= '0';
      
      wait for clk_period;
      
      reset  <= '0';
      enable <= '1';
      rotate <= '1';
      
      wait for clk_period;
      
      reset  <= '0';
      enable <= '1';
      rotate <= '1';
      
      wait for clk_period;
      
      reset  <= '0';
      enable <= '1';
      rotate <= '1';
      
      wait for clk_period;
      
      reset  <= '0';
      enable <= '1';
      rotate <= '0';
      
      wait for clk_period;
      
      reset  <= '0';
      enable <= '0';
      rotate <= '0';
      
      wait for clk_period;
      
      reset  <= '1';
      enable <= '0';
      rotate <= '0';
      
      wait for clk_period;
      
      reset  <= '1';
      enable <= '0';
      rotate <= '1';
      
      wait for clk_period;
      
      reset  <= '1';
      enable <= '1';
      rotate <= '0';
      
      wait for clk_period;
      
      reset  <= '1';
      enable <= '1';
      rotate <= '1';
      
      wait for clk_period;
      
      reset  <= '0';
      enable <= '1';
      rotate <= '1';
      
      wait for clk_period;
      -- insert stimulus here 

      wait;
   end process;

END;
