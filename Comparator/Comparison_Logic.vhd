----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 	Alessandro Salvato
-- 
-- Create Date:    10:35:15 05/08/2018 
-- Design Name: 
-- Module Name:    Comparison_Logic - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--	CMPL_sgn_usgn : 0	UNSIGNED
--	CMPL_sgn_usgn : 1	SIGNED
--
--	CMPL_OPCODE[3..0]	INSTRUCTIONS
--	   0000		  SLTUI/SLTU
--	   0001		  SGTUI/SGTU
--	   0010		  SLEUI/SLEU
--	   0011               SGEUI/SGEU
--	   0100		  SEQI/SEQ
--	   1000               SLTI/SLT
--	   1001               SGTI/SGT
--	   1010               SLEI/SLE
--	   1011               SGEI/SGE
--	   ----
--
--	As you can notice, CMPL_OPCODE[3] == CMPL_sgn_usgn !!!
--
--
-- Dependencies: 
--
-- Revision: 1.0 	Tests T1, T2, T3, T4, T5, T5, T6, T7, T8, T9 passed.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Comparison_Logic is
	generic(NBIT_DATA : integer := 32);
	port(
		CMPL_OpA		: in  std_logic_vector(NBIT_DATA-1 downto 0);
		CMPL_OpB  	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		CMPL_OPCODE	: in  std_logic_vector(3 downto 0);
--		CMPL_sgn_usgn	: in  std_logic;
		CMPL_Y		: out std_logic_vector(NBIT_DATA-1 downto 0)
	);
end Comparison_Logic;

architecture Structural of Comparison_Logic is

	component Comparator is
	generic(NBIT_DATA : integer := 32);
	port(
		CMP_OpA : 	in  std_logic_vector(NBIT_DATA-1 downto 0);
		CMP_OpB : 	in  std_logic_vector(NBIT_DATA-1 downto 0);
		CMP_sgn_usgn : 	in  std_logic;
		CMP_A_gt_B :	out std_logic;
		CMP_A_ge_B :	out std_logic;
		CMP_A_lt_B :	out std_logic;
		CMP_A_le_B :	out std_logic;
		CMP_A_eq_B :	out std_logic
	);
	end component;
	
	constant OP_LT	: std_logic_vector(2 downto 0) := "000";
	constant OP_GT	: std_logic_vector(2 downto 0) := "001";
	constant OP_LE	: std_logic_vector(2 downto 0) := "010";
	constant OP_GE	: std_logic_vector(2 downto 0) := "011";
	constant OP_EQ	: std_logic_vector(2 downto 0) := "100";
	
	signal s_A_gt_B, s_A_lt_B, s_A_ge_B, s_A_le_B, s_A_eq_B	: std_logic;
	signal s_out					: std_logic;
begin
--------------------------------------------------------------------------------------------------
	CMP : Comparator GENERIC MAP (NBIT_DATA => NBIT_DATA) PORT MAP (
						CMP_OpA => CMPL_OpA,
						CMP_OpB => CMPL_OpB,
						CMP_sgn_usgn => CMPL_OPCODE(3),
						CMP_A_gt_B => s_A_gt_B,
						CMP_A_ge_B => s_A_ge_B,
						CMP_A_lt_B => s_A_lt_B,
						CMP_A_le_B => s_A_le_B,
						CMP_A_eq_B => s_A_eq_B
						);
--------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------
	process(CMPL_OPCODE, s_A_gt_B, s_A_ge_B, s_A_lt_B, s_A_le_B, s_A_eq_B)
	begin
		case CMPL_OPCODE(2 downto 0) is
			when OP_LT  => 
				if(s_A_lt_B = '1') then
					s_out <= '1';
				else
					s_out <= '0';
				end if;
				
			when OP_GT  => 
				if(s_A_gt_B = '1') then
					s_out <= '1';
				else
					s_out <= '0';
				end if;
				
			when OP_LE  => 
				if(s_A_le_B = '1') then
					s_out <= '1';
				else
					s_out <= '0';
				end if;
				
			when OP_GE  => 
				if(s_A_ge_B = '1') then
					s_out <= '1';
				else
					s_out <= '0';
				end if;
				
			when OP_EQ  => 
				if(s_A_eq_B = '1') then
					s_out <= '1';
				else
					s_out <= '0';
				end if;
				
			when others => 
				s_out <= '0';
		end case;
	end process;
	
	CMPL_Y(NBIT_DATA-1 downto 1) <= (others => '0');
	CMPL_Y(0) <= s_out;
--------------------------------------------------------------------------------------------------
end Structural;

