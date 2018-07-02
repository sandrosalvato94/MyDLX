----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:34:26 06/20/2018 
-- Design Name: 
-- Module Name:    Datapath - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 0.8
-- Revision 0.01 - File Created
--				
--				0.5 - Changed reset implementation of middle registers
--				0.6 - Added declaration of DP_EX_enable
--				0.7 - Added declaration of DP_IF_ID_instr_is_branch, after having
--						modified FCU, DP_IR_opcode and DP_IR_func
--				0.8 - Added DP_target on the pinout, in order to provide BTB
--				      the target address
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

entity Datapath is
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
--		DP_insert_flush				: out std_logic;
		
		DP_PC								: out std_logic_vector(2**NBIT_IRAM_ADDR-1 downto 0);
		DP_IF_ID_instr_is_branch	: out std_logic;
		DP_IR_opcode					: out std_logic_vector(5 downto 0);
		DP_IR_func						: out std_logic_vector(10 downto 0);
		
		DP_branch_taken				: out std_logic; --to BTB and CU for flushing
		DP_new_PC						: out std_logic_vector(2**NBIT_IRAM_ADDR-1 downto 0);
		DP_target						: out std_logic_vector(2**NBIT_IRAM_ADDR-1 downto 0);
		
		DP_data_to_DRAM				: out std_logic_vector(NBIT_DATA -1 downto 0);
		DP_address_to_DRAM			: out std_logic_vector(NBIT_DATA -1 downto 0) --NBIT_DATA because addresses are generated by the execute stage
	);
end Datapath;

architecture Structural of Datapath is

	component Fetch is
	generic(NBIT_PC : integer := 32;
	        NBIT_IR : integer := 32);
	port(
		FE_clk 			: in  std_logic;
		FE_rst 			: in  std_logic;
		FE_enable 		: in  std_logic;
		FE_PC_enable		: in  std_logic;
		FE_PC_clear		: in  std_logic;
		FE_IR_enable		: in  std_logic;
		FE_IR_clear		: in  std_logic;
		FE_btb_target_prediction 	: in  std_logic_vector(NBIT_PC-1 downto 0);
		FE_btb_prediction		: in  std_logic;
		FE_branch_taken		: in  std_logic;
		FE_new_PC_from_DE		: in  std_logic_vector(NBIT_PC-1 downto 0);
		FE_IR_in			: in  std_logic_vector(NBIT_IR-1 downto 0);
		FE_IR_out			: out std_logic_vector(NBIT_IR-1 downto 0);
		FE_PC			: out std_logic_vector(NBIT_PC-1 downto 0);
		FE_NPC			: out std_logic_vector(NBIT_PC-1 downto 0)
		
	);
	end component;
	
	component Decode is
	generic(NBIT_PC	: integer := 32;
	        NBIT_IR 	: integer := 32;
	        NBIT_ADDR 	: integer := 5;
	        NBIT_DATA	: integer := 32);
	port(
		DE_clk 		: in  std_logic;
		DE_reset 		: in  std_logic;
		DE_enable 	: in  std_logic;
		DE_IR		: in  std_logic_vector(NBIT_IR-1 downto 0);
		DE_PC		: in  std_logic_vector(NBIT_PC-1 downto 0);
		DE_NPC		: in  std_logic_vector(NBIT_PC-1 downto 0);
		DE_rd1		: in  std_logic;
		DE_rd2		: in  std_logic;
		DE_wr		: in  std_logic;
		DE_data_fex	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		DE_sel_data_forward : in std_logic_vector(1 downto 0);
		DE_data_Fwb	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		DE_signext	: in  std_logic_vector(1 downto 0); --[IMM/jump, SIGNED/unsigned]
		DE_JMP_branch	: in  std_logic_vector(1 downto 0);
		DE_save_PC	: in std_logic;
		DE_jmp_or_branch	: in std_logic;
		DE_branch_taken	: out std_logic;
		DE_new_PC		: out std_logic_vector(NBIT_PC-1 downto 0);
		DE_imm_address		: out std_logic_vector(NBIT_DATA-1 downto 0);
		DE_RegA		: out std_logic_vector(NBIT_DATA-1 downto 0);
		DE_RegB		: out std_logic_vector(NBIT_DATA-1 downto 0);
		DE_RegI		: out std_logic_vector(NBIT_DATA-1 downto 0)
	);
	end component;
	
	component Execute_Stage is
	generic(NBIT_DATA 	: integer := 32;
	        NBIT_BS_AMOUNT : integer := 5
	        );
	port(
		EX_clk 		: in  std_logic;
		EX_reset 		: in  std_logic;
		EX_enable		: in  std_logic;
		EX_OpA		: in  std_logic_vector(NBIT_DATA-1 downto 0);
		EX_OpB		: in  std_logic_vector(NBIT_DATA-1 downto 0);
		EX_Opcode		: in  std_logic_vector(5 downto 0);
		EX_ShiftAmount	: in  std_logic_vector(NBIT_BS_AMOUNT-1 downto 0);
		EX_sel_mux_out	: in  std_logic_vector(1 downto 0);	
		EX_data_out	: out std_logic_vector(NBIT_DATA-1 downto 0);
		EX_PSW		: out std_logic_vector(4 downto 0)
	);
	end component;
	
	component Memory_Stage is
	generic(NBIT_DATA 		: integer := 32;
	        NBIT_ADDRESS 	: integer := 32);
	port(
		ME_data_in	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		ME_address	: in  std_logic_vector(NBIT_ADDRESS-1 downto 0);
		ME_clk		: in  std_logic;
		ME_rst		: in  std_logic; -- 1 active, 0 else
		ME_enable		: in  std_logic; -- 1 active, 0 else
--		ME_RD_wr		: in  std_logic;
		ME_reduce		: in  std_logic;
		ME_BYTE_half	: in  std_logic;
		
		ME_data_to_mem	: out  std_logic_vector(NBIT_DATA-1 downto 0);
		ME_address_to_mem	: out  std_logic_vector(NBIT_ADDRESS-1 downto 0);
--		ME_rst_to_mem	: out  std_logic; -- 1 active, 0 else
--		ME_enable_to_mem	: out  std_logic; -- 1 active, 0 else
--		ME_RD_wr_to_mem	: out  std_logic;
		
		ME_data_from_mem	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		
		ME_data_rd_out	: out std_logic_vector(NBIT_DATA-1 downto 0)
--		ME_data_wr_out	: out std_logic_vector(NBIT_DATA-1 downto 0);
--		ME_RD_wr_out	: out std_logic
	);
	end component;
	
	component WriteBack_Stage is
	generic(NBIT_DATA : integer := 32);
	port(
		WB_OpA		: in  std_logic_vector(NBIT_DATA-1 downto 0);
		WB_OpB		: in  std_logic_vector(NBIT_DATA-1 downto 0);
		WB_sel		: in  std_logic;
		WB_reduce		: in  std_logic;
		WB_BYTE_half 	: in  std_logic;
		WB_SGN_usg	: in  std_logic;
		WB_out		: out std_logic_vector(NBIT_DATA-1 downto 0)
	);
	end component;
	
	component FCU is
	port(
		FCU_enable			: in  std_logic;
		
		FCU_IF_ID_Op		: in  std_logic_vector(5 downto 0);
		FCU_ID_EX_Op		: in  std_logic_vector(5 downto 0);
		FCU_EX_MEM_Op		: in  std_logic_vector(5 downto 0);
		FCU_MEM_WB_Op  	: in  std_logic_vector(5 downto 0);
		
		FCU_IF_ID_6_10		: in  std_logic_vector(4 downto 0);
		FCU_IF_ID_11_15	: in  std_logic_vector(4 downto 0);
		
		FCU_ID_EX_6_10		: in  std_logic_vector(4 downto 0);
		FCU_ID_EX_11_15	: in  std_logic_vector(4 downto 0);
		FCU_ID_EX_16_20	: in  std_logic_vector(4 downto 0);
		
		FCU_EX_MEM_11_15	: in  std_logic_vector(4 downto 0);
		FCU_EX_MEM_16_20	: in  std_logic_vector(4 downto 0);
		
		FCU_MEM_WB_11_15	: in  std_logic_vector(4 downto 0);
		FCU_MEM_WB_16_20	: in  std_logic_vector(4 downto 0);
		
		FCU_IF_ID_MUX		: out std_logic_vector(1 downto 0);
		
		FCU_ID_EX_TOP_MUX	: out std_logic_vector(1 downto 0);
		FCU_ID_EX_BOT_MUX : out std_logic_vector(1 downto 0);
		
		FCU_EX_MEM_MUX		: out std_logic;
		
		FCU_IF_ID_is_branch	: out std_logic;
		FCU_ID_EX_is_branch_or_jmp : out std_logic;
		FCU_insert_stall	: out std_logic
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
	
	component Reg1Bit is
	port(
		clk:	in  std_logic;
		reset:	in  std_logic; --Active high
		data_in:	in  std_logic;
		enable:	in  std_logic;
		load:	in  std_logic; --Load enable high
		data_out: out std_logic);
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
	
	constant L : integer := log2(NBIT_DATA);
	
	signal s_PC_Fif					: std_logic_vector(2**NBIT_IRAM_ADDR-1 downto 0);
	signal s_NPC_Fif					: std_logic_vector(2**NBIT_IRAM_ADDR-1 downto 0);
	signal s_IR_Fif					: std_logic_vector(31 downto 0);
	signal s_stall_Fif				: std_logic;
	signal s_PC_Tde					: std_logic_vector(2**NBIT_IRAM_ADDR-1 downto 0);
	signal s_NPC_Tde					: std_logic_vector(2**NBIT_IRAM_ADDR-1 downto 0);
	signal s_IR_Fde					: std_logic_vector(31 downto 0);
	signal s_stall_Fde				: std_logic;
	signal s_PC_Tex					: std_logic_vector(2**NBIT_IRAM_ADDR-1 downto 0);
	signal s_IR_Fex					: std_logic_vector(31 downto 0);
	signal s_stall_Fex				: std_logic;
	signal s_IR_Fmem					: std_logic_vector(31 downto 0);
	signal s_stall_Fmem				: std_logic;
	signal s_branch_taken_Fde_Tif	: std_logic;
	signal s_newPC_Fde_Tif			: std_logic_vector(2**NBIT_IRAM_ADDR-1 downto 0);
	signal s_regA_Fde_Tex			: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_regB_Fde_Tex			: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_regI_Fde_Tex			: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_sel_regA_PC_mux 		: std_logic;
	signal s_opA_Fmux_Tfrw_mux		: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_opB_Fmux_Tfrw_mux		: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_data_fwd_top_alu1		: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_data_fwd_top_alu2		: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_data_fwd_top_aluY		: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_data_fwd_bot_alu1		: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_data_fwd_bot_alu2		: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_data_fwd_bot_aluY		: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_opA_Fmux_Tex			: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_opB_Fmux_Tex			: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_NBIT_DATA_div_2		: std_logic_vector(L-1 downto 0) := (L-1 => '1', others => '0');
	signal s_SA_Fmux_Tmux1			: std_logic_vector(L-1 downto 0);
	signal s_SA_Fmux_Tmux2			: std_logic_vector(L-1 downto 0);
	signal s_SA_Fmux_Tex				: std_logic_vector(L-1 downto 0);
	signal s_result_Fex_Tmem		: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_PSW						: std_logic_vector(4 downto 0);
	signal s_dataTBStr_Freg_Tmux	: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_data_TBStr_Fmux_Tex	: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_data_Fmem_Twb			: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_bypass_data_Freg_Twb	: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_load_data_Fmem_Twb	: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_data_Fwb_Tde			: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_if_id_sel_fwx_mux		: std_logic_vector(1 downto 0);
	signal s_id_ex_sel_fwd_top_mux: std_logic_vector(1 downto 0);
	signal s_id_ex_sel_fwd_bot_mux: std_logic_vector(1 downto 0);
	signal s_ex_mem_fwd_mux			: std_logic;
	signal s_stall						: std_logic;
	signal s_reset_middle_regs		: std_logic;
	signal s_ex_enable				: std_logic;
	signal s_enable_if				: std_logic;
	signal s_enable_de				: std_logic;
	signal s_enable_ex				: std_logic;
	signal s_enable_mem				: std_logic;
	signal s_enable_wb				: std_logic;
	signal s_fcu_enable				: std_logic;
	signal s_jmp_or_brnch_Ffcu_Tde: std_logic;
	signal s_use_immediate			: std_logic;
	
begin

	IF_Stage	: Fetch GENERIC MAP (NBIT_PC => 2**NBIT_IRAM_ADDR, NBIT_IR => 32) PORT MAP (
		FE_clk 							=> DP_clk,
		FE_rst 							=> DP_reset,
		FE_enable 						=> DP_enable,
		FE_PC_enable					=> s_stall,	--from FCU
		FE_PC_clear						=> DP_reset,
		FE_IR_enable					=> s_stall,	--from FCU
		FE_IR_clear						=> DP_reset,
		FE_btb_target_prediction 	=> DP_btb_target_prediction,	--from BTB
		FE_btb_prediction				=> DP_btb_prediction,			--from BTB
		FE_branch_taken				=> s_branch_taken_Fde_Tif,	--from decode
		FE_new_PC_from_DE				=> s_newPC_Fde_Tif,	--from decode
		FE_IR_in							=> DP_IR,	--from IRAM
		FE_IR_out						=> s_IR_Fif,		--to FCU and reg
		FE_PC								=> s_PC_Fif, -- to IRAM, BTB and inside DP
		FE_NPC							=> s_NPC_Fif --to inside DP
		);	
	DP_PC <= s_PC_Fif;
	
	PC_IF_ID_REG : NRegister GENERIC MAP (N => 2**NBIT_IRAM_ADDR) PORT MAP (
		clk => DP_clk,
		reset=> DP_reset,
		data_in=> s_PC_Fif,
		enable=> s_stall,	--from FCU stall
		load=> '1',
		data_out=> s_PC_Tde
		);
		
	NPC_IF_ID_REG : NRegister GENERIC MAP (N => 2**NBIT_IRAM_ADDR) PORT MAP (
		clk => DP_clk,
		reset=> DP_reset,
		data_in=> s_NPC_Fif,
		enable=> s_stall, --from FCU stall
		load=> '1',
		data_out=> s_NPC_Tde
		);
		
--	IR_IF_ID_REG : NRegister GENERIC MAP (N => 32) PORT MAP (
--		clk => DP_clk,
--		reset=> DP_reset,
--		data_in=> ,
--		enable=> DP_enable,
--		load=> ,
--		data_out=> 
--		);
	
	stall_IF_ID_REG : Reg1Bit  PORT MAP (
		clk => DP_clk,
		reset=> DP_reset,
		data_in=> s_stall,
		enable=> DP_enable, --from FCU stall
		load=> '1',
		data_out=> s_stall_Fif
		);
	
	DP_IR_opcode <= DP_IR(31 downto 26);
	DP_IR_func <= DP_IR(10 downto 0);
	
	DE_Stage : Decode GENERIC MAP (NBIT_PC	=> 2**NBIT_IRAM_ADDR, 
											 NBIT_IR => 32, NBIT_ADDR => 5, NBIT_DATA => NBIT_DATA)  PORT MAP (
		DE_clk 					=> DP_clk,
		DE_reset 				=> DP_reset,
		DE_enable 				=> s_stall, --DP_enable
		DE_IR						=> s_IR_Fif, --from fetch
		DE_PC						=> s_PC_Tde, --from reg IF/ID
		DE_NPC					=> s_NPC_Tde,--from reg IF/ID
		DE_rd1					=> DP_Rd1,
		DE_rd2					=> DP_Rd2,
		DE_wr						=> DP_Wr,
		DE_data_fex				=> s_result_Fex_Tmem,	--from execute
		DE_sel_data_forward 	=> s_if_id_sel_fwx_mux,	--from FCU
		DE_data_Fwb				=> s_data_Fwb_Tde,	--from write back
		DE_signext				=> DP_sign_extender,
		DE_JMP_branch			=> DP_JMP_branch,
		DE_jmp_or_branch		=> s_jmp_or_brnch_Ffcu_Tde,
		DE_save_PC				=> DP_save_PC,
		DE_branch_taken		=> s_branch_taken_Fde_Tif,	--to fetch & BTB
		DE_new_PC				=> s_newPC_Fde_Tif,	--to fetch & BTB
		DE_imm_address			=> DP_target,
		DE_RegA					=> s_regA_Fde_Tex,	--to muxes id/ex
		DE_RegB					=> s_regB_Fde_Tex,	--to muxes id/ex
		DE_RegI					=> s_regI_Fde_Tex	--to muxes id/ex
		);
	DP_branch_taken <= s_branch_taken_Fde_Tif;
	DP_new_PC 		 <= s_newPC_Fde_Tif;
	s_reset_middle_regs <= s_branch_taken_Fde_Tif OR DP_reset;
	
	stall_ID_EX_REG : Reg1Bit  PORT MAP (
		clk => DP_clk,
		reset=> s_reset_middle_regs,
		data_in=> s_stall_Fif,
		enable=> DP_enable, --from FCU stall
		load=> '1',
		data_out=> s_stall_Fde
		);
	
	PC_ID_EX_REG : NRegister GENERIC MAP (N => 2**NBIT_IRAM_ADDR) PORT MAP (
		clk => DP_clk,
		reset=> s_reset_middle_regs,
		data_in=> s_PC_Tde,
		enable=> s_stall_Fif,	--from FCU stall (or s_stall_Fde)
		load=> '1',
		data_out=> s_PC_Tex
		);
		
	IR_ID_EX_REG : NRegister GENERIC MAP (N => 32) PORT MAP (
		clk => DP_clk,
		reset=> s_reset_middle_regs,
		data_in=> s_IR_Fif,
		enable=> s_stall_Fif, --from FCU stall (or s_stall_Fde)
		load=> '1',
		data_out=> s_IR_Fde
		);
	
	s_sel_regA_PC_mux <=  DP_Shift_Amount_sel(1) AND DP_Shift_Amount_sel(0);
	RegA_PC_MUX : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) PORT MAP (
		port0 => s_regA_Fde_Tex,
		port1 => s_PC_Tex(NBIT_DATA-1 downto 0), --just NBIT_DATA least significant bits
		sel   => s_sel_regA_PC_mux,
		portY => s_opA_Fmux_Tfrw_mux
		);
	
	REGB_IMM_SEL_REG : Reg1Bit PORT MAP (
		clk => DP_clk,
		reset=> s_reset_middle_regs,
		data_in=> DP_use_immediate,
		enable=> s_stall_Fif, --from FCU stall (or s_stall_Fde)
		load=> '1',
		data_out=> s_use_immediate
		);
	
	RegB_Imm_MUX : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) PORT MAP (
		port0 => s_regB_Fde_Tex,
		port1 => s_regI_Fde_Tex,
		sel   => s_use_immediate,
		portY => s_opB_Fmux_Tfrw_mux
		);
	
	
	REG_EX_MEM_TOP_MUX : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) PORT MAP (
		port0 => s_opA_Fmux_Tfrw_mux,
		port1 => s_result_Fex_Tmem, --from ex/mem
		sel   => s_id_ex_sel_fwd_top_mux(0), --from FCU
		portY => s_data_fwd_top_alu1
		);
		
	MEM_WB_NULL_TOP_MUX : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) PORT MAP (
		port0 => s_data_Fwb_Tde, --from mem/wb
		port1 => (others => '0'),
		sel   => s_id_ex_sel_fwd_top_mux(0), --from FCU
		portY => s_data_fwd_top_alu2
		);
		
	FWD_TOP_MUX : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) PORT MAP (
		port0 => s_data_fwd_top_alu1,
		port1 => s_data_fwd_top_alu2,
		sel   => s_id_ex_sel_fwd_top_mux(1), --from FCU
		portY => s_data_fwd_top_aluY
		);
	
	REG_EX_MEM_BOT_MUX : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) PORT MAP (
		port0 => s_opB_Fmux_Tfrw_mux,
		port1 => s_result_Fex_Tmem, --from ex/mem
		sel   => s_id_ex_sel_fwd_bot_mux(0), --from FCU
		portY => s_data_fwd_bot_alu1
		);
		
	MEM_WB_NULL_BOT_MUX : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) PORT MAP (
		port0 => s_data_Fwb_Tde, --from mem/wb
		port1 => (others => '0'),
		sel   => s_id_ex_sel_fwd_bot_mux(0), --from FCU
		portY => s_data_fwd_bot_alu2
		);
		
	FWD_BOT_MUX : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) PORT MAP (
		port0 => s_data_fwd_bot_alu1,
		port1 => s_data_fwd_bot_alu2,
		sel   => s_id_ex_sel_fwd_bot_mux(1), --from FCU
		portY => s_data_fwd_bot_aluY
		);
	
	REVERSE_TOP_MUX : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) PORT MAP (
		port0 => s_data_fwd_top_aluY, --from FWD_TOP_MUX
		port1 => s_data_fwd_bot_aluY, --from FWD_BOT_MUX
		sel   => DP_reverse_operands, 
		portY => s_opA_Fmux_Tex	--to execute
		);
	
	REVERSE_BOT_MUX : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) PORT MAP (
		port0 => s_data_fwd_bot_aluY, --from FWD_BOT_MUX
		port1 => s_data_fwd_top_aluY, --from FWD_TOP_MUX
		sel   => DP_reverse_operands, 
		portY => s_opB_Fmux_Tex --to execute
		);
	
	SHIFT_AMOUNT_MUX1 : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => L) PORT MAP (
		port0 => (others => '0'),
		port1 => s_NBIT_DATA_div_2,
		sel   => DP_Shift_Amount_sel(0), 
		portY => s_SA_Fmux_Tmux1
		);
	
	SHIFT_AMOUNT_MUX2 : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => L) PORT MAP (
		port0 => s_data_fwd_bot_aluY(L-1 downto 0),
		port1 => (others => '0'),
		sel   => DP_Shift_Amount_sel(0), 
		portY => s_SA_Fmux_Tmux2
		);
	
	SHIFT_AMOUNT_MUX3 : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => L) PORT MAP (
		port0 => s_SA_Fmux_Tmux1,
		port1 => s_SA_Fmux_Tmux2,
		sel   => DP_Shift_Amount_sel(1), 
		portY => s_SA_Fmux_Tex -- to execute
		);
	
	s_ex_enable <= DP_enable AND DP_EX_enable;
	
	EX_Stage : Execute_Stage GENERIC MAP (NBIT_DATA => NBIT_DATA, NBIT_BS_AMOUNT => L) PORT MAP (
		EX_clk 			=> DP_clk,
		EX_reset 		=> DP_reset,
		EX_enable		=> s_ex_enable,
		EX_OpA			=> s_opA_Fmux_Tex, --from reverse mux
		EX_OpB			=> s_opB_Fmux_Tex, --from reverse mux
		EX_Opcode		=> DP_ALU_Opcode,
		EX_ShiftAmount	=> s_SA_Fmux_Tex, --from shift amount mux
		EX_sel_mux_out	=> DP_UUW_sel,
		EX_data_out		=> s_result_Fex_Tmem, --to fwd mux & MEM
		EX_PSW			=> s_PSW
		);
		
	stall_EX_MEM_REG : Reg1Bit  PORT MAP (
		clk => DP_clk,
		reset=> s_reset_middle_regs,
		data_in=> s_stall_Fde,
		enable=> DP_enable, --from FCU stall
		load=> '1',
		data_out=> s_stall_Fex
		);
	
	IR_EX_MEM_REG : NRegister GENERIC MAP (N => 32) PORT MAP (
		clk => DP_clk,
		reset=> s_reset_middle_regs,
		data_in=> s_IR_Fde,
		enable=> s_stall_Fde, --from FCU stall (or s_stall_Fex)
		load=> '1',
		data_out=> s_IR_Fex
		);
	
	OPB_TO_DRAM_REG : NRegister GENERIC MAP (N => NBIT_DATA) PORT MAP (
		clk => DP_clk,
		reset=> s_reset_middle_regs,
		data_in=> s_data_fwd_bot_aluY, --from fwd bot mux
		enable=> s_stall_Fde, --from FCU stall (or s_stall_Fex)
		load=> '1',
		data_out=> s_dataTBStr_Freg_Tmux --to mux DRAM data to be stored
		);
	
	DATA_TB_STORED_MUX : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) PORT MAP (
		port0 => s_dataTBStr_Freg_Tmux, --from OPB_TO_DRAM_REG
		port1 => s_data_Fwb_Tde, --from writeback forworded
		sel   => s_ex_mem_fwd_mux, --from FCU
		portY => s_data_TBStr_Fmux_Tex  -- to memory
		);
		
	MEM_Stage : Memory_Stage GENERIC MAP (NBIT_DATA => NBIT_DATA, NBIT_ADDRESS => NBIT_DATA) PORT MAP (
		ME_data_in			=> s_data_TBStr_Fmux_Tex, --from register
		ME_address			=> s_result_Fex_Tmem,	  --from execute
		ME_clk				=> DP_clk,
		ME_rst				=> DP_reset,
		ME_enable			=> DP_enable,
--		ME_RD_wr				=> DP_DRAM_RD_wr,
		ME_reduce			=> DP_Store_reduce,
		ME_BYTE_half		=> DP_Store_BYTE_half,
		
		ME_data_to_mem		=> DP_data_to_DRAM,
		ME_address_to_mem	=> DP_address_to_DRAM,
--		ME_rst_to_mem		=> ,
--		ME_enable_to_mem	=> ,
--		ME_RD_wr_to_mem	=> ,
		
		ME_data_from_mem	=> DP_Load_data_from_DRAM,
		
		ME_data_rd_out		=> s_data_Fmem_Twb --to writeback
--		ME_data_wr_out		=> ,
--		ME_RD_wr_out		=> 
		);
	
	stall_MEM_WB_REG : Reg1Bit  PORT MAP (
		clk => DP_clk,
		reset=> s_reset_middle_regs,
		data_in=> s_stall_Fex,
		enable=> DP_enable, --from FCU stall
		load=> '1',
		data_out=> s_stall_Fmem
		);
	
	DATA_BYPASS_REG : NRegister GENERIC MAP (N => NBIT_DATA) PORT MAP (
		clk => DP_clk,
		reset=> s_reset_middle_regs,
		data_in=> s_result_Fex_Tmem, --from execute
		enable=> s_stall_Fex, --from FCU (or s_stall_Fmem)
		load=> '1',
		data_out=>  s_bypass_data_Freg_Twb --to write back
		);
	
	IR_MEM_WB_REG : NRegister GENERIC MAP (N => 32) PORT MAP (
		clk => DP_clk,
		reset=> s_reset_middle_regs,
		data_in=> s_IR_Fex,
		enable=> s_stall_Fex, --from FCU (or s_stall_Fmem)
		load=> '1',
		data_out=> s_IR_Fmem
		);
		
	WB_Stage : WriteBack_Stage GENERIC MAP (NBIT_DATA => NBIT_DATA) PORT MAP (
		WB_OpA			=> s_bypass_data_Freg_Twb, --from bypassing register
		WB_OpB			=> s_load_data_Fmem_Twb,	--from memory
		WB_sel			=> DP_WB_sel,
		WB_reduce		=> DP_Load_reduce,
		WB_BYTE_half	=> DP_Load_BYTE_half,
		WB_SGN_usg		=> DP_Load_SGN_usg_reduce,
		WB_out			=> s_data_Fwb_Tde
		);
---------------------------Registri aggiunti 27/06	
--	REG_EN_IF : Reg1Bit  PORT MAP (
--		clk => DP_clk,
--		reset=> s_reset_middle_regs,
--		data_in=> s_fcu_enable,
--		enable=> s_ex_enable, 
--		load=> '1',
--		data_out=> s_enable_if
--		);
--	
--	REG_EN_ID : Reg1Bit  PORT MAP (
--		clk => DP_clk,
--		reset=> s_reset_middle_regs,
--		data_in=> s_enable_if,
--		enable=> s_ex_enable, 
--		load=> '1',
--		data_out=> s_enable_de
--		);
--	
--	 REG_EN_EX : Reg1Bit  PORT MAP (
--		clk => DP_clk,
--		reset=> s_reset_middle_regs,
--		data_in=> s_enable_de,
--		enable=> s_ex_enable, 
--		load=> '1',
--		data_out=> s_enable_ex
--		);
--	
--	 REG_EN_MEM : Reg1Bit  PORT MAP (
--		clk => DP_clk,
--		reset=> s_reset_middle_regs,
--		data_in=> s_enable_ex,
--		enable=> s_ex_enable, 
--		load=> '1',
--		data_out=> s_enable_mem
--		);
--		
--	REG_EN_WB : Reg1Bit  PORT MAP (
--		clk => DP_clk,
--		reset=> s_reset_middle_regs,
--		data_in=> s_enable_mem,
--		enable=> s_ex_enable, 
--		load=> '1',
--		data_out=> s_enable_wb
--		);
	
	s_fcu_enable <= DP_enable AND NOT (DP_reset);
	
	FRW_CU	: FCU PORT MAP (
		FCU_enable			=> s_fcu_enable,
		
		FCU_IF_ID_Op		=> s_IR_Fif(31 downto 26),
		FCU_ID_EX_Op		=> s_IR_Fde(31 downto 26),
		FCU_EX_MEM_Op		=> s_IR_Fex(31 downto 26),
		FCU_MEM_WB_Op  	=> s_IR_Fmem(31 downto 26),
		
		FCU_IF_ID_6_10		=> s_IR_Fif(25 downto 21),
		FCU_IF_ID_11_15	=> s_IR_Fif(20 downto 16),
		
		FCU_ID_EX_6_10		=> s_IR_Fde(25 downto 21),
		FCU_ID_EX_11_15	=> s_IR_Fde(20 downto 16),
		FCU_ID_EX_16_20	=> s_IR_Fde(15 downto 11),
		
		FCU_EX_MEM_11_15	=> s_IR_Fex(20 downto 16),
		FCU_EX_MEM_16_20	=> s_IR_Fex(15 downto 11),
		
		FCU_MEM_WB_11_15	=> s_IR_Fmem(20 downto 16),
		FCU_MEM_WB_16_20	=> s_IR_Fmem(15 downto 11),
		
		FCU_IF_ID_MUX		=> s_if_id_sel_fwx_mux, --to decode
		
		FCU_ID_EX_TOP_MUX	=> s_id_ex_sel_fwd_top_mux, --to id/ex
		FCU_ID_EX_BOT_MUX => s_id_ex_sel_fwd_bot_mux, --to id/ex
		
		FCU_EX_MEM_MUX		=> s_ex_mem_fwd_mux,
		FCU_IF_ID_is_branch	=> DP_IF_ID_instr_is_branch,
		FCU_ID_EX_is_branch_or_jmp => s_jmp_or_brnch_Ffcu_Tde,
		FCU_insert_stall	=> s_stall
		);
		
	DP_insert_bubble <= s_stall;

end Structural;

