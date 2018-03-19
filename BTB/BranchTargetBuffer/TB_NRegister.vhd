--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:39:52 09/16/2017
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/BTB/BranchTargetBuffer/TB_NRegister.vhd
-- Project Name:  BranchTargetBuffer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: NRegister
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
 
ENTITY TB_NRegister IS
END TB_NRegister;
 
ARCHITECTURE behavior OF TB_NRegister IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    --------CHANGE HERE GENERICS--------
    constant N: integer := 32;
    ------------------------------------
 
    component NRegister is
	generic(N: integer:= 32);
	port(
		clk:	in  std_logic;
		reset:	in  std_logic; --Active high
		data_in:	in  std_logic_vector(N-1 downto 0);
		enable:	in  std_logic;
		load:	in  std_logic; --Load enable high
		data_out: out std_logic_vector(N-1 downto 0));
    end component;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal data_in : std_logic_vector(N-1 downto 0) := (others => '0');
   signal enable : std_logic := '0';
   signal load : std_logic := '0';

 	--Outputs
   signal data_out : std_logic_vector(N-1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: NRegister GENERIC MAP (N => N)
   PORT MAP (
          clk => clk,
          reset => reset,
          data_in => data_in,
          enable => enable,
          load => load,
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
      wait for 5 ns;
	
      data_in <= (N-1 => '1', others => '0');
      load <= '0';      
      enable <= '0';
      reset <= '1';

      wait for clk_period;
      
      data_in <= (N-2 => '1', others => '0');
      load <= '0';      
      enable <= '1';
      reset <= '0';

      wait for clk_period;
      
      data_in <= (N-3 => '1', others => '0');
      load <= '0';      
      enable <= '1';
      reset <= '1';

      wait for clk_period;
      
      data_in <= (N-1 => '1', others => '0');
      load <= '1';      
      enable <= '0';
      reset <= '0';

      wait for clk_period;
      
      data_in <= (N-2 => '1', others => '0');
      load <= '1';      
      enable <= '0';
      reset <= '1';

      wait for clk_period;
      
      data_in <= (N-3 => '1', others => '0');
      load <= '1';      
      enable <= '1';
      reset <= '0';

      wait for clk_period;
      
      data_in <= (N-1 => '1', others => '0');
      load <= '1';      
      enable <= '1';
      reset <= '0';

      wait for clk_period;
      
      data_in <= (N-2 => '1', others => '0');
      load <= '1';      
      enable <= '1';
      reset <= '0';

      wait for clk_period;
      
      data_in <= (N-3 => '1', others => '0');
      load <= '1';      
      enable <= '1';
      reset <= '0';

      wait for clk_period;
      
      data_in <= (N-1 => '1', others => '0');
      load <= '1';      
      enable <= '1';
      reset <= '1';

      wait for clk_period;
      
      data_in <= (N-2 => '1', others => '0');
      load <= '1';      
      enable <= '1';
      reset <= '1';

      wait for clk_period;

      -- insert stimulus here 

      wait;
   end process;

END;
