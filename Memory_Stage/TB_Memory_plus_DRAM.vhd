--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:43:5NBIT_ADDRESS-1 05/22/2018
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/Memory_Stage/TB_Memory_plus_DRAM.vhd
-- Project Name:  Memory_Stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Memory_plus_DRAM
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
 
ENTITY TB_Memory_plus_DRAM IS
END TB_Memory_plus_DRAM;
 
ARCHITECTURE behavior OF TB_Memory_plus_DRAM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    ----------CHANGE HERE GENERICS----------
    constant NBIT_DATA : integer := 32;
    constant NBIT_ADDRESS : integer := 10;
    ----------------------------------------
 
    COMPONENT Memory_plus_DRAM
    GENERIC ( NBIT_DATA : integer := 32;
	    NBIT_ADDRESS : integer := 10);
    PORT(
         MD_data_in : IN  std_logic_vector(NBIT_DATA-1 downto 0);
         MD_address : IN  std_logic_vector(NBIT_ADDRESS-1 downto 0);
         MD_enable : IN  std_logic;
         MD_RD_wr : IN  std_logic;
         MD_rst : IN  std_logic;
         MD_clk : IN  std_logic;
         MD_data_rd : OUT  std_logic_vector(NBIT_DATA-1 downto 0);
         MD_data_wr : OUT  std_logic_vector(NBIT_DATA-1 downto 0);
         MD_RD_wr_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal MD_data_in : std_logic_vector(NBIT_DATA-1 downto 0) := (others => '0');
   signal MD_address : std_logic_vector(NBIT_ADDRESS-1 downto 0) := (others => '0');
   signal MD_enable : std_logic := '0';
   signal MD_RD_wr : std_logic := '0';
   signal MD_rst : std_logic := '0';
   signal MD_clk : std_logic := '0';

 	--Outputs
   signal MD_data_rd : std_logic_vector(NBIT_DATA-1 downto 0);
   signal MD_data_wr : std_logic_vector(NBIT_DATA-1 downto 0);
   signal MD_RD_wr_out : std_logic;

   -- Clock period definitions
   constant MD_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Memory_plus_DRAM GENERIC MAP (NBIT_DATA => NBIT_DATA, NBIT_ADDRESS => NBIT_ADDRESS)
	PORT MAP (
          MD_data_in => MD_data_in,
          MD_address => MD_address,
          MD_enable => MD_enable,
          MD_RD_wr => MD_RD_wr,
          MD_rst => MD_rst,
          MD_clk => MD_clk,
          MD_data_rd => MD_data_rd,
          MD_data_wr => MD_data_wr,
          MD_RD_wr_out => MD_RD_wr_out
        );

   -- Clock process definitions
   MD_clk_process :process
   begin
		MD_clk <= '0';
		wait for MD_clk_period/2;
		MD_clk <= '1';
		wait for MD_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
	wait for 10 ns;
	
	MD_data_in <= std_logic_vector(to_unsigned(3, NBIT_DATA));
          MD_address <= std_logic_vector(to_unsigned(4, NBIT_ADDRESS));
          MD_enable  <= '1';
          MD_rst <= '1';
          MD_RD_wr   <= '1';
	wait for MD_clk_period;
	
	for i in 0 to 2**NBIT_ADDRESS-1 loop
		MD_data_in <= std_logic_vector(to_unsigned(i, NBIT_DATA));
		MD_address(NBIT_ADDRESS-1 downto 2) <= std_logic_vector(to_unsigned(i, NBIT_ADDRESS-2));
		MD_enable  <= '1';
		MD_rst <= '0';
		MD_RD_wr   <= '0';
		wait for MD_clk_period;
	end loop;
	
	for i in 2**NBIT_ADDRESS-1 downto 0 loop
		MD_data_in <= std_logic_vector(to_unsigned(i, NBIT_DATA));
		MD_address(NBIT_ADDRESS-1 downto 2) <= std_logic_vector(to_unsigned(i, NBIT_ADDRESS-2));
		MD_enable  <= '1';
		MD_rst <= '0';
		MD_RD_wr   <= '1';
		wait for MD_clk_period;
	end loop;
	
	
	

      -- insert stimulus here 

      wait;
   end process;

END;
