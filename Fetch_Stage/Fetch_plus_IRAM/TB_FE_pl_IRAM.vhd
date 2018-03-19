--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:48:21 10/09/2017
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/Fetch_Stage/TB_Fetch.vhd
-- Project Name:  Fetch_Stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Fetch
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
 
ENTITY TB_Fetch IS
END TB_Fetch;
 
ARCHITECTURE behavior OF TB_Fetch IS 
 
    -------CHANGE HERE GENERICS-------	
    constant NBIT_PC : integer := 32;
    constant NBIT_IR : integer := 32;
    ----------------------------------
    
    COMPONENT FE_pl_IRAM
    GENERIC(
	NBIT_PC : INTEGER := 32;
	NBIT_IR : INTEGER := 32);
    PORT(
         FE_clk : IN  std_logic;
         FE_rst : IN  std_logic;
         FE_enable : IN  std_logic;
         FE_PC_enable : IN  std_logic;
         FE_PC_clear : IN  std_logic;
         FE_IR_enable : IN  std_logic;
         FE_IR_clear : IN  std_logic;
         FE_btb_target_prediction : IN  std_logic_vector(NBIT_PC-1 downto 0);
         FE_btb_prediction : IN  std_logic;
         FE_branch_taken : IN  std_logic;
         --FE_IR_in : IN  std_logic_vector(NBIT_IR-1 downto 0);
         FE_IR_out : OUT  std_logic_vector(NBIT_IR-1 downto 0);
         FE_PC : OUT  std_logic_vector(NBIT_PC-1 downto 0);
         FE_NPC : OUT  std_logic_vector(NBIT_PC-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal FE_clk : std_logic := '0';
   signal FE_rst : std_logic := '1';
   signal FE_enable : std_logic := '0';
   signal FE_PC_enable : std_logic := '0';
   signal FE_PC_clear : std_logic := '0';
   signal FE_IR_enable : std_logic := '0';
   signal FE_IR_clear : std_logic := '0';
   signal FE_btb_target_prediction : std_logic_vector(NBIT_PC-1 downto 0) := (others => '0');
   signal FE_btb_prediction : std_logic := '0';
   signal FE_branch_taken : std_logic := '0';
   signal FE_IR_in : std_logic_vector(NBIT_IR-1 downto 0) := (others => '0');

 	--Outputs
   signal FE_IR_out : std_logic_vector(NBIT_IR-1 downto 0);
   signal FE_PC : std_logic_vector(NBIT_PC-1 downto 0);
   signal FE_NPC : std_logic_vector(NBIT_PC-1 downto 0);

   -- Clock period definitions
   constant FE_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FE_pl_IRAM GENERIC MAP(NBIT_PC => NBIT_PC, NBIT_IR => NBIT_IR) 
	PORT MAP (
          FE_clk => FE_clk,
          FE_rst => FE_rst,
          FE_enable => FE_enable,
          FE_PC_enable => FE_PC_enable,
          FE_PC_clear => FE_PC_clear,
          FE_IR_enable => FE_IR_enable,
          FE_IR_clear => FE_IR_clear,
          FE_btb_target_prediction => FE_btb_target_prediction,
          FE_btb_prediction => FE_btb_prediction,
          FE_branch_taken => FE_branch_taken,
          --FE_IR_in => FE_IR_in,
          FE_IR_out => FE_IR_out,
          FE_PC => FE_PC,
          FE_NPC => FE_NPC
        );

   -- Clock process definitions
   FE_clk_process :process
   begin
		FE_clk <= '0';
		wait for FE_clk_period/2;
		FE_clk <= '1';
		wait for FE_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100.5 ns;
      
	--TEST 1 : program counter counting------------------- 100 ns
	FE_rst <= '0';
	FE_enable <='1';
	FE_PC_enable<= '1';
	FE_PC_clear <='0';
	FE_IR_enable<= '0';
	FE_IR_clear <='0';
	FE_btb_target_prediction<= (others => '0');
	FE_btb_prediction<= '0';
	FE_branch_taken <='0';
	
	
	wait for FE_clk_period*10;
	------------------------------------------------------
      
	--TEST 2 : IR working correttly----------------------- 200 ns
	FE_rst <= '0';
	FE_enable <='1';
	FE_PC_enable<= '1';
	FE_PC_clear <='0';
	FE_IR_enable<= '1';
	FE_IR_clear <='0';
	FE_btb_target_prediction<= (others => '0');
	FE_btb_prediction<= '0';
	FE_branch_taken <='0';
	--FE_IR_in <= std_logic_vector(to_unsigned(40, NBIT_IR));
	
	wait for FE_clk_period;
	
	FE_rst <= '0';
	FE_enable <='1';
	FE_PC_enable<= '1';
	FE_PC_clear <='0';
	FE_IR_enable<= '1';
	FE_IR_clear <='0';
	FE_btb_target_prediction<= (others => '0');
	FE_btb_prediction<= '0';
	FE_branch_taken <='0';
	--FE_IR_in <= std_logic_vector(to_unsigned(50, NBIT_IR));
	
	wait for FE_clk_period;
	
	FE_rst <= '0';
	FE_enable <='1';
	FE_PC_enable<= '1';
	FE_PC_clear <='0';
	FE_IR_enable<= '1';
	FE_IR_clear <='0';
	FE_btb_target_prediction<= (others => '0');
	FE_btb_prediction<= '0';
	FE_branch_taken <='0';
	--FE_IR_in <= std_logic_vector(to_unsigned(60, NBIT_IR));
	
	wait for FE_clk_period;
	
	FE_rst <= '0';
	FE_enable <='1';
	FE_PC_enable<= '1';
	FE_PC_clear <='0';
	FE_IR_enable<= '1';
	FE_IR_clear <='0';
	FE_btb_target_prediction<= (others => '0');
	FE_btb_prediction<= '0';
	FE_branch_taken <='0';
	--FE_IR_in <= std_logic_vector(to_unsigned(70, NBIT_IR));
	
	wait for FE_clk_period;
	
	FE_rst <= '0';
	FE_enable <='1';
	FE_PC_enable<= '1';
	FE_PC_clear <='0';
	FE_IR_enable<= '1';
	FE_IR_clear <='0';
	FE_btb_target_prediction<= (others => '0');
	FE_btb_prediction<= '0';
	FE_branch_taken <='0';
	--FE_IR_in <= std_logic_vector(to_unsigned(80, NBIT_IR));
	
	wait for FE_clk_period;
	------------------------------------------------------

      

      wait;
   end process;

END;
