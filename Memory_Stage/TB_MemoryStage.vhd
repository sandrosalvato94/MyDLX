--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:36:00 05/22/2018
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/Memory_Stage/TB_MemoryStage.vhd
-- Project Name:  Memory_Stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Memory_Stage
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
 
ENTITY TB_MemoryStage IS
END TB_MemoryStage;
 
ARCHITECTURE behavior OF TB_MemoryStage IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    ---------CHANGE HERE GENERICS---------
    constant NBIT_DATA    : integer := 32;
    constant NBIT_ADDRESS : integer := 32;
    --------------------------------------
 
    COMPONENT Memory_Stage
    GENERIC(NBIT_DATA : integer := 32;
	  NBIT_ADDRESS : integer := 32);
    PORT(
         ME_data_in : IN  std_logic_vector(NBIT_DATA-1 downto 0);
         ME_address : IN  std_logic_vector(NBIT_ADDRESS-1 downto 0);
         ME_clk : IN  std_logic;
         ME_rst : IN  std_logic;
         ME_enable : IN  std_logic;
         ME_RD_wr : IN  std_logic;
         ME_data_to_mem : OUT  std_logic_vector(NBIT_DATA-1 downto 0);
         ME_address_to_mem : OUT  std_logic_vector(NBIT_ADDRESS-1 downto 0);
         ME_rst_to_mem : OUT  std_logic;
         ME_enable_to_mem : OUT  std_logic;
         ME_RD_wr_to_mem : OUT  std_logic;
         ME_data_from_mem : IN  std_logic_vector(NBIT_DATA-1 downto 0);
         ME_data_rd_out : OUT  std_logic_vector(NBIT_DATA-1 downto 0);
         ME_data_wr_out : OUT  std_logic_vector(NBIT_DATA-1 downto 0);
         ME_RD_wr_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ME_data_in : std_logic_vector(NBIT_DATA-1 downto 0) := (others => '0');
   signal ME_address : std_logic_vector(NBIT_ADDRESS-1 downto 0) := (others => '0');
   signal ME_clk : std_logic := '0';
   signal ME_rst : std_logic := '0';
   signal ME_enable : std_logic := '0';
   signal ME_RD_wr : std_logic := '0';
   signal ME_data_from_mem : std_logic_vector(NBIT_DATA-1 downto 0) := (others => '0');

 	--Outputs
   signal ME_data_to_mem : std_logic_vector(NBIT_DATA-1 downto 0);
   signal ME_address_to_mem : std_logic_vector(NBIT_ADDRESS-1 downto 0);
   signal ME_rst_to_mem : std_logic;
   signal ME_enable_to_mem : std_logic;
   signal ME_RD_wr_to_mem : std_logic;
   signal ME_data_rd_out : std_logic_vector(NBIT_DATA-1 downto 0);
   signal ME_data_wr_out : std_logic_vector(NBIT_DATA-1 downto 0);
   signal ME_RD_wr_out : std_logic;

   -- Clock period definitions
   constant ME_clk_period : time := 10 ns;
   constant DRAM_delay    : time := 1 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Memory_Stage GENERIC MAP (NBIT_DATA => NBIT_DATA, NBIT_ADDRESS => NBIT_ADDRESS)
	PORT MAP (
          ME_data_in => ME_data_in,
          ME_address => ME_address,
          ME_clk => ME_clk,
          ME_rst => ME_rst,
          ME_enable => ME_enable,
          ME_RD_wr => ME_RD_wr,
          ME_data_to_mem => ME_data_to_mem,
          ME_address_to_mem => ME_address_to_mem,
          ME_rst_to_mem => ME_rst_to_mem,
          ME_enable_to_mem => ME_enable_to_mem,
          ME_RD_wr_to_mem => ME_RD_wr_to_mem,
          ME_data_from_mem => ME_data_from_mem,
          ME_data_rd_out => ME_data_rd_out,
          ME_data_wr_out => ME_data_wr_out,
          ME_RD_wr_out => ME_RD_wr_out
        );

   -- Clock process definitions
   ME_clk_process :process
   begin
		ME_clk <= '0';
		wait for ME_clk_period/2;
		ME_clk <= '1';
		wait for ME_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 9 ns;	
      --T1: reset phase------------------------------------------------
      ME_data_in <= std_logic_vector(to_unsigned(3,NBIT_DATA));
      ME_address <= std_logic_vector(to_unsigned(4,NBIT_ADDRESS));
      ME_rst     <= '1';
      ME_enable  <= '0';
      ME_RD_wr   <= '0';
      wait for DRAM_delay;
      ME_data_from_mem <= std_logic_vector(to_unsigned(5,NBIT_DATA));
      wait for 9 ns;
      
      ME_data_in <= std_logic_vector(to_unsigned(4,NBIT_DATA));
      ME_address <= std_logic_vector(to_unsigned(5,NBIT_ADDRESS));
      ME_rst     <= '1';
      ME_enable  <= '0';
      ME_RD_wr   <= '1';
      wait for DRAM_delay;
      ME_data_from_mem <= std_logic_vector(to_unsigned(6,NBIT_DATA));
      wait for 9 ns;
      
      ME_data_in <= std_logic_vector(to_unsigned(5,NBIT_DATA));
      ME_address <= std_logic_vector(to_unsigned(6,NBIT_ADDRESS));
      ME_rst     <= '1';
      ME_enable  <= '1';
      ME_RD_wr   <= '0';
      wait for DRAM_delay;
      ME_data_from_mem <= std_logic_vector(to_unsigned(7,NBIT_DATA));
      wait for 9 ns;
      
      ME_data_in <= std_logic_vector(to_unsigned(8,NBIT_DATA));
      ME_address <= std_logic_vector(to_unsigned(9,NBIT_ADDRESS));
      ME_rst     <= '1';
      ME_enable  <= '1';
      ME_RD_wr   <= '1';
      wait for DRAM_delay;
      ME_data_from_mem <= std_logic_vector(to_unsigned(10,NBIT_DATA));
      wait for 9 ns;
      ------------------------------------------------------------------
      
      --T2: read data---------------------------------------------------
      ME_data_in <= std_logic_vector(to_unsigned(35,NBIT_DATA));
      ME_address <= std_logic_vector(to_unsigned(4,NBIT_ADDRESS));
      ME_rst     <= '0';
      ME_enable  <= '1';
      ME_RD_wr   <= '1';
      wait for DRAM_delay;
      ME_data_from_mem <= std_logic_vector(to_unsigned(40,NBIT_DATA));
      wait for 9 ns;
      ------------------------------------------------------------------
      
      --T3: write data--------------------------------------------------
      ME_data_in <= std_logic_vector(to_unsigned(66,NBIT_DATA));
      ME_address <= std_logic_vector(to_unsigned(6,NBIT_ADDRESS));
      ME_rst     <= '0';
      ME_enable  <= '1';
      ME_RD_wr   <= '0';
      wait for DRAM_delay;
      ME_data_from_mem <= std_logic_vector(to_unsigned(34,NBIT_DATA));
      wait for 9 ns;
      ------------------------------------------------------------------

      wait;
   end process;

END;
