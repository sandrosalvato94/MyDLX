----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Alessandro Salvato
-- 
-- Create Date:    11:45:54 10/04/2017 
-- Design Name: 
-- Module Name:    Fetch - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision 0.4 
-- Additional Comments:
--	Version 0.1 : All main components laid out and tied up together. FE_NPC
--		    pins are left floating.
--	Version 0.2 : Connected FE_NPC. Changed s_pc/ir/npc_enable/rst boolean
--		    expression. Performed T1, T2
--	Version 0.3 : Deleted NPC as register.
--	Version 0.4 : Changed pinout adding FE_new_PC_from_DE. A new adder to 
--		    perform BTB_target_prediction + PC + 4  is introduced.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Fetch is
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
		FE_next_instr_is_branch : in std_logic;
		FE_next_instr_is_jump : in std_logic;
		FE_new_PC_from_DE		: in  std_logic_vector(NBIT_PC-1 downto 0);
		FE_IR_in			: in  std_logic_vector(NBIT_IR-1 downto 0);
		FE_IR_out			: out std_logic_vector(NBIT_IR-1 downto 0);
		FE_PC			: out std_logic_vector(NBIT_PC-1 downto 0);
		FE_NPC			: out std_logic_vector(NBIT_PC-1 downto 0)
		
	);
end Fetch;

architecture Structural of Fetch is

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
	
	component PropagateCarryLookahead is
	generic(N : integer := 32);
	port(
		A	: in  std_logic_vector(N-1 downto 0);
		B	: in  std_logic_vector(N-1 downto 0);
		Cin	: in  std_logic;
		Sum 	: out std_logic_vector(N-1 downto 0);
		Cout 	: out std_logic
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
	
	constant INC 			: std_logic_vector(NBIT_PC-1 downto 0) := std_logic_vector(to_unsigned(4, NBIT_PC));
	
	signal s_pc_rst, s_pc_enable 		: std_logic;
	signal s_ir_rst, s_ir_enable  	: std_logic;
	signal s_npc_rst, s_npc_enable 	: std_logic;
	signal s_npc_Fnpc_Tpc 		: std_logic_vector(NBIT_PC-1 downto 0);
	signal s_outputPC			: std_logic_vector(NBIT_PC-1 downto 0);
	signal s_sum_Fcla_Tnpcreg		: std_logic_vector(NBIT_PC-1 downto 0);
	signal s_target_Fbtbmux_Tnpcmux	: std_logic_vector(NBIT_PC-1 downto 0);		
	signal s_npcvalue_Fnpcmux_Tnpc	: std_logic_vector(NBIT_PC-1 downto 0);
	signal s_Faddbtb_Tmuxbtb		: std_logic_vector(NBIT_PC-1 downto 0);
	signal s_tmp_pc					: std_logic_vector(NBIT_PC-1 downto 0);
	signal s_restored_pc				: std_logic_vector(NBIT_PC-1 downto 0);
	signal s_inc_sel					: std_logic;
	signal s_tmp						: std_logic_vector(NBIT_PC-1 downto 0);
	signal s_btb_prediction			: std_logic;
	signal s_jmp						: std_logic; --active high
	signal s_restore					: std_logic; --active high

begin
-----------------------------------------------------------------------------------------
	s_pc_rst <= FE_rst OR FE_PC_clear;
	s_pc_enable <= FE_enable AND FE_PC_enable;

	PC : NRegister GENERIC MAP (N => NBIT_PC) PORT MAP (
						clk => FE_clk,
						reset => s_pc_rst,
						data_in => s_npcvalue_Fnpcmux_Tnpc,
						enable => s_pc_enable,
						load => '1',
						data_out => s_outputPC
						);
	FE_PC <= s_outputPC;
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
	s_ir_rst <= FE_rst OR FE_IR_clear;
	s_ir_enable <= FE_enable AND FE_IR_enable;
	
	IR : NRegister GENERIC MAP (N => NBIT_IR) PORT MAP (
						clk => FE_clk,
						reset => s_ir_rst,
						data_in => FE_IR_in,
						enable => s_ir_enable,
						load => '1',
						data_out => FE_IR_out
						);
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
	s_inc_sel <= FE_enable AND NOT(FE_rst);
	
	MUXN_INC : Mux_NBit_2x1 GENERIC MAP(NBIT_IN => NBIT_PC) PORT MAP (
							port0 => (others => '0'),
							port1 => INC,
							sel => s_inc_sel,
							portY => s_tmp
							);
	
	ADDPC : PropagateCarryLookahead GENERIC MAP (N=>NBIT_PC) PORT MAP (
							A => s_outputPC,
							B => s_tmp,
							Cin => '0',
							--Cout => , -- not useful in this prototype
							Sum => s_sum_Fcla_Tnpcreg
							);
	Restore_PC : NRegister GENERIC MAP (N => NBIT_PC) PORT MAP (
						clk => FE_clk,
						reset => s_pc_rst,
						data_in => s_sum_Fcla_Tnpcreg,
						enable => s_pc_enable,
						load => '1',
						data_out => s_restored_pc
						);
--	ADDBTB : PropagateCarryLookahead GENERIC MAP (N=>NBIT_PC) PORT MAP (
--							A => FE_btb_target_prediction,
--							B => s_sum_Fcla_Tnpcreg,
--							Cin => '0',
--							--Cout => , -- not useful in this prototype
--							Sum =>s_Faddbtb_Tmuxbtb							);
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
	
-----------------------------------------------------------------------------------------
	MUXBTB : Mux_NBit_2x1 GENERIC MAP(NBIT_IN => NBIT_PC) PORT MAP (
							port0 => s_sum_Fcla_Tnpcreg,
							port1 => FE_btb_target_prediction,
							sel => FE_btb_prediction,
							portY => s_target_Fbtbmux_Tnpcmux
							);
	
	BTB_prediction_reg : Reg1Bit port map(
		clk		=> FE_clk,
		reset		=> s_pc_rst,
		data_in	=> FE_btb_prediction,
		enable	=> s_pc_enable,
		load		=> '1',
		data_out => s_btb_prediction
	);
	
	s_jmp <= ((FE_next_instr_is_jump AND NOT(FE_next_instr_is_branch)) OR (FE_next_instr_is_jump AND NOT(s_btb_prediction) AND FE_branch_taken)) AND FE_branch_taken; 
	s_restore <= FE_next_instr_is_jump AND FE_next_instr_is_branch AND s_btb_prediction AND NOT(FE_branch_taken);
	
	MUXNPC : Mux_NBit_2x1 GENERIC MAP(NBIT_IN => NBIT_PC) PORT MAP (
							port0 => s_target_Fbtbmux_Tnpcmux,
							port1 => FE_new_PC_from_DE,
							sel => s_jmp,
							portY => s_tmp_pc
							);
	
	MUX_restore : Mux_NBit_2x1 GENERIC MAP(NBIT_IN => NBIT_PC) PORT MAP (
							port0 => s_tmp_pc,
							port1 => s_restored_pc,
							sel => s_restore,
							portY => s_npcvalue_Fnpcmux_Tnpc
							);
-----------------------------------------------------------------------------------------
--	MUXBTB : Mux_NBit_2x1 GENERIC MAP(NBIT_IN => NBIT_PC) PORT MAP (
--							port0 => FE_new_PC_from_DE,
--							port1 => FE_btb_target_prediction,
--							sel => FE_btb_prediction,
--							portY => s_target_Fbtbmux_Tnpcmux
--							);
--	
--	
--	MUXNPC : Mux_NBit_2x1 GENERIC MAP(NBIT_IN => NBIT_PC) PORT MAP (
--							port0 => s_sum_Fcla_Tnpcreg,
--							port1 => s_target_Fbtbmux_Tnpcmux,
--							sel => FE_branch_taken,
--							portY => s_npcvalue_Fnpcmux_Tnpc
--							);
	FE_NPC <= s_npcvalue_Fnpcmux_Tnpc;
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
--	s_npc_rst <= FE_rst OR FE_PC_clear;
--	s_npc_enable <= FE_enable AND FE_PC_enable;
--	
--	NPC : NRegister GENERIC MAP (N => NBIT_PC) PORT MAP (
--						clk => FE_clk,
--						reset => s_npc_rst,
--						data_in => s_npcvalue_Fnpcmux_Tnpc,
--						enable => s_npc_enable,
--						load => '1',
--						data_out => s_npc_Fnpc_Tpc
--						);
--	FE_NPC <= s_npc_Fnpc_Tpc;
-----------------------------------------------------------------------------------------
end Structural;

