--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:NBIT_DATA-1:50 05/15/2018
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/Execute_Stage/TB_Execute_Stage.vhd
-- Project Name:  Execute_Stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Execute_Stage
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
 
ENTITY TB_Execute_Stage IS
END TB_Execute_Stage;
 
ARCHITECTURE behavior OF TB_Execute_Stage IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    ----------CHANGE HERE GENERICS----------
    constant NBIT_DATA : integer := 8;
    constant NBIT_BS_AMOUNT : integer := 3;
    ----------------------------------------
 
    COMPONENT Execute_Stage
    GENERIC(NBIT_DATA : integer := 32;
	  NBIT_BS_AMOUNT : integer := 5);
    PORT(
         EX_clk : IN  std_logic;
         EX_reset : IN  std_logic;
         EX_enable : IN  std_logic;
         EX_OpA : IN  std_logic_vector(NBIT_DATA-1 downto 0);
         EX_OpB : IN  std_logic_vector(NBIT_DATA-1 downto 0);
         EX_Opcode : IN  std_logic_vector(5 downto 0);
         EX_ShiftAmount : IN  std_logic_vector(NBIT_BS_AMOUNT-1 downto 0);
         EX_sel_mux_out : IN  std_logic_vector(1 downto 0);
         EX_data_out : OUT  std_logic_vector(NBIT_DATA-1 downto 0);
         EX_PSW : OUT  std_logic_vector(4 downto 0);
         EX_AluOutBack : OUT  std_logic_vector(NBIT_DATA-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal EX_clk : std_logic := '0';
   signal EX_reset : std_logic := '0';
   signal EX_enable : std_logic := '0';
   signal EX_OpA : std_logic_vector(NBIT_DATA-1 downto 0) := (others => '0');
   signal EX_OpB : std_logic_vector(NBIT_DATA-1 downto 0) := (others => '0');
   signal EX_Opcode : std_logic_vector(5 downto 0) := (others => '0');
   signal EX_ShiftAmount : std_logic_vector(NBIT_BS_AMOUNT-1 downto 0) := (others => '0');
   signal EX_sel_mux_out : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal EX_data_out : std_logic_vector(NBIT_DATA-1 downto 0);
   signal EX_PSW : std_logic_vector(4 downto 0);
   signal EX_AluOutBack : std_logic_vector(NBIT_DATA-1 downto 0);

   -- Clock period definitions
   constant EX_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Execute_Stage GENERIC MAP (NBIT_DATA => NBIT_DATA, NBIT_BS_AMOUNT => NBIT_BS_AMOUNT)
	PORT MAP (
          EX_clk => EX_clk,
          EX_reset => EX_reset,
          EX_enable => EX_enable,
          EX_OpA => EX_OpA,
          EX_OpB => EX_OpB,
          EX_Opcode => EX_Opcode,
          EX_ShiftAmount => EX_ShiftAmount,
          EX_sel_mux_out => EX_sel_mux_out,
          EX_data_out => EX_data_out,
          EX_PSW => EX_PSW,
          EX_AluOutBack => EX_AluOutBack
        );

   -- Clock process definitions
   EX_clk_process :process
   begin
		EX_clk <= '0';
		wait for EX_clk_period/2;
		EX_clk <= '1';
		wait for EX_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
     
      wait for 1 ns;	
      
      --T1 : enable and reset signals management-----------
	EX_reset <= '0';
          EX_enable <= '0';
          EX_OpA <= (others => '1');
          EX_OpB <= (others => '1');
          EX_Opcode <= (others => '0');
          EX_ShiftAmount <= (others => '0');
          EX_sel_mux_out <= "00";
	wait for EX_clk_period;
	
	EX_reset <= '1';
          EX_enable <= '0';
          EX_OpA <= (others => '1');
          EX_OpB <= (others => '1');
          EX_Opcode <= (others => '0');
          EX_ShiftAmount <= (others => '0');
          EX_sel_mux_out <= "00";
	wait for EX_clk_period;
	
	EX_reset <= '0';
          EX_enable <= '1';
          EX_OpA <= (others => '1');
          EX_OpB <= (others => '1');
          EX_Opcode <= (others => '0');
          EX_ShiftAmount <= (others => '0');
          EX_sel_mux_out <= "00";
	wait for EX_clk_period;
	
	EX_reset <= '1';
          EX_enable <= '1';
          EX_OpA <= (others => '1');
          EX_OpB <= (others => '1');
          EX_Opcode <= (others => '0');
          EX_ShiftAmount <= (others => '0');
          EX_sel_mux_out <= "00";
	wait for EX_clk_period;
	
	EX_reset <= '1';
          EX_enable <= '1';
          EX_OpA <= (others => '1');
          EX_OpB <= (others => '1');
          EX_Opcode <= (others => '0');
          EX_ShiftAmount <= (others => '0');
          EX_sel_mux_out <= "01";
	wait for EX_clk_period;
	
	EX_reset <= '1';
          EX_enable <= '1';
          EX_OpA <= (others => '1');
          EX_OpB <= (others => '1');
          EX_Opcode <= (others => '0');
          EX_ShiftAmount <= (others => '0');
          EX_sel_mux_out <= "10";
	wait for EX_clk_period;
	
	EX_reset <= '1';
          EX_enable <= '1';
          EX_OpA <= (others => '1');
          EX_OpB <= (others => '1');
          EX_Opcode <= (others => '0');
          EX_ShiftAmount <= (others => '0');
          EX_sel_mux_out <= "11";
	wait for EX_clk_period;
      -----------------------------------------------------
	
      --T2 : running ALU-----------------------------------
	EX_reset <= '0';
          EX_enable <= '1';
          EX_OpA <= (0 => '1', others => '0');
          EX_OpB <= (1 => '1', 0 => '1', others => '0');
          EX_Opcode <= "000010"; --ADD
          EX_ShiftAmount <= (others => '0');
          EX_sel_mux_out <= "00";
	wait for EX_clk_period;
	
	EX_reset <= '0';
          EX_enable <= '1';
          EX_OpA <= (1 => '1', others => '0');
          EX_OpB <= (0 => '1', others => '1');
          EX_Opcode <= "000011"; --SUB
          EX_ShiftAmount <= (others => '0');
          EX_sel_mux_out <= "00";
	wait for EX_clk_period;
      -----------------------------------------------------
      
      --T3a : running multiplier unsigned-----------------------------------
	EX_reset <= '0';
          EX_enable <= '1';
          EX_OpA <= (0 => '1', others => '0');
          EX_OpB <= (3 => '1', 1 => '1', 0 => '1', others => '0');
          EX_Opcode <= "110000"; --MULTU
          EX_ShiftAmount <= (others => '0');
          EX_sel_mux_out <= "01";
	wait for EX_clk_period;
	
	EX_reset <= '0';
          EX_enable <= '1';
          EX_OpA <= (0 => '1', others => '0');
          EX_OpB <= (2 => '1', 1 => '1', 0 => '1', others => '0');
          EX_Opcode <= "110000"; --MULTU
          EX_ShiftAmount <= (others => '0');
          EX_sel_mux_out <= "10";
	wait for EX_clk_period;
	
	EX_reset <= '0';
          EX_enable <= '1';
          EX_OpA <= (0 => '0', others => '1');
          EX_OpB <= (1 => '0', 0 => '0', others => '1');
          EX_Opcode <= "110000"; --MULTU
          EX_ShiftAmount <= (others => '0');
          EX_sel_mux_out <= "01";
	wait for EX_clk_period;
	
	EX_reset <= '0';
          EX_enable <= '1';
          EX_OpA <= (0 => '0', others => '1');
          EX_OpB <= (1 => '0', 0 => '0', others => '1');
          EX_Opcode <= "110000"; --MULTU
          EX_ShiftAmount <= (others => '0');
          EX_sel_mux_out <= "10";
	wait for EX_clk_period;
        -----------------------------------------------------
        
        --T3b : running multiplier signed-----------------------------------
	EX_reset <= '0';
          EX_enable <= '1';
          EX_OpA <= (0 => '0', others => '1');
          EX_OpB <= (1 => '0', 0 => '0', others => '1');
          EX_Opcode <= "110010"; --MULT
          EX_ShiftAmount <= (others => '0');
          EX_sel_mux_out <= "01";
	wait for EX_clk_period;
	
	EX_reset <= '0';
          EX_enable <= '1';
          EX_OpA <= (0 => '0', others => '1');
          EX_OpB <= (1 => '1', 0 => '1', others => '0');
          EX_Opcode <= "110010"; --MULT
          EX_ShiftAmount <= (others => '0');
          EX_sel_mux_out <= "10";
	wait for EX_clk_period;
	
	EX_reset <= '0';
          EX_enable <= '1';
          EX_OpA <= (0 => '0', others => '1');
          EX_OpB <= (1 => '0', 0 => '0', others => '1');
          EX_Opcode <= "110010"; --MULT
          EX_ShiftAmount <= (others => '0');
          EX_sel_mux_out <= "01";
	wait for EX_clk_period;
	
	EX_reset <= '0';
          EX_enable <= '1';
          EX_OpA <= (0 => '0', others => '1');
          EX_OpB <= (1 => '0', 0 => '0', others => '1');
          EX_Opcode <= "110010"; --MULT
          EX_ShiftAmount <= (others => '0');
          EX_sel_mux_out <= "10";
	wait for EX_clk_period;
      -----------------------------------------------------


    

      wait;
   end process;

END;
