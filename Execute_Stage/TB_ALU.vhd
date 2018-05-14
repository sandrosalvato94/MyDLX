--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:55:13 05/1NBIT_BS_AMOUNT-1/2018
-- Design Name:   
-- Module Name:   C:/Users/UTENTE/Desktop/Politecnico di Torino/Laurea Magistrale/I Anno/Microelectronic Systems/DLX/MyDLX/Execute_Stage/TB_ALU.vhd
-- Project Name:  Execute_Stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY TB_ALU IS
END TB_ALU;
 
ARCHITECTURE behavior OF TB_ALU IS 
 
    ----------CHANGE HERE GENERICS-----------
    constant NBIT_ALU 	: integer := 16;
    constant NBIT_BS_AMOUNT 	: integer :=  4;
    ------------------------------------------
 
    COMPONENT ALU
    GENERIC(NBIT_ALU : integer := 32;
	  NBIT_BS_AMOUNT : integer := 5);	
    PORT(
         ALU_OpA : IN  std_logic_vector(NBIT_ALU-1 downto 0);
         ALU_OpB : IN  std_logic_vector(NBIT_ALU-1 downto 0);
         ALU_Opcode : IN  std_logic_vector(5 downto 0);
         ALU_BS_amount : IN  std_logic_vector(NBIT_BS_AMOUNT-1 downto 0);
         ALU_output : OUT  std_logic_vector(NBIT_ALU-1 downto 0);
         ALU_flags : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ALU_OpA : std_logic_vector(NBIT_ALU-1 downto 0) := (others => '0');
   signal ALU_OpB : std_logic_vector(NBIT_ALU-1 downto 0) := (others => '0');
   signal ALU_Opcode : std_logic_vector(5 downto 0) := (others => '0');
   signal ALU_BS_amount : std_logic_vector(NBIT_BS_AMOUNT-1 downto 0) := (others => '0');

 	--Outputs
   signal ALU_output : std_logic_vector(NBIT_ALU-1 downto 0);
   signal ALU_flags : std_logic_vector(4 downto 0);

 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU GENERIC MAP (NBIT_ALU => NBIT_ALU, NBIT_BS_AMOUNT => NBIT_BS_AMOUNT) 
	PORT MAP (
          ALU_OpA => ALU_OpA,
          ALU_OpB => ALU_OpB,
          ALU_Opcode => ALU_Opcode,
          ALU_BS_amount => ALU_BS_amount,
          ALU_output => ALU_output,
          ALU_flags => ALU_flags
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
      
      --T1: do not anything------------------------------------------------
      ALU_OpA 	<= std_logic_vector(to_unsigned(0, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_unsigned(0, NBIT_ALU));
      ALU_Opcode 	<= "110000";
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --20
      
      ALU_OpA 	<= std_logic_vector(to_unsigned(2, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_unsigned(3, NBIT_ALU));
      ALU_Opcode 	<= "110011";
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --30
      
      ALU_OpA 	<= std_logic_vector(to_unsigned(12, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_unsigned(10, NBIT_ALU));
      ALU_Opcode 	<= "110100";
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --40
      
      ALU_OpA 	<= std_logic_vector(to_unsigned(0, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_unsigned(0, NBIT_ALU));
      ALU_Opcode 	<= "111111";
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --50
      ---------------------------------------------------------------------
      
      --T2: ADDI, ADDUI, SUBI, SUBUI, LHI, LW, SW, ADD, ADDU, SUB, SUBU---------
      ALU_OpA 	<= std_logic_vector(to_signed(10, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_signed(-20, NBIT_ALU));
      ALU_Opcode 	<= "000010"; --ADDI
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --60
      
      ALU_OpA 	<= std_logic_vector(to_unsigned(10, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_unsigned(20, NBIT_ALU));
      ALU_Opcode 	<= "000000"; --ADDUI
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --70
      
      ALU_OpA 	<= std_logic_vector(to_signed(-10, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_signed(-20, NBIT_ALU));
      ALU_Opcode 	<= "000011"; --SUBI
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --80
      
      ALU_OpA 	<= std_logic_vector(to_unsigned(10, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_unsigned(20, NBIT_ALU));
      ALU_Opcode 	<= "000001"; --SUBUI
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --90
      
      ALU_OpA 	<= std_logic_vector(to_unsigned(1, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_unsigned(6, NBIT_ALU));
      ALU_Opcode 	<= "001000"; --LHI
      ALU_BS_amount <= std_logic_vector(to_unsigned(16, NBIT_BS_AMOUNT));
      wait for 10 ns; --100
      
      ALU_OpA 	<= std_logic_vector(to_unsigned(1, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_unsigned(6, NBIT_ALU));
      ALU_Opcode 	<= "000000"; --LW
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --110
      
      ALU_OpA 	<= std_logic_vector(to_unsigned(2, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_unsigned(7, NBIT_ALU));
      ALU_Opcode 	<= "000000"; --SW
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --120
      
      ALU_OpA 	<= (others => '1');
      ALU_OpB 	<= (others => '1');
      ALU_Opcode 	<= "000010"; --ADD
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --130
      
      ALU_OpA 	<= (others => '1');
      ALU_OpB 	<= (others => '1');
      ALU_Opcode 	<= "000000"; --ADDUI
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --140
      
      ALU_OpA 	<= (others => '1');
      ALU_OpB 	<= (0 => '0', others => '1');
      ALU_Opcode 	<= "000011"; --SUB
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --150
      
      ALU_OpA 	<= (others => '1');
      ALU_OpB 	<= (0 => '0', others => '1');
      ALU_Opcode 	<= "000001"; --SUBU
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --160
      -------------------------------------------------------------------------
      
      --T3: LHI, SLLI, SRLI, SRAI, SLL, SRL, SRA-------------------------------
      ALU_OpA 	<= std_logic_vector(to_unsigned(1, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_unsigned(1, NBIT_ALU));
      ALU_Opcode 	<= "001000"; --LHI
      ALU_BS_amount <= std_logic_vector(to_unsigned(16, NBIT_BS_AMOUNT));
      wait for 10 ns; --170
      
      ALU_OpA 	<= std_logic_vector(to_unsigned(1, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_unsigned(0, NBIT_ALU));
      ALU_Opcode 	<= "001000"; --SLLI/SLL
      ALU_BS_amount <= std_logic_vector(to_unsigned(3, NBIT_BS_AMOUNT));
      wait for 10 ns; --180
      
      ALU_OpA 	<= std_logic_vector(to_unsigned(2, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_unsigned(0, NBIT_ALU));
      ALU_Opcode 	<= "000100"; --SRLI/SRL
      ALU_BS_amount <= std_logic_vector(to_unsigned(1, NBIT_BS_AMOUNT));
      wait for 10 ns; --190
      
      ALU_OpA 	<= std_logic_vector(to_signed(-2, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_unsigned(0, NBIT_ALU));
      ALU_Opcode 	<= "001100"; --SRAI/SRA
      ALU_BS_amount <= std_logic_vector(to_unsigned(1, NBIT_BS_AMOUNT));
      wait for 10 ns; --200
      -------------------------------------------------------------------------
      
      --T4: ANDI, ORI, XORI, AND, OR, XOR, NAND, NANDI, NOR, NORI, XNOR, XNORI--
      ALU_OpA 	<= std_logic_vector(to_unsigned(1, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_unsigned(1, NBIT_ALU));
      ALU_Opcode 	<= "011000"; --ANDI/AND
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --210
      
      ALU_OpA 	<= std_logic_vector(to_unsigned(10, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_unsigned(45, NBIT_ALU));
      ALU_Opcode 	<= "011110"; --ORI/OR
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --220
      
      ALU_OpA 	<= std_logic_vector(to_unsigned(11, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_unsigned(0, NBIT_ALU));
      ALU_Opcode 	<= "010110"; --XORI/XOR
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --230
      
      ALU_OpA 	<= std_logic_vector(to_unsigned(12, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_unsigned(47, NBIT_ALU));
      ALU_Opcode 	<= "010111"; --NANDI/NAND
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --240
      
      ALU_OpA 	<= std_logic_vector(to_unsigned(13, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_unsigned(0, NBIT_ALU));
      ALU_Opcode 	<= "010001"; --NORI/NOR
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --250
      
      ALU_OpA 	<= std_logic_vector(to_unsigned(14, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_unsigned(49, NBIT_ALU));
      ALU_Opcode 	<= "011001"; --XNORI/XNOR
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --260
      --------------------------------------------------------------------------
      
      --T5: SEQI, SNEI, SLTI, SGTI, SLEI, SGEI, SLTUI, SGTUI, SLEUI, SGEUI, SEQ,
      ------SNE, SLT, SGT, SLE, SGE, SLTU, SGTU, SLEU, SGEU---------------------
      ALU_OpA 	<= std_logic_vector(to_unsigned(1, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_unsigned(1, NBIT_ALU));
      ALU_Opcode 	<= "100100"; --SEQI/SEQ
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --270
      
      ALU_OpA 	<= std_logic_vector(to_unsigned(2, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_unsigned(3, NBIT_ALU));
      ALU_Opcode 	<= "100101"; --SNEI/SNE
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --280
      
      ALU_OpA 	<= std_logic_vector(to_signed(-2, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_signed(3, NBIT_ALU));
      ALU_Opcode 	<= "101000"; --SLTI/SLT
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --290
      
      ALU_OpA 	<= std_logic_vector(to_signed(-1, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_signed(-3, NBIT_ALU));
      ALU_Opcode 	<= "101001"; --SGTI/SGT
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --300
      
      ALU_OpA 	<= std_logic_vector(to_signed(-2, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_signed(-2, NBIT_ALU));
      ALU_Opcode 	<= "101010"; --SLEI/SLE
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --310
      
      ALU_OpA 	<= std_logic_vector(to_signed(-1, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_signed(-9, NBIT_ALU));
      ALU_Opcode 	<= "101011"; --SGEI/SGE
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --320
      
       ALU_OpA 	<= std_logic_vector(to_unsigned(2, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_unsigned(3, NBIT_ALU));
      ALU_Opcode 	<= "100000"; --SLTUI/SLTU
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --330
      
      ALU_OpA 	<= std_logic_vector(to_unsigned(3, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_unsigned(1, NBIT_ALU));
      ALU_Opcode 	<= "100001"; --SGTUI/SGTU
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --340
      
      ALU_OpA 	<= std_logic_vector(to_unsigned(1, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_unsigned(2, NBIT_ALU));
      ALU_Opcode 	<= "100010"; --SLEUI/SLEU
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --350
      
      ALU_OpA 	<= std_logic_vector(to_unsigned(3, NBIT_ALU));
      ALU_OpB 	<= std_logic_vector(to_unsigned(3, NBIT_ALU));
      ALU_Opcode 	<= "100011"; --SGEUI/SGEU
      ALU_BS_amount <= std_logic_vector(to_unsigned(0, NBIT_BS_AMOUNT));
      wait for 10 ns; --360
      --------------------------------------------------------------------------
      wait;
   end process;

END;
