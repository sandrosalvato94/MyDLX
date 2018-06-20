----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:23:58 06/13/2018 
-- Design Name: 
-- Module Name:    ControlUnit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.constants.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ControlUnit is
	port(
		CU_instr_opcode	: in  std_logic_vector(5 downto 0);
		CU_instr_func		: in  std_logic_vector(10 downto 0);
		CU_enable			: in  std_logic;
		CU_reset				: in  std_logic;
		CU_clk				: in  std_logic;
		CU_CW_FE				: out	std_logic_vector(13 downto 0);
		CU_CW_DE				: out	std_logic_vector(13 downto 0);
		CU_CW_EX				: out	std_logic_vector(13 downto 0);
		CU_CW_MEM			: out	std_logic_vector(13 downto 0);
		CU_CW_WB				: out	std_logic_vector(13 downto 0);
		CU_error				: out std_logic
	);
end ControlUnit;

architecture Behavioral of ControlUnit is

begin

	instr_decoding_proc : process(CU_instr_opcode, CU_instr_func, CU_enable)
	begin
		if(CU_enable = '1' AND CU_reset = '0') then
			case CU_instr_opcode is
			--REG-------------------------------
				when OPCODE_REG =>
					case CU_instr_func is
						when FUNC_SLL => ;
						when FUNC_SRL => ;
						when FUNC_SRA => ;
						when FUNC_ADD => ;
						when FUNC_ADDU => ;
						when FUNC_SUB => ;
						when FUNC_SUBU => ;
						when FUNC_AND => ;
						when FUNC_OR => ;
						when FUNC_XOR => ;
						when FUNC_SEQ => ;
						when FUNC_SNE => ;
						when FUNC_SLT => ;
						when FUNC_SGT => ;
						when FUNC_SLE => ;
						when FUNC_SGE => ;
						when FUNC_SLTU => ;
						when FUNC_SGTU => ;
						when FUNC_SLEU => ;
						when FUNC_SGEU => ;
						when others => ;
					end case; -- end case REG FUNC
			--MUL-----------------------------------	
				when OPCODE_MUL      => ;
					case CU_instr_func is
						when FUNC_MULT => ;
						when FUNC_MULTU => ;
						when others => ;
					end case;
			--JMP-----------------------------------
				when OPCODE_J => ;
				when OPCODE_JAL => ;
				when OPCODE_JR => ;
				when OPCODE_JALR => ;
			--BRANCH--------------------------------
				when OPCODE_BEQZ => ;
				when OPCODE_BNEZ => ;
			--IMM-----------------------------------	
				when OPCODE_ADDI => ;
				when OPCODE_ADDUI => ;
				when OPCODE_SUBI => ;
				when OPCODE_SUBUI => ;
				when OPCODE_ANDI => ;
				when OPCODE_ORI => ;
				when OPCODE_XORI => ;
				when OPCODE_SLLI => ;
				when OPCODE_SRLI => ;
				when OPCODE_SRAI => ;
				when OPCODE_SEQI => ;
				when OPCODE_SNEI => ;
				when OPCODE_SLTI => ;
				when OPCODE_SGTI => ;
				when OPCODE_SLEI => ;
				when OPCODE_SGEI => ;
				when OPCODE_SLTUI => ;
				when OPCODE_SGTUI => ;
				when OPCODE_SLEUI => ;
				when OPCODE_SGEUI => ;
			--LOAD----------------------------------
				when OPCODE_LB => ;
				when OPCODE_LH => ;
				when OPCODE_LW => ;
				when OPCODE_LBU => ;
				when OPCODE_LHU => ;
			--STORE---------------------------------
				when OPCODE_SB => ;
				when OPCODE_SH => ;
				when OPCODE_SW => ;
			--NOP-----------------------------------
				when OPCODE_NOP => ;
			--1 REG---------------------------------
				when OPCODE_LHI => ;
			--SPECIAL 1 REG------------------------
				when OPCODE_MFHI => ;
				when OPCODE_MFLO => ;
			--SPECIAL 2 REG------------------------
				when OPCODE_LAHI => ;
				when OPCODE_LAHIU => ;
			--OTHERS-------------------------------
				when others => ;
			end case; --end case opcode
		end if; --end main if
	end process;

end Behavioral;

