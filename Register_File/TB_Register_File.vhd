--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:38:21 06/29/2018
-- Design Name:   
-- Module Name:   C:/Users/Alessandro/Documents/GitHub/MyDLX/Register_File/TB_Register_File.vhd
-- Project Name:  Register_File
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Register_File
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
 
ENTITY TB_Register_File IS
END TB_Register_File;
 
ARCHITECTURE behavior OF TB_Register_File IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Register_File
    PORT(
         RF_clk : IN  std_logic;
         RF_reset : IN  std_logic;
         RF_enable : IN  std_logic;
         RF_RD1 : IN  std_logic;
         RF_RD2 : IN  std_logic;
         RF_WR : IN  std_logic;
         RF_AddrRd1 : IN  std_logic_vector(4 downto 0);
         RF_AddrRd2 : IN  std_logic_vector(4 downto 0);
         RF_AddrWr : IN  std_logic_vector(4 downto 0);
         RF_data_in : IN  std_logic_vector(31 downto 0);
         RF_out1 : OUT  std_logic_vector(31 downto 0);
         RF_out2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RF_clk : std_logic := '0';
   signal RF_reset : std_logic := '1';
   signal RF_enable : std_logic := '0';
   signal RF_RD1 : std_logic := '0';
   signal RF_RD2 : std_logic := '0';
   signal RF_WR : std_logic := '0';
   signal RF_AddrRd1 : std_logic_vector(4 downto 0) := (others => '0');
   signal RF_AddrRd2 : std_logic_vector(4 downto 0) := (others => '0');
   signal RF_AddrWr : std_logic_vector(4 downto 0) := (others => '0');
   signal RF_data_in : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal RF_out1 : std_logic_vector(31 downto 0);
   signal RF_out2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant RF_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Register_File PORT MAP (
          RF_clk => RF_clk,
          RF_reset => RF_reset,
          RF_enable => RF_enable,
          RF_RD1 => RF_RD1,
          RF_RD2 => RF_RD2,
          RF_WR => RF_WR,
          RF_AddrRd1 => RF_AddrRd1,
          RF_AddrRd2 => RF_AddrRd2,
          RF_AddrWr => RF_AddrWr,
          RF_data_in => RF_data_in,
          RF_out1 => RF_out1,
          RF_out2 => RF_out2
        );

   -- Clock process definitions
   RF_clk_process :process
   begin
		RF_clk <= '0';
		wait for RF_clk_period/2;
		RF_clk <= '1';
		wait for RF_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 5 ns;	

      RF_reset 		<= '0';
		RF_enable	 	<= '1';
		RF_RD1 			<= '0';
		RF_RD2 			<= '0';
		RF_WR 			<= '0';
		RF_AddrRd1 		<= "00000";
		RF_AddrRd2 		<= "00000";
		RF_AddrWr 		<= "00000";
		RF_data_in 		<= std_logic_vector(to_unsigned(10, 32));
		wait for RF_clk_period;
		
		RF_reset 		<= '0';
		RF_enable	 	<= '1';
		RF_RD1 			<= '0';
		RF_RD2 			<= '0';
		RF_WR 			<= '1';
		RF_AddrRd1 		<= "00000";
		RF_AddrRd2 		<= "00000";
		RF_AddrWr 		<= "00001";
		RF_data_in 		<= std_logic_vector(to_unsigned(10, 32));
		wait for RF_clk_period;
		
		RF_reset 		<= '0';
		RF_enable	 	<= '1';
		RF_RD1 			<= '0';
		RF_RD2 			<= '0';
		RF_WR 			<= '1';
		RF_AddrRd1 		<= "01010";
		RF_AddrRd2 		<= "00000";
		RF_AddrWr 		<= "00010";
		RF_data_in 		<= std_logic_vector(to_unsigned(54, 32));
		wait for RF_clk_period;
		
		RF_reset 		<= '0';
		RF_enable	 	<= '1';
		RF_RD1 			<= '0';
		RF_RD2 			<= '0';
		RF_WR 			<= '1';
		RF_AddrRd1 		<= "00000";
		RF_AddrRd2 		<= "00000";
		RF_AddrWr 		<= "00011";
		RF_data_in 		<= std_logic_vector(to_unsigned(66, 32));
		wait for RF_clk_period;
		
		RF_reset 		<= '0';
		RF_enable	 	<= '1';
		RF_RD1 			<= '1';
		RF_RD2 			<= '1';
		RF_WR 			<= '0';
		RF_AddrRd1 		<= "00001";
		RF_AddrRd2 		<= "00010";
		RF_AddrWr 		<= "01000";
		RF_data_in 		<= std_logic_vector(to_unsigned(7, 32));
		wait for RF_clk_period;
		
		RF_reset 		<= '0';
		RF_enable	 	<= '1';
		RF_RD1 			<= '1';
		RF_RD2 			<= '1';
		RF_WR 			<= '0';
		RF_AddrRd1 		<= "00011";
		RF_AddrRd2 		<= "01000";
		RF_AddrWr 		<= "00000";
		RF_data_in 		<= std_logic_vector(to_unsigned(7, 32));
		wait for RF_clk_period;
		
		RF_reset 		<= '0';
		RF_enable	 	<= '1';
		RF_RD1 			<= '1';
		RF_RD2 			<= '0';
		RF_WR 			<= '1';
		RF_AddrRd1 		<= "00001";
		RF_AddrRd2 		<= "00000";
		RF_AddrWr 		<= "00001";
		RF_data_in 		<= std_logic_vector(to_unsigned(7, 32));
		wait for RF_clk_period;
       

      wait;
   end process;

END;
