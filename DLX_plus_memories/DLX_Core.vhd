----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:45:57 06/22/2018 
-- Design Name: 
-- Module Name:    DLX_Core - Structural 
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

entity DLX_Core is
	generic(	NBIT_DATA			 : integer := 32;
				NBIT_IRAM_ADDRESS	 : integer := 5;
				N_BTB_ENTRY			 : integer := 32;
				NBIT_BTB_PREDICTION: integer := 2);
	port(
		DLX_clk							: in  std_logic;
		DLX_reset						: in  std_logic;
		DLX_enable						: in  std_logic;
		DLX_IR							: in  std_logic_vector(31 downto 0);
		DLX_read_data					: in  std_logic_vector(NBIT_DATA-1 downto 0);
		
		DLX_written_data				: out std_logic_vector(NBIT_DATA-1 downto 0);
		DLX_address_written_data	: out std_logic_vector(2**NBIT_IRAM_ADDRESS-1 downto 0);
		DLX_PC							: out std_logic_vector(2**NBIT_IRAM_ADDRESS-1 downto 0);
		DLX_enable_DRAM				: out std_logic;
		DLX_RD_wr_DRAM					: out std_logic;
		DLX_error						: out std_logic
	);
end DLX_Core;

architecture Structural of DLX_Core is

	component Datapath is
	generic(NBIT_DATA 		: integer := 32;
			  NBIT_IRAM_ADDR	: integer := 5);
	port(
		DP_enable						: in  std_logic;
		DP_clk							: in  std_logic;
		DP_reset							: in  std_logic;
		
		DP_btb_target_prediction	: in  std_logic_vector(2**NBIT_IRAM_ADDR-1 downto 0);
		DP_btb_prediction				: in  std_logic;
		DP_IR								: in  std_logic_vector(31 downto 0);
		
		DP_Rd1							: in  std_logic;
		DP_Rd2							: in  std_logic;
		DP_Wr								: in  std_logic;
		DP_JMP_branch					: in  std_logic_vector(1 downto 0);
		DP_sign_extender				: in  std_logic_vector(1 downto 0);
		DP_save_PC						: in  std_logic; -- bitwise AND DP_Shift_Amount_selIF/ID
		
		DP_Shift_Amount_sel			: in  std_logic_vector(1 downto 0); --ID/EX
		DP_use_immediate				: in  std_logic;
		DP_reverse_operands			: in  std_logic;
		DP_ALU_Opcode					: in  std_logic_vector(5 downto 0);
		DP_EX_enable					: in  std_logic;
		DP_UUW_sel						: in  std_logic_vector(1 downto 0);
		
--		DP_DRAM_RD_wr					: in  std_logic; --directly to DRAM from control unit
		DP_Store_reduce				: in  std_logic;
		DP_Store_BYTE_half			: in  std_logic;
		DP_Load_data_from_DRAM		: in  std_logic_vector(NBIT_DATA -1 downto 0);
		
		DP_WB_sel						: in  std_logic;
		DP_Load_reduce					: in  std_logic;
		DP_Load_BYTE_half				: in  std_logic;
		DP_Load_SGN_usg_reduce		: in  std_logic;
		
		DP_insert_bubble				: out std_logic;
		
		DP_PC								: out std_logic_vector(2**NBIT_IRAM_ADDR-1 downto 0);
		DP_NPC								: out std_logic_vector(2**NBIT_IRAM_ADDR-1 downto 0);
		DP_IF_ID_instr_is_branch	: out std_logic;
		DP_IR_opcode					: out std_logic_vector(5 downto 0);
		DP_IR_func						: out std_logic_vector(10 downto 0);
		DP_restore_BTB					: out std_logic;
		
		DP_branch_taken				: out std_logic;
		DP_computed_new_PC						: out std_logic_vector(2**NBIT_IRAM_ADDR-1 downto 0);
		DP_target						: out std_logic_vector(2**NBIT_IRAM_ADDR-1 downto 0);
		
		DP_data_to_DRAM				: out std_logic_vector(NBIT_DATA -1 downto 0);
		DP_address_to_DRAM			: out std_logic_vector(NBIT_DATA -1 downto 0) --NBIT_DATA because addresses are generated by the execute stage
	);
	end component;
	
	component ControlUnit is
	port(
		CU_instr_opcode	: in  std_logic_vector(5 downto 0);
		CU_instr_func		: in  std_logic_vector(10 downto 0);
		CU_enable			: in  std_logic;
		CU_reset				: in  std_logic;
		CU_clk				: in  std_logic;
		CU_flush				: in  std_logic;
		CU_bubble			: in  std_logic;
		CU_CW_DE				: out	std_logic_vector(1 to 9);
		CU_CW_EX				: out	std_logic_vector(8 to 16);
		CU_CW_MEM			: out	std_logic_vector(17 to 22);
		CU_CW_WB				: out	std_logic_vector(23 to 26);
		CU_error				: out std_logic
	);
	end component;
	
	component BTB is
	generic(
		N_ENTRY: 		integer := 32;
		NBIT_ENTRY: 	integer := 32;
		NBIT_TARGET:	integer := 32;
		NBIT_PREDICTION:	integer := 2);
	port(
		BTB_clk:			in std_logic;
		BTB_rst:			in std_logic;
		BTB_enable:		in std_logic;
		BTB_restore:	in std_logic;
		BTB_PC_From_IF:		in std_logic_vector(NBIT_ENTRY-1 downto 0);
		BTB_PC_From_DE:		in std_logic_vector(NBIT_ENTRY-1 downto 0);
		--BTB_NPC_From_DE:		in std_logic_vector(NBIT_ENTRY-1 downto 0);
		BTB_target_From_DE:		in std_logic_vector(NBIT_TARGET-1 downto 0);
		BTB_is_branch:		in std_logic; -- 1 true, 0 false
		BTB_branch_taken:		in std_logic; -- 1 true, 0 false. Coming from DE
		BTB_target_prediction:	out std_logic_vector(NBIT_TARGET-1 downto 0);
		BTB_prediction:		out std_logic -- 1 predicted taken, 0 predicted untaken
		
	);
	end component;
	
	component BTB_misprediction_manager is
	generic(NBIT_PC	: integer := 32);
	port(
		BMM_clk					:	in	 std_logic; 
		BMM_reset				:  in  std_logic;
		BMM_enable				:  in  std_logic;
		BMM_restore				:	in  std_logic;
		BMM_PC					:  in  std_logic_vector(NBIT_PC-1 downto 0); --program counter from DE
		BMM_NPC					:  in  std_logic_vector(NBIT_PC-1 downto 0); --program counter from IF
		BMM_computed_PC		:  in  std_logic_vector(NBIT_PC-1 downto 0); 
		BMM_is_branch			:  in  std_logic;
		BMM_branch_taken		:  in  std_logic;
		BMM_PC_BTB				:  out std_logic_vector(NBIT_PC-1 downto 0);
		BMM_NPC_BTB				:  out std_logic_vector(NBIT_PC-1 downto 0);
		BMM_computed_PC_BTB	:  out std_logic_vector(NBIT_PC-1 downto 0); 
		BMM_restore_BTB		:  out std_logic; 
		BMM_is_branch_BTB 	:  out std_logic;
		BMM_branch_taken_BTB	:  out std_logic
	);
	end component;
	
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

	signal s_target_prediction_Fbtb_Tdp	: std_logic_vector(2**NBIT_IRAM_ADDRESS-1 downto 0);
	signal s_prediction_Fbtb_Tdp			: std_logic;
	signal s_DE_cw_Fcu_Tdp					: std_logic_vector(1 to 9);
	signal s_EX_cw_Fcu_Tdp					: std_logic_vector(8 to 16);
	signal s_MEM_cw_Fcu_Tdp					: std_logic_vector(17 to 22);
	signal s_WB_cw_Fcu_Tdp					: std_logic_vector(23 to 26);
	signal s_save_PC_Fcu_Tdp				: std_logic;
	signal s_use_immediate_Fcu_Tdp		: std_logic;
	signal s_insert_bubble_Fdp_Tcu		: std_logic;
	signal s_PC_Fdp_Tbtb						: std_logic_vector(2**NBIT_IRAM_ADDRESS-1 downto 0);
	signal s_PC_Fdp_Tbmm						: std_logic_vector(2**NBIT_IRAM_ADDRESS-1 downto 0);
	signal s_PC_Fbmm_Tbtb					: std_logic_vector(2**NBIT_IRAM_ADDRESS-1 downto 0);
	signal s_NPC_Fdp_Tbmm					: std_logic_vector(2**NBIT_IRAM_ADDRESS-1 downto 0);
	signal s_NPC_Fdp_Tbtb					: std_logic_vector(2**NBIT_IRAM_ADDRESS-1 downto 0);
	signal s_NPC_Fbmm_Tbtb					: std_logic_vector(2**NBIT_IRAM_ADDRESS-1 downto 0);
	signal s_computed_NPC_Fdp_Tbtb					: std_logic_vector(2**NBIT_IRAM_ADDRESS-1 downto 0);
	signal s_computed_NPC_Fdp_Tbmm					: std_logic_vector(2**NBIT_IRAM_ADDRESS-1 downto 0);
	signal s_computed_NPC_Fbmm_Tbtb					: std_logic_vector(2**NBIT_IRAM_ADDRESS-1 downto 0);
	signal s_branch_taken_Fdp_Tdp_cu		: std_logic;
	signal s_branch_taken_Fd_bmm_Tbtb		: std_logic;
	signal s_IFID_istr_is_brnch_Fdp_Tbtb: std_logic;
	signal s_IFID_istr_is_brnch_Fdp_Tbmm: std_logic;
	signal s_IFID_istr_is_brnch_Fbmm_Tbtb: std_logic;
	signal s_IR_opcode_Fdp_Tcu				: std_logic_vector(5 downto 0);
	signal s_IR_func_Fdp_Tcu				: std_logic_vector(10 downto 0);
	signal s_target_Fdp_Tbtb				: std_logic_vector(2**NBIT_IRAM_ADDRESS-1 downto 0);
	signal s_instr_is_branch				: std_logic;
	signal s_restore_Fdp_Tbmm					: std_logic;
	signal s_restore_Fbmm_Tbtb					: std_logic;
	
	

begin

	s_save_PC_Fcu_Tdp <= s_DE_cw_Fcu_Tdp(8) AND s_DE_cw_Fcu_Tdp(9);
	s_use_immediate_Fcu_Tdp <= NOT(s_DE_cw_Fcu_Tdp(2));

	DP : Datapath	GENERIC MAP (NBIT_DATA => NBIT_DATA, NBIT_IRAM_ADDR => NBIT_IRAM_ADDRESS) PORT MAP (
		DP_enable						=> DLX_enable,
		DP_clk							=> DLX_clk,
		DP_reset							=> DLX_reset,
		DP_btb_target_prediction	=> s_target_prediction_Fbtb_Tdp,
		DP_btb_prediction				=> s_prediction_Fbtb_Tdp, --'0'/'1' enable BTB
		DP_IR								=> DLX_IR,
		DP_Rd1							=> s_DE_cw_Fcu_Tdp(1),
		DP_Rd2							=> s_DE_cw_Fcu_Tdp(2),
		DP_Wr								=> s_DE_cw_Fcu_Tdp(3),
		DP_JMP_branch					=> s_DE_cw_Fcu_Tdp(4 to 5),
		DP_sign_extender				=> s_DE_cw_Fcu_Tdp(6 to 7),
		DP_save_PC						=> s_save_PC_Fcu_Tdp,
		DP_Shift_Amount_sel			=> s_EX_cw_Fcu_Tdp(8 to 9),
		DP_use_immediate				=> s_use_immediate_Fcu_Tdp,
		DP_reverse_operands			=> s_EX_cw_Fcu_Tdp(9),
		DP_ALU_Opcode					=> s_EX_cw_Fcu_Tdp(10 to 15),
		DP_EX_enable					=> s_EX_cw_Fcu_Tdp(16),
		DP_UUW_sel						=> s_MEM_cw_Fcu_Tdp(17 to 18), --modifica del 3 luglio
		DP_Store_reduce				=> s_MEM_cw_Fcu_Tdp(21),
		DP_Store_BYTE_half			=> s_MEM_cw_Fcu_Tdp(22),
		DP_Load_data_from_DRAM		=> DLX_read_data,
		DP_WB_sel						=> s_WB_cw_Fcu_Tdp(23),
		DP_Load_reduce					=> s_WB_cw_Fcu_Tdp(24),
		DP_Load_BYTE_half				=> s_WB_cw_Fcu_Tdp(25),
		DP_Load_SGN_usg_reduce		=> s_WB_cw_Fcu_Tdp(26),
		DP_insert_bubble				=> s_insert_bubble_Fdp_Tcu,
		DP_restore_BTB					=> s_restore_Fdp_Tbmm,
		DP_PC								=> s_PC_Fdp_Tbmm,	
		--DP_NPC							=> s_NPC_Fdp_Tbtb,
		DP_IF_ID_instr_is_branch   => s_IFID_istr_is_brnch_Fdp_Tbmm,
		DP_IR_opcode					=> s_IR_opcode_Fdp_Tcu,
		DP_IR_func						=> s_IR_func_Fdp_Tcu,
		DP_branch_taken				=> s_branch_taken_Fdp_Tdp_cu,
		DP_computed_new_PC			=> s_computed_NPC_Fdp_Tbmm,
		DP_target						=> s_target_Fdp_Tbtb,
		DP_data_to_DRAM				=> DLX_written_data,
		DP_address_to_DRAM			=> DLX_address_written_data
		);
	
	DLX_PC <= s_PC_Fdp_Tbmm;

	CU : ControlUnit PORT MAP (
		CU_instr_opcode	=> s_IR_opcode_Fdp_Tcu,
		CU_instr_func		=> s_IR_func_Fdp_Tcu,
		CU_enable			=> DLX_enable,
		CU_reset				=> DLX_reset,
		CU_clk				=> DLX_clk,
		CU_flush				=> s_branch_taken_Fdp_Tdp_cu,
		CU_bubble			=> s_insert_bubble_Fdp_Tcu, --attivo basso
		CU_CW_DE				=> s_DE_cw_Fcu_Tdp,
		CU_CW_EX				=> s_EX_cw_Fcu_Tdp,
		CU_CW_MEM			=> s_MEM_cw_Fcu_Tdp,
		CU_CW_WB				=> s_WB_cw_Fcu_Tdp,
		CU_error				=> DLX_error
		);
	
	DLX_enable_DRAM <= s_MEM_cw_Fcu_Tdp(20) ;
	DLX_RD_wr_DRAM  <= s_MEM_cw_Fcu_Tdp(19) ;
	
--	process(DLX_IR) 
--	begin
--		if((DLX_IR(31 downto 26) = OPCODE_BNEZ) OR (DLX_IR(31 downto 26) = OPCODE_BEQZ)) then
--				s_instr_is_branch <= '1';
--		else
--				s_instr_is_branch <= '0';
--		end if;
--	end process;
	
	PC_reg	: NRegister GENERIC MAP (N => 2**NBIT_IRAM_ADDRESS) PORT MAP (
		clk => DLX_clk,
		reset => DLX_reset,
		enable => s_insert_bubble_Fdp_Tcu,
		load => '1',
		data_in => s_PC_Fdp_Tbmm,
		data_out => s_NPC_Fdp_Tbmm
		);
	
	BMM : BTB_misprediction_manager GENERIC MAP (NBIT_PC => 2**NBIT_IRAM_ADDRESS) PORT MAP (
																			BMM_clk					=> DLX_clk,
																			BMM_reset				=> DLX_reset,
																			BMM_enable				=> s_insert_bubble_Fdp_Tcu,
																			BMM_restore				=> s_restore_Fdp_Tbmm,
																			BMM_PC					=> s_PC_Fdp_Tbmm,
																			BMM_NPC					=> s_NPC_Fdp_Tbmm,
																			BMM_computed_PC		=> s_computed_NPC_Fdp_Tbmm,
																			BMM_is_branch			=> s_IFID_istr_is_brnch_Fdp_Tbmm,
																			BMM_branch_taken		=> s_branch_taken_Fdp_Tdp_cu,
																			BMM_PC_BTB				=> s_PC_Fbmm_Tbtb,
																			BMM_NPC_BTB				=> s_NPC_Fbmm_Tbtb,
																			BMM_computed_PC_BTB	=> s_computed_NPC_Fbmm_Tbtb,
																			BMM_restore_BTB		=> s_restore_Fbmm_Tbtb,
																			BMM_is_branch_BTB 	=> s_IFID_istr_is_brnch_Fbmm_Tbtb,
																			BMM_branch_taken_BTB	=> s_branch_taken_Fd_bmm_Tbtb
																);
	
	BTB_cache : BTB GENERIC MAP (N_ENTRY => N_BTB_ENTRY, 
										  NBIT_ENTRY => 2**NBIT_IRAM_ADDRESS, 
										  NBIT_TARGET => 2**NBIT_IRAM_ADDRESS, 
										  NBIT_PREDICTION => NBIT_BTB_PREDICTION) 
						 PORT MAP (
		BTB_clk						=> DLX_clk,
		BTB_rst						=> DLX_reset,
		BTB_enable					=> s_insert_bubble_Fdp_Tcu, --should be checked
		BTB_restore					=> s_restore_Fbmm_Tbtb,
		BTB_PC_From_IF				=> s_PC_Fbmm_Tbtb,
		BTB_PC_From_DE				=> s_NPC_Fbmm_Tbtb,
--      BTB_target_From_DE		=> s_target_Fdp_Tbtb,
		BTB_target_From_DE		=> s_computed_NPC_Fbmm_Tbtb, --modificato il 7 luglio
		BTB_is_branch				=> s_IFID_istr_is_brnch_Fbmm_Tbtb,
--		BTB_is_branch				=> s_instr_is_branch, -- modificato il 7 luglio
		BTB_branch_taken			=> s_branch_taken_Fd_bmm_Tbtb,
		BTB_target_prediction	=> s_target_prediction_Fbtb_Tdp,
		BTB_prediction				=> s_prediction_Fbtb_Tdp
		);

end Structural;

