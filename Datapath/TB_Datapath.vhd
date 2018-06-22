--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:39:40 06/22/2018
-- Design Name:   
-- Module Name:   C:/Users/Alessandro/Documents/GitHub/MyDLX/Datapath/TB_Datapath.vhd
-- Project Name:  Datapath
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Datapath
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
 
ENTITY TB_Datapath IS
END TB_Datapath;
 
ARCHITECTURE behavior OF TB_Datapath IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Datapath
    PORT(
         DP_enable : IN  std_logic;
         DP_clk : IN  std_logic;
         DP_reset : IN  std_logic;
         DP_btb_target_prediction : IN  std_logic_vector(31 downto 0);
         DP_btb_prediction : IN  std_logic;
         DP_IR : IN  std_logic_vector(31 downto 0);
         DP_Rd1 : IN  std_logic;
         DP_Rd2 : IN  std_logic;
         DP_Wr : IN  std_logic;
         DP_JMP_branch : IN  std_logic_vector(1 downto 0);
         DP_sign_extender : IN  std_logic_vector(1 downto 0);
         DP_save_PC : IN  std_logic;
         DP_Shift_Amount_sel : IN  std_logic_vector(1 downto 0);
         DP_use_immediate : IN  std_logic;
         DP_reverse_operands : IN  std_logic;
         DP_ALU_Opcode : IN  std_logic_vector(5 downto 0);
         DP_UUW_sel : IN  std_logic_vector(1 downto 0);
         DP_Store_reduce : IN  std_logic;
         DP_Store_BYTE_half : IN  std_logic;
         DP_Load_data_from_DRAM : IN  std_logic_vector(31 downto 0);
         DP_WB_sel : IN  std_logic;
         DP_Load_reduce : IN  std_logic;
         DP_Load_BYTE_half : IN  std_logic;
         DP_Load_SGN_usg_reduce : IN  std_logic;
         DP_insert_bubble : OUT  std_logic;
         DP_PC : OUT  std_logic_vector(31 downto 0);
         DP_branch_taken : OUT  std_logic;
         DP_new_PC : OUT  std_logic_vector(31 downto 0);
         DP_data_to_DRAM : OUT  std_logic_vector(31 downto 0);
         DP_address_to_DRAM : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DP_enable : std_logic := '0';
   signal DP_clk : std_logic := '0';
   signal DP_reset : std_logic := '1';
   signal DP_btb_target_prediction : std_logic_vector(31 downto 0) := (others => '0');
   signal DP_btb_prediction : std_logic := '0';
   signal DP_IR : std_logic_vector(31 downto 0) := (others => '0');
   signal DP_Rd1 : std_logic := '0';
   signal DP_Rd2 : std_logic := '0';
   signal DP_Wr : std_logic := '0';
   signal DP_JMP_branch : std_logic_vector(1 downto 0) := (others => '0');
   signal DP_sign_extender : std_logic_vector(1 downto 0) := (others => '0');
   signal DP_save_PC : std_logic := '0';
   signal DP_Shift_Amount_sel : std_logic_vector(1 downto 0) := (others => '0');
   signal DP_use_immediate : std_logic := '0';
   signal DP_reverse_operands : std_logic := '0';
   signal DP_ALU_Opcode : std_logic_vector(5 downto 0) := (others => '0');
   signal DP_UUW_sel : std_logic_vector(1 downto 0) := (others => '0');
   signal DP_Store_reduce : std_logic := '0';
   signal DP_Store_BYTE_half : std_logic := '0';
   signal DP_Load_data_from_DRAM : std_logic_vector(31 downto 0) := (others => '0');
   signal DP_WB_sel : std_logic := '0';
   signal DP_Load_reduce : std_logic := '0';
   signal DP_Load_BYTE_half : std_logic := '0';
   signal DP_Load_SGN_usg_reduce : std_logic := '0';

 	--Outputs
   signal DP_insert_bubble : std_logic;
   signal DP_PC : std_logic_vector(31 downto 0);
   signal DP_branch_taken : std_logic;
   signal DP_new_PC : std_logic_vector(31 downto 0);
   signal DP_data_to_DRAM : std_logic_vector(31 downto 0);
   signal DP_address_to_DRAM : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant DP_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Datapath PORT MAP (
          DP_enable => DP_enable,
          DP_clk => DP_clk,
          DP_reset => DP_reset,
          DP_btb_target_prediction => DP_btb_target_prediction,
          DP_btb_prediction => DP_btb_prediction,
          DP_IR => DP_IR,
          DP_Rd1 => DP_Rd1,
          DP_Rd2 => DP_Rd2,
          DP_Wr => DP_Wr,
          DP_JMP_branch => DP_JMP_branch,
          DP_sign_extender => DP_sign_extender,
          DP_save_PC => DP_save_PC,
          DP_Shift_Amount_sel => DP_Shift_Amount_sel,
          DP_use_immediate => DP_use_immediate,
          DP_reverse_operands => DP_reverse_operands,
          DP_ALU_Opcode => DP_ALU_Opcode,
          DP_UUW_sel => DP_UUW_sel,
          DP_Store_reduce => DP_Store_reduce,
          DP_Store_BYTE_half => DP_Store_BYTE_half,
          DP_Load_data_from_DRAM => DP_Load_data_from_DRAM,
          DP_WB_sel => DP_WB_sel,
          DP_Load_reduce => DP_Load_reduce,
          DP_Load_BYTE_half => DP_Load_BYTE_half,
          DP_Load_SGN_usg_reduce => DP_Load_SGN_usg_reduce,
          DP_insert_bubble => DP_insert_bubble,
          DP_PC => DP_PC,
          DP_branch_taken => DP_branch_taken,
          DP_new_PC => DP_new_PC,
          DP_data_to_DRAM => DP_data_to_DRAM,
          DP_address_to_DRAM => DP_address_to_DRAM
        );

   -- Clock process definitions
   DP_clk_process :process
   begin
		DP_clk <= '0';
		wait for DP_clk_period/2;
		DP_clk <= '1';
		wait for DP_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;

			DP_enable <= '1';
			DP_reset <= '0';

     
      -- insert stimulus here 

      wait;
   end process;

END;
