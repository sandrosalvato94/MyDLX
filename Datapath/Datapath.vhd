----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:34:26 06/20/2018 
-- Design Name: 
-- Module Name:    Datapath - Behavioral 
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
		DP_IR								: in  std_logic(31 downto 0);
		
		DP_Rd1							: in  std_logic;
		DP_Rd2							: in  std_logic;
		DP_Wr								: in  std_logic;
		DP_JMP_branch					: in  std_logic_vector(1 downto 0);
		DP_sign_extender				: in  std_logic_vector(1 downto 0);
		
		DP_Shift_Amount_sel			: in  std_logic_vector(1 downto 0);
		DP_use_immediate				: in  std_logic;
		
		DP_PC								: out std_logic_vector(2**NBIT_IRAM_ADDR-1 downto 0);
		
		DP_branch_taken				: out std_logic;
		DP_new_PC						: out std_logic_vector(2**NBIT_IRAM_ADDR-1 downto 0);
	);
end Datapath;

architecture Behavioral of Datapath is

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
		DE_branch_taken	: out std_logic;
		DE_new_PC		: out std_logic_vector(NBIT_PC-1 downto 0);
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
		EX_PSW		: out std_logic_vector(4 downto 0);
		EX_AluOutBack	: out std_logic_vector(NBIT_DATA-1 downto 0)
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
		ME_RD_wr		: in  std_logic;
		ME_reduce		: in  std_logic;
		ME_BYTE_half	: in  std_logic;
		
		ME_data_to_mem	: out  std_logic_vector(NBIT_DATA-1 downto 0);
		ME_address_to_mem	: out  std_logic_vector(NBIT_ADDRESS-1 downto 0);
		ME_rst_to_mem	: out  std_logic; -- 1 active, 0 else
		ME_enable_to_mem	: out  std_logic; -- 1 active, 0 else
		ME_RD_wr_to_mem	: out  std_logic;
		
		ME_data_from_mem	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		
		ME_data_rd_out	: out std_logic_vector(NBIT_DATA-1 downto 0);
		ME_data_wr_out	: out std_logic_vector(NBIT_DATA-1 downto 0);
		ME_RD_wr_out	: out std_logic
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
	
	component Mux_NBit_2x1 is
	generic(NBIT_IN: integer := 32);
	port(
		port0	: in  std_logic_vector(NBIT_IN-1 downto 0);
		port1	: in  std_logic_vector(NBIT_IN-1 downto 0);
		sel	: in  std_logic;
		portY	: out std_logic_vector(NBIT_IN-1 downto 0)
	);
	end component;

	signal s_PC_Fif					: std_logic_vector(2**NBIT_IRAM_ADDR-1 downto 0);
	signal s_NPC_Fif					: std_logic_vector(2**NBIT_IRAM_ADDR-1 downto 0);
	signal s_IR_Fif					: std_logic_vector(31 downto 0);
	signal s_IR_Fde					: std_logic_vector(31 downto 0);
	signal s_PC_Tde					: std_logic_vector(2**NBIT_IRAM_ADDR-1 downto 0);
	signal s_NPC_Tde					: std_logic_vector(2**NBIT_IRAM_ADDR-1 downto 0);
	signal s_PC_Tex					: std_logic_vector(2**NBIT_IRAM_ADDR-1 downto 0);
	signal s_branch_taken_Fde_Tif	: std_logic;
	signal s_newPC_Fde_Tif			: std_logic_vector(2**NBIT_IRAM_ADDR-1 downto 0);
	signal s_regA_Fde_Tex			: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_regB_Fde_Tex			: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_regI_Fde_Tex			: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_sel_regA_PC_mux 		: std_logic;
	signal s_opA_Fmux_Tfrw_mux		: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_opB_Fmux_Tfrw_mux		: std_logic_vector(NBIT_DATA-1 downto 0);
	
begin

	IF_Stage	: Fetch GENERIC MAP (NBIT_PC => 2**NBIT_IRAM_ADDR, NBIT_IR => 32) PORT MAP (
		FE_clk 							=> DP_clk,
		FE_rst 							=> DP_reset,
		FE_enable 						=> DP_enable,
		FE_PC_enable					=> ,	--from FCU
		FE_PC_clear						=> DP_reset,
		FE_IR_enable					=> ,	--from FCU
		FE_IR_clear						=> DP_reset,
		FE_btb_target_prediction 	=> DP_btb_target_prediction,	--from BTB
		FE_btb_prediction				=> DP_btb_prediction,			--from BTB
		FE_branch_taken				=> ,	--from decode
		FE_new_PC_from_DE				=> ,	--from decode
		FE_IR_in							=> DP_IR,	--from IRAM
		FE_IR_out						=> s_IR_Fif,		--to FCU and reg
		FE_PC								=> s_PC_Fif, -- to IRAM, BTB and inside DP
		FE_NPC							=> s_NPC_Fif --to inside DP
		);	
	DE_PC <= s_PC_Fif;
	
	PC_IF_ID_REG : NRegister GENERIC MAP (N => 2**NBIT_IRAM_ADDR) PORT MAP (
		clk => DP_clk,
		reset=> DP_reset,
		data_in=> s_PC_Fif,
		enable=> ,	--from FCU stall
		load=> '1',
		data_out=> s_PC_Tde
		);
		
	NPC_IF_ID_REG : NRegister GENERIC MAP (N => 2**NBIT_IRAM_ADDR) PORT MAP (
		clk => DP_clk,
		reset=> DP_reset,
		data_in=> s_NPC_Fif,
		enable=> , --from FCU stall
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
	
	DE_Stage : Decode GENERIC MAP (NBIT_PC	=> 2**NBIT_IRAM_ADDR, 
											 NBIT_IR => 32, NBIT_ADDR => 5, NBIT_DATA => NBIT_DATA)  PORT MAP (
		DE_clk 					=> DP_clk,
		DE_reset 				=> DP_reset,
		DE_enable 				=> DP_enable,
		DE_IR						=> s_IR_Fif, --from fetch
		DE_PC						=> s_PC_Tde, --from reg IF/ID
		DE_NPC					=> s_NPC_Tde,--from reg IF/ID
		DE_rd1					=> DP_Rd1,
		DE_rd2					=> DP_Rd2,
		DE_wr						=> DP_Wr,
		DE_data_fex				=> ,	--from execute
		DE_sel_data_forward 	=> ,	--from FCU
		DE_data_Fwb				=> ,	--from write back
		DE_signext				=> DP_sign_extender,
		DE_JMP_branch			=> DP_JMP_branch,
		DE_branch_taken		=> s_branch_taken_Fde_Tif,	--to fetch & BTB
		DE_new_PC				=> s_newPC_Fde_Tif,	--to fetch & BTB
		DE_RegA					=> s_regA_Fde_Tex,	--to muxes id/ex
		DE_RegB					=> s_regB_Fde_Tex,	--to muxes id/ex
		DE_RegI					=> s_regI_Fde_Tex	--to muxes id/ex
		);
	DP_branch_taken <= s_branch_taken_Fde_Tif;
	DP_new_PC 		 <= s_newPC_Fde_Tif;
	
	PC_ID_EX_REG : NRegister GENERIC MAP (N => 2**NBIT_IRAM_ADDR) PORT MAP (
		clk => DP_clk,
		reset=> DP_reset,
		data_in=> s_PC_Tde,
		enable=> ,	--from FCU stall
		load=> '1',
		data_out=> s_PC_Tex
		);
	IR_ID_EX_REG : NRegister GENERIC MAP (N => 32) PORT MAP (
		clk => DP_clk,
		reset=> DP_reset,
		data_in=> s_IR_Fif,
		enable=> , --from FCU stall
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
	
	RegB_Imm_MUX : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) PORT MAP (
		port0 => s_regB_Fde_Tex,
		port1 => s_regI_Fde_Tex,
		sel   => DP_use_immediate,
		portY => s_opB_Fmux_Tfrw_mux
		);
	
	
	
	
	EX_Stage : Execute_Stage GENERIC MAP (NBIT_DATA => , NBIT_BS_AMOUNT =>) PORT MAP (
		EX_clk 		=> ,
		EX_reset 		=> ,
		EX_enable		=> ,
		EX_OpA		=> ,
		EX_OpB		=> ,
		EX_Opcode		=> ,
		EX_ShiftAmount	=> ,
		EX_sel_mux_out	=> ,
		EX_data_out	=> ,
		EX_PSW		=> ,
		EX_AluOutBack	=> 
		);
		
	MEM_Stage : Memory_Stage GENERIC MAP (NBIT_DATA => , NBIT_ADDRESS => ) PORT MAP (
		ME_data_in	=> ,
		ME_address	=> ,
		ME_clk		=> ,
		ME_rst		=> ,
		ME_enable		=> ,
		ME_RD_wr		=> ,
		ME_reduce		=> ,
		ME_BYTE_half	=> ,
		
		ME_data_to_mem	=> ,
		ME_address_to_mem	=> ,
		ME_rst_to_mem	=> ,
		ME_enable_to_mem	=> ,
		ME_RD_wr_to_mem	=> ,
		
		ME_data_from_mem	=> ,
		
		ME_data_rd_out	=> ,
		ME_data_wr_out	=> ,
		ME_RD_wr_out	=> 
		);
		
	WB_Stage : WriteBack_Stage GENERIC MAP (NBIT_DATA => ) PORT MAP (
		WB_OpA		=> ,
		WB_OpB		=> ,
		WB_sel		=> ,
		WB_reduce		=> ,
		WB_BYTE_half 	=> ,
		WB_SGN_usg	=> ,
		WB_out		=> 
		);
	
	FRW_CU	: FCU PORT MAP (
		FCU_enable			=> ,
		
		FCU_IF_ID_Op		=> ,
		FCU_ID_EX_Op		=> ,
		FCU_EX_MEM_Op		=> ,
		FCU_MEM_WB_Op  	=> ,
		
		FCU_IF_ID_6_10		=> ,
		FCU_IF_ID_11_15	=> ,
		
		FCU_ID_EX_6_10		=> ,
		FCU_ID_EX_11_15	=> ,
		FCU_ID_EX_16_20	=> ,
		
		FCU_EX_MEM_11_15	=> ,
		FCU_EX_MEM_16_20	=> ,
		
		FCU_MEM_WB_11_15	=> ,
		FCU_MEM_WB_16_20	=> ,
		
		FCU_IF_ID_MUX		=> ,
		
		FCU_ID_EX_TOP_MUX	=> ,
		FCU_ID_EX_BOT_MUX => ,
		
		FCU_EX_MEM_MUX		=> ,
		
		FCU_insert_stall	=> 
		);
						

end Behavioral;

