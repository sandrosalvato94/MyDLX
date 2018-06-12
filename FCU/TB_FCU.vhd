--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:05:24 06/12/2018
-- Design Name:   
-- Module Name:   C:/Users/Alessandro/Documents/GitHub/MyDLX/FCU/TB_FCU.vhd
-- Project Name:  FCU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FCU
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
 
ENTITY TB_FCU IS
END TB_FCU;
 
ARCHITECTURE behavior OF TB_FCU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FCU
    PORT(
         FCU_enable : IN  std_logic;
         FCU_IF_ID_Op : IN  std_logic_vector(5 downto 0);
         FCU_ID_EX_Op : IN  std_logic_vector(5 downto 0);
         FCU_EX_MEM_Op : IN  std_logic_vector(5 downto 0);
         FCU_MEM_WB_Op : IN  std_logic_vector(5 downto 0);
         FCU_IF_ID_6_10 : IN  std_logic_vector(4 downto 0);
         FCU_IF_ID_11_15 : IN  std_logic_vector(4 downto 0);
         FCU_ID_EX_6_10 : IN  std_logic_vector(4 downto 0);
         FCU_ID_EX_11_15 : IN  std_logic_vector(4 downto 0);
         FCU_ID_EX_16_20 : IN  std_logic_vector(4 downto 0);
         FCU_EX_MEM_11_15 : IN  std_logic_vector(4 downto 0);
         FCU_EX_MEM_16_20 : IN  std_logic_vector(4 downto 0);
         FCU_MEM_WB_11_15 : IN  std_logic_vector(4 downto 0);
         FCU_MEM_WB_16_20 : IN  std_logic_vector(4 downto 0);
         FCU_IF_ID_MUX : OUT  std_logic_vector(1 downto 0);
         FCU_ID_EX_TOP_MUX : OUT  std_logic_vector(1 downto 0);
         FCU_ID_EX_BOT_MUX : OUT  std_logic_vector(1 downto 0);
         FCU_EX_MEM_MUX : OUT  std_logic;
         FCU_insert_stall : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal FCU_enable : std_logic := '0';
   signal FCU_IF_ID_Op : std_logic_vector(5 downto 0) := (others => '0');
   signal FCU_ID_EX_Op : std_logic_vector(5 downto 0) := (others => '0');
   signal FCU_EX_MEM_Op : std_logic_vector(5 downto 0) := (others => '0');
   signal FCU_MEM_WB_Op : std_logic_vector(5 downto 0) := (others => '0');
   signal FCU_IF_ID_6_10 : std_logic_vector(4 downto 0) := (others => '0');
   signal FCU_IF_ID_11_15 : std_logic_vector(4 downto 0) := (others => '0');
   signal FCU_ID_EX_6_10 : std_logic_vector(4 downto 0) := (others => '0');
   signal FCU_ID_EX_11_15 : std_logic_vector(4 downto 0) := (others => '0');
   signal FCU_ID_EX_16_20 : std_logic_vector(4 downto 0) := (others => '0');
   signal FCU_EX_MEM_11_15 : std_logic_vector(4 downto 0) := (others => '0');
   signal FCU_EX_MEM_16_20 : std_logic_vector(4 downto 0) := (others => '0');
   signal FCU_MEM_WB_11_15 : std_logic_vector(4 downto 0) := (others => '0');
   signal FCU_MEM_WB_16_20 : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal FCU_IF_ID_MUX : std_logic_vector(1 downto 0);
   signal FCU_ID_EX_TOP_MUX : std_logic_vector(1 downto 0);
   signal FCU_ID_EX_BOT_MUX : std_logic_vector(1 downto 0);
   signal FCU_EX_MEM_MUX : std_logic;
   signal FCU_insert_stall : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FCU PORT MAP (
          FCU_enable => FCU_enable,
          FCU_IF_ID_Op => FCU_IF_ID_Op,
          FCU_ID_EX_Op => FCU_ID_EX_Op,
          FCU_EX_MEM_Op => FCU_EX_MEM_Op,
          FCU_MEM_WB_Op => FCU_MEM_WB_Op,
          FCU_IF_ID_6_10 => FCU_IF_ID_6_10,
          FCU_IF_ID_11_15 => FCU_IF_ID_11_15,
          FCU_ID_EX_6_10 => FCU_ID_EX_6_10,
          FCU_ID_EX_11_15 => FCU_ID_EX_11_15,
          FCU_ID_EX_16_20 => FCU_ID_EX_16_20,
          FCU_EX_MEM_11_15 => FCU_EX_MEM_11_15,
          FCU_EX_MEM_16_20 => FCU_EX_MEM_16_20,
          FCU_MEM_WB_11_15 => FCU_MEM_WB_11_15,
          FCU_MEM_WB_16_20 => FCU_MEM_WB_16_20,
          FCU_IF_ID_MUX => FCU_IF_ID_MUX,
          FCU_ID_EX_TOP_MUX => FCU_ID_EX_TOP_MUX,
          FCU_ID_EX_BOT_MUX => FCU_ID_EX_BOT_MUX,
          FCU_EX_MEM_MUX => FCU_EX_MEM_MUX,
          FCU_insert_stall => FCU_insert_stall
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	

		
      -- insert stimulus here 

      wait;
   end process;

END;
