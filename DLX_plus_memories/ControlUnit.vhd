----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:23:58 06/13/2018 
-- Design Name: 
-- Module Name:    ControlUnit - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
-- Rd1 Rd2 Wr JMP_brch SignextDE	UsePCx2	UseImm ReversOp HMBS_sel EX_op EX_enabl EXsel_out RD_wr DRAM_en MEM_red	BYTE_half WB_sel WB_red	Byte_half SGN_usg
--
-- Dependencies: 
--
-- Revision: 0.4
--
-- Revision 0.01 - File Created
--				0.1  - All components decleared.
--				0.2  - New input signals (CU_flush & CU_bubble), but used yet
--				0.3  - Implemented logic for bubble management
--				0.4  - Implemented logic for flush management
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
		CU_flush				: in  std_logic;
		CU_bubble			: in  std_logic;
		--CU_CW_FE				: out	std_logic_vector(13 downto 0);
		CU_CW_DE				: out	std_logic_vector(1 to 9);
		CU_CW_EX				: out	std_logic_vector(8 to 16);
		CU_CW_MEM			: out	std_logic_vector(17 to 22);
		CU_CW_WB				: out	std_logic_vector(23 to 26);
		CU_error				: out std_logic
	);
end ControlUnit;

architecture Structural of ControlUnit is
	
	component NRegister is
	generic(N: integer:= 32);
	port(
		clk:	in  std_logic;
		reset:	in  std_logic; --Active high
		data_in:	in  std_logic_vector(N-1 downto 0);
		enable:	in  std_logic;
		load:	in  std_logic; --Load enable high
		data_out: out std_logic_vector(N-1 downto 0));
	end component;
	
	component Mux_NBit_2x1 is
	generic(NBIT_IN: integer := 32);
	port(
		port0	: in  std_logic_vector(NBIT_IN-1 downto 0);
		port1	: in  std_logic_vector(NBIT_IN-1 downto 0);
		sel	: in  std_logic;
		portY	: out std_logic_vector(NBIT_IN-1 downto 0)
	);
	end component;
	
	component Reg1Bit is
	port(
		clk:	in  std_logic;
		reset:	in  std_logic; --Active high
		data_in:	in  std_logic;
		enable:	in  std_logic;
		load:	in  std_logic; --Load enable high
		data_out: out std_logic);
	end component;
	
	signal s_control_word	: std_logic_vector(1 to 26);
	signal s_cw_jmp_r			: std_logic_vector(1 to 26);
	signal s_cw_tmp			: std_logic_vector(1 to 26);
	signal s_cw_Fde_Tex		: std_logic_vector(1 to 26);
	signal s_cw_Fex_Tmem		: std_logic_vector(8 to 26);
	signal s_cw_Fmem_Twb		: std_logic_vector(17 to 26);
	signal s_cw_Fwb			: std_logic_vector(23 to 26);
	
	signal s_cw_bubble 		: std_logic_vector(1 to 26) := "0000010" & "00" & "000000" & "000" & "1000" & "0000";
	signal s_flush, s_flush_ex	: std_logic;
	signal s_reset_regs		: std_logic;
	signal s_insert_nop		: std_logic;
	signal s_jmp_r				: std_logic;
	signal s_enable_regs		: std_logic;

begin
---------------------------------------------------------------------------------------------------
	instr_decoding_proc : process(CU_instr_opcode, CU_instr_func, CU_enable)
	begin
		if(CU_enable = '1' AND CU_reset = '0') then
			CU_error <= '0';
			s_jmp_r  <= '0';
			case CU_instr_opcode is
			--REG-------------------------------
				when OPCODE_REG =>
					case CU_instr_func is
						when FUNC_SLL => 
								s_control_word <= "1110010" & "10" & "001000" & "100" & "1000" & "0000";
						when FUNC_SRL => 
								s_control_word <= "1110010" & "10" & "000100" & "100" & "1000" & "0000";
						when FUNC_SRA => 
								s_control_word <= "1110010" & "10" & "001100" & "100" & "1000" & "0000";
						when FUNC_ADD => 
								s_control_word <= "1110010" & "00" & "000010" & "100" & "1000" & "0000";
						when FUNC_ADDU => 
								s_control_word <= "1110010" & "00" & "000000" & "100" & "1000" & "0000";
						when FUNC_SUB => 
								s_control_word <= "1110010" & "00" & "000011" & "100" & "1000" & "0000";
						when FUNC_SUBU => 
								s_control_word <= "1110010" & "00" & "000001" & "100" & "1000" & "0000";
						when FUNC_AND => 
								s_control_word <= "1110010" & "00" & "011000" & "100" & "1000" & "0000";
						when FUNC_OR => 
								s_control_word <= "1110010" & "00" & "011110" & "100" & "1000" & "0000";
						when FUNC_XOR => 
								s_control_word <= "1110010" & "00" & "010110" & "100" & "1000" & "0000";
						when FUNC_SEQ => 
								s_control_word <= "1110010" & "00" & "100100" & "100" & "1000" & "0000";
						when FUNC_SNE => 
								s_control_word <= "1110010" & "00" & "100101" & "100" & "1000" & "0000";
						when FUNC_SLT => 
								s_control_word <= "1110010" & "00" & "101000" & "100" & "1000" & "0000";
						when FUNC_SGT => 
								s_control_word <= "1110010" & "00" & "101001" & "100" & "1000" & "0000";
						when FUNC_SLE => 
								s_control_word <= "1110010" & "00" & "101010" & "100" & "1000" & "0000";
						when FUNC_SGE => 
								s_control_word <= "1110010" & "00" & "101011" & "100" & "1000" & "0000";
						when FUNC_SLTU => 
								s_control_word <= "1110010" & "00" & "100000" & "100" & "1000" & "0000";
						when FUNC_SGTU => 
								s_control_word <= "1110010" & "00" & "100001" & "100" & "1000" & "0000";
						when FUNC_SLEU => 
								s_control_word <= "1110010" & "00" & "100010" & "100" & "1000" & "0000";
						when FUNC_SGEU => 
								s_control_word <= "1110010" & "00" & "100011" & "100" & "1000" & "0000";
						when others => 
								s_control_word <= "0000010" & "00" & "000000" & "000" & "1000" & "0000";
								CU_error <= '1';
					end case; -- end case REG FUNC
			--MUL-----------------------------------	
				when OPCODE_MUL      => 
					case CU_instr_func is
						when FUNC_MULT => 
								s_control_word <= "1100010" & "00" & "110010" & "111" & "1000" & "0000";
						when FUNC_MULTU => 
								s_control_word <= "1100010" & "00" & "110000" & "111" & "1000" & "0000";
						when others => 
								s_control_word <= "0000010" & "00" & "000000" & "000" & "1000" & "0000";
								CU_error <= '1';
					end case;
			--JMP-----------------------------------
				when OPCODE_J => 
						s_control_word <= "0001001" & "00" & "000000" & "000" & "1000" & "0000";
				when OPCODE_JAL => 
						s_control_word <= "0011001" & "11" & "000000" & "100" & "1000" & "0000";
						s_jmp_r <= '1';
				when OPCODE_JR => 
						s_control_word <= "1001110" & "00" & "000000" & "000" & "1000" & "0000";
						s_jmp_r <= '1';
				when OPCODE_JALR => 
						s_control_word <= "1011110" & "11" & "000000" & "100" & "1000" & "0000";
			--BRANCH--------------------------------
				when OPCODE_BEQZ => 
						s_control_word <= "1000111" & "00" & "000000" & "000" & "1000" & "0000";
				when OPCODE_BNEZ => 
						s_control_word <= "1000011" & "00" & "000000" & "000" & "1000" & "0000";
			--IMM-----------------------------------	
				when OPCODE_ADDI => 
						s_control_word <= "1010011" & "00" & "000010" & "100" & "1000" & "0000";
				when OPCODE_ADDUI => 
						s_control_word <= "1010010" & "00" & "000000" & "100" & "1000" & "0000";
				when OPCODE_SUBI => 
						s_control_word <= "1010011" & "00" & "000011" & "100" & "1000" & "0000";
				when OPCODE_SUBUI => 
						s_control_word <= "1010010" & "00" & "000001" & "100" & "1000" & "0000";
				when OPCODE_ANDI => 
						s_control_word <= "1010010" & "00" & "011000" & "100" & "1000" & "0000";
				when OPCODE_ORI => 
						s_control_word <= "1010010" & "00" & "011110" & "100" & "1000" & "0000";
				when OPCODE_XORI => 
						s_control_word <= "1010010" & "00" & "010110" & "100" & "1000" & "0000";
				when OPCODE_SLLI => 
						s_control_word <= "1010010" & "10" & "001000" & "100" & "1000" & "0000";
				when OPCODE_SRLI => 
						s_control_word <= "1010010" & "10" & "000100" & "100" & "1000" & "0000";
				when OPCODE_SRAI => 
						s_control_word <= "1010010" & "10" & "001100" & "100" & "1000" & "0000";
				when OPCODE_SEQI => 
						s_control_word <= "1010010" & "00" & "100100" & "100" & "1000" & "0000";
				when OPCODE_SNEI => 
						s_control_word <= "1010010" & "00" & "100101" & "100" & "1000" & "0000";
				when OPCODE_SLTI => 
						s_control_word <= "1010011" & "00" & "101000" & "100" & "1000" & "0000";
				when OPCODE_SGTI => 
						s_control_word <= "1010011" & "00" & "101001" & "100" & "1000" & "0000";
				when OPCODE_SLEI => 
						s_control_word <= "1010011" & "00" & "101010" & "100" & "1000" & "0000";
				when OPCODE_SGEI => 
						s_control_word <= "1010011" & "00" & "101011" & "100" & "1000" & "0000";
				when OPCODE_SLTUI => 
						s_control_word <= "1010010" & "00" & "100000" & "100" & "1000" & "0000";
				when OPCODE_SGTUI => 
						s_control_word <= "1010010" & "00" & "100001" & "100" & "1000" & "0000";
				when OPCODE_SLEUI => 
						s_control_word <= "1010010" & "00" & "100010" & "100" & "1000" & "0000";
				when OPCODE_SGEUI => 
						s_control_word <= "1010010" & "00" & "100011" & "100" & "1000" & "0000";
			--LOAD----------------------------------
				when OPCODE_LB => 
						s_control_word <= "1010011" & "00" & "000010" & "100" & "1100" & "1111";
				when OPCODE_LH => 
						s_control_word <= "1010011" & "00" & "000010" & "100" & "1100" & "1101";
				when OPCODE_LW => 
						s_control_word <= "1010011" & "00" & "000010" & "100" & "1100" & "1000";
				when OPCODE_LBU => 
						s_control_word <= "1010011" & "00" & "000010" & "100" & "1100" & "1110";
				when OPCODE_LHU => 
						s_control_word <= "1010011" & "00" & "000010" & "100" & "1100" & "1100";
			--STORE---------------------------------
				when OPCODE_SB => 
						s_control_word <= "1100011" & "00" & "000010" & "100" & "0111" & "1000";
				when OPCODE_SH => 
						s_control_word <= "1100011" & "00" & "000010" & "100" & "0110" & "1000";
				when OPCODE_SW => 
						s_control_word <= "1100011" & "00" & "000010" & "100" & "0100" & "1000";
			--NOP-----------------------------------
				when OPCODE_NOP => 
						s_control_word <= "0000010" & "00" & "000000" & "000" & "1000" & "0000";
			--1 REG---------------------------------
				when OPCODE_LHI => 
						s_control_word <= "0010011" & "01" & "001000" & "100" & "1000" & "0000";
			--SPECIAL 1 REG------------------------
				when OPCODE_MFHI => 
						s_control_word <= "0010010" & "00" & "000000" & "001" & "1000" & "0000";
				when OPCODE_MFLO => 
						s_control_word <= "0010010" & "00" & "000000" & "010" & "1000" & "0000";
			--SPECIAL 2 REG------------------------
				when OPCODE_LAHI => 
						s_control_word <= "1010011" & "01" & "001010" & "100" & "1000" & "0000";
				when OPCODE_LAHIU => 
						s_control_word <= "1010011" & "01" & "001000" & "100" & "1000" & "0000";
			--OTHERS-------------------------------
				when others => 
						s_control_word <= "0000010" & "00" & "000000" & "000" & "1000" & "0000";
						CU_error <= '1';
			end case; --end case opcode
		else 
			s_control_word <= "0000010" & "00" & "000000" & "000" & "1000" & "0000";
			CU_error <= '1';
		end if; --end main if
	end process;
---------------------------------------------------------------------------------------------------	

	s_flush <= CU_reset OR CU_flush;
	
--	Rst_REG	: Reg1Bit PORT MAP(
--		clk		=> CU_clk,
--		reset		=> CU_reset,
--		data_in	=> s_flush,
--		enable	=> CU_enable,
--		load		=> '1',
--		data_out	=> s_flush_ex
--		);
--	
--	Rst_ex_REG	: Reg1Bit PORT MAP(
--		clk		=> CU_clk,
--		reset		=> CU_reset,
--		data_in	=> s_flush_ex,
--		enable	=> CU_enable,
--		load		=> '1',
--		data_out	=> s_reset_regs
--		);

---------------------------------------------------------------------------------------------------
--	s_cw_bubble(4 to 7) <= s_control_word(4 to 7);
	s_insert_nop <= s_flush OR NOT(CU_bubble); -- 0 0 - 1
													  -- 0 1 - 0
													  -- 1 0 - 1
													  -- 1 1 - 1
	s_enable_regs <= NOT(CU_enable AND NOT(s_jmp_r)); -- 0 0  - 1
																	  -- 0 1  - 1
																	  -- 1 0  - 0
--																	  -- 1 1  - 1

	process(s_flush, s_control_word) 
	begin
			if(s_flush = '0') then
				s_cw_bubble(4 to 7) <= s_control_word(4 to 7);
			else
				s_cw_bubble <= "0000010" & "00" & "000000" & "000" & "1000" & "0000";
			end if;
	end process;
--																	  
--	
--	JMP_R_REG	: NRegister GENERIC MAP (N => 26) PORT MAP (
--															clk => CU_clk,
--															reset => CU_reset,
--															data_in => s_control_word,
--															enable => s_enable_regs,
--															
--															load => '1',
--															data_out => s_cw_jmp_r
--															);
--															
--	JMP_R_MUX	: Mux_NBit_2x1 GENERIC MAP (NBIT_IN => 26) PORT MAP (
--															port0 => s_cw_bubble,
--															port1 => s_cw_jmp_r,
--															sel => s_enable_regs,
--															portY => s_cw_tmp
--															);
	
	
	BUBBLE_MUX	: Mux_NBit_2x1 GENERIC MAP (NBIT_IN => 26) PORT MAP (
															port0 => s_control_word, 
															port1 => s_cw_bubble,
															sel => s_insert_nop, --attivo basso
															portY => s_cw_tmp
															);
	
	DE_CW	: NRegister GENERIC MAP (N => 26) PORT MAP (
															clk => CU_clk,
															reset => CU_reset,
															data_in => s_cw_tmp,
															enable => CU_enable,
															load => '1',
															data_out => s_cw_Fde_Tex
															);
	CU_CW_DE <= s_cw_Fde_Tex(1 to 9);
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
	EX_CW	: NRegister GENERIC MAP (N => 19) PORT MAP (
															clk => CU_clk,
															reset => CU_reset,
															data_in => s_cw_Fde_Tex(8 to 26),
															enable => CU_enable,
															load => '1',
															data_out => s_cw_Fex_Tmem
															);
	CU_CW_EX <= s_cw_Fex_Tmem(8 to 16);
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------	
	MEM_CW: NRegister GENERIC MAP (N => 10) PORT MAP (
															clk => CU_clk,
															reset => CU_reset,
															data_in => s_cw_Fex_Tmem(17 to 26),
															enable => CU_enable,
															load => '1',
															data_out => s_cw_Fmem_Twb
															);
	CU_CW_MEM <= s_cw_Fmem_Twb(17 to 22);
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------	
	WB_CW	: NRegister GENERIC MAP (N => 4) PORT MAP (
															clk => CU_clk,
															reset => CU_reset,
															data_in => s_cw_Fmem_Twb(23 to 26),
															enable => CU_enable,
															load => '1',
															data_out => CU_CW_WB
															);
---------------------------------------------------------------------------------------------------
	
end Structural;

