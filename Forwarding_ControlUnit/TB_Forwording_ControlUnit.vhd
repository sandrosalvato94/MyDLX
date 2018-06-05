--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:11:11 06/04/2018
-- Design Name:   
-- Module Name:   C:/Users/Alessandro/Documents/GitHub/MyDLX/Forwarding_ControlUnit/TB_Forwording_ControlUnit.vhd
-- Project Name:  Forwarding_ControlUnit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Forwarding_ControlUnit
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
 
ENTITY TB_Forwording_ControlUnit IS
END TB_Forwording_ControlUnit;
 
ARCHITECTURE behavior OF TB_Forwording_ControlUnit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Forwarding_ControlUnit
    PORT(
         FCU_REG_imm : IN  std_logic;
         FCU_enable : IN  std_logic;
         FCU_EX_MEM_IR_16_20 : IN  std_logic_vector(4 downto 0);
         FCU_EX_MEM_IR_11_15 : IN  std_logic_vector(4 downto 0);
         FCU_ID_EX_IR_11_15 : IN  std_logic_vector(4 downto 0);
         FCU_ID_EX_IR_6_10 : IN  std_logic_vector(4 downto 0);
         FCU_MEM_WB_IR_16_20 : IN  std_logic_vector(4 downto 0);
         FCU_MEM_WB_IR_11_15 : IN  std_logic_vector(4 downto 0);
         FCU_MUX_TOP_ALU : OUT  std_logic_vector(1 downto 0);
         FCU_MUX_BOT_ALU : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal FCU_REG_imm : std_logic := '0';
   signal FCU_enable : std_logic := '0';
   signal FCU_EX_MEM_IR_16_20 : std_logic_vector(4 downto 0) := (others => '0');
   signal FCU_EX_MEM_IR_11_15 : std_logic_vector(4 downto 0) := (others => '0');
   signal FCU_ID_EX_IR_11_15 : std_logic_vector(4 downto 0) := (others => '0');
   signal FCU_ID_EX_IR_6_10 : std_logic_vector(4 downto 0) := (others => '0');
   signal FCU_MEM_WB_IR_16_20 : std_logic_vector(4 downto 0) := (others => '0');
   signal FCU_MEM_WB_IR_11_15 : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal FCU_MUX_TOP_ALU : std_logic_vector(1 downto 0);
   signal FCU_MUX_BOT_ALU : std_logic_vector(1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Forwarding_ControlUnit PORT MAP (
          FCU_REG_imm => FCU_REG_imm,
          FCU_enable => FCU_enable,
          FCU_EX_MEM_IR_16_20 => FCU_EX_MEM_IR_16_20,
          FCU_EX_MEM_IR_11_15 => FCU_EX_MEM_IR_11_15,
          FCU_ID_EX_IR_11_15 => FCU_ID_EX_IR_11_15,
          FCU_ID_EX_IR_6_10 => FCU_ID_EX_IR_6_10,
          FCU_MEM_WB_IR_16_20 => FCU_MEM_WB_IR_16_20,
          FCU_MEM_WB_IR_11_15 => FCU_MEM_WB_IR_11_15,
          FCU_MUX_TOP_ALU => FCU_MUX_TOP_ALU,
          FCU_MUX_BOT_ALU => FCU_MUX_BOT_ALU
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 1 ns;	
		
		--T1: nothing happens---------------------------------------
		FCU_enable <= '0';
      FCU_REG_imm <= '1';
		FCU_EX_MEM_IR_16_20 <= std_logic_vector(to_unsigned(4, 5));
		FCU_EX_MEM_IR_11_15 <= std_logic_vector(to_unsigned(4, 5));
		FCU_ID_EX_IR_11_15 <= std_logic_vector(to_unsigned(4, 5));
		FCU_ID_EX_IR_6_10 <= std_logic_vector(to_unsigned(4, 5));
		FCU_MEM_WB_IR_16_20 <= std_logic_vector(to_unsigned(4, 5));
		FCU_MEM_WB_IR_11_15 <= std_logic_vector(to_unsigned(4, 5));
		wait for 5 ns;
      ------------------------------------------------------------
		
		--T2: assembly code needing forwording----------------------
--			ADD R1, R2, R3
--			SUB R4, R1, R5
--			AND R6, R1, R9
--			OR R8, R1, R9
--			XOR R10, R1, R11

		--CC 1
		FCU_enable <= '1';
      FCU_REG_imm <= '1';
		FCU_ID_EX_IR_11_15 <= std_logic_vector(to_unsigned(0, 5));
		FCU_ID_EX_IR_6_10 <= std_logic_vector(to_unsigned(0, 5));
		FCU_EX_MEM_IR_16_20 <= std_logic_vector(to_unsigned(0, 5));
		FCU_EX_MEM_IR_11_15 <= std_logic_vector(to_unsigned(0, 5));
		FCU_MEM_WB_IR_16_20 <= std_logic_vector(to_unsigned(0, 5));
		FCU_MEM_WB_IR_11_15 <= std_logic_vector(to_unsigned(0, 5));
		wait for 1 ns;
		assert ((FCU_MUX_TOP_ALU = "00") AND (FCU_MUX_BOT_ALU = "00")) report "Some issues occur";
		wait for 4 ns;
		
		--CC 2
		FCU_enable <= '1';
      FCU_REG_imm <= '1';
		FCU_ID_EX_IR_11_15 <= std_logic_vector(to_unsigned(3, 5));
		FCU_ID_EX_IR_6_10 <= std_logic_vector(to_unsigned(2, 5));
		FCU_EX_MEM_IR_16_20 <= std_logic_vector(to_unsigned(0, 5));
		FCU_EX_MEM_IR_11_15 <= std_logic_vector(to_unsigned(0, 5));
		FCU_MEM_WB_IR_16_20 <= std_logic_vector(to_unsigned(0, 5));
		FCU_MEM_WB_IR_11_15 <= std_logic_vector(to_unsigned(0, 5));
		wait for 1 ns;
		assert ((FCU_MUX_TOP_ALU = "00") AND (FCU_MUX_BOT_ALU = "00")) report "Some issues occur";
		wait for 4 ns;
		
		--CC 3
		FCU_enable <= '1';
      FCU_REG_imm <= '1';
		FCU_ID_EX_IR_11_15 <= std_logic_vector(to_unsigned(5, 5));
		FCU_ID_EX_IR_6_10 <= std_logic_vector(to_unsigned(1, 5));
		FCU_EX_MEM_IR_16_20 <= std_logic_vector(to_unsigned(1, 5));
		FCU_EX_MEM_IR_11_15 <= std_logic_vector(to_unsigned(3, 5));
		FCU_MEM_WB_IR_16_20 <= std_logic_vector(to_unsigned(0, 5));
		FCU_MEM_WB_IR_11_15 <= std_logic_vector(to_unsigned(0, 5));
		wait for 1 ns;
		assert ((FCU_MUX_TOP_ALU = "10") AND (FCU_MUX_BOT_ALU = "00")) report "Some issues occur";
		wait for 4 ns;
		
		--CC 4
		FCU_enable <= '1';
      FCU_REG_imm <= '1';
		FCU_ID_EX_IR_11_15 <= std_logic_vector(to_unsigned(7, 5));
		FCU_ID_EX_IR_6_10 <= std_logic_vector(to_unsigned(1, 5));
		FCU_EX_MEM_IR_16_20 <= std_logic_vector(to_unsigned(4, 5));
		FCU_EX_MEM_IR_11_15 <= std_logic_vector(to_unsigned(5, 5));
		FCU_MEM_WB_IR_16_20 <= std_logic_vector(to_unsigned(1, 5));
		FCU_MEM_WB_IR_11_15 <= std_logic_vector(to_unsigned(3, 5));
		wait for 1 ns;
		assert ((FCU_MUX_TOP_ALU = "01") AND (FCU_MUX_BOT_ALU = "00")) report "Some issues occur";
		wait for 4 ns;
		
		--CC 5
		FCU_enable <= '1';
      FCU_REG_imm <= '1';
		FCU_ID_EX_IR_11_15 <= std_logic_vector(to_unsigned(9, 5));
		FCU_ID_EX_IR_6_10 <= std_logic_vector(to_unsigned(1, 5));
		FCU_EX_MEM_IR_16_20 <= std_logic_vector(to_unsigned(6, 5));
		FCU_EX_MEM_IR_11_15 <= std_logic_vector(to_unsigned(7, 5));
		FCU_MEM_WB_IR_16_20 <= std_logic_vector(to_unsigned(4, 5));
		FCU_MEM_WB_IR_11_15 <= std_logic_vector(to_unsigned(5, 5));
		wait for 1 ns;
		assert ((FCU_MUX_TOP_ALU = "00") AND (FCU_MUX_BOT_ALU = "00")) report "Some issues occur";
		wait for 4 ns;
		------------------------------------------------------------
			

      wait;
   end process;

END;
