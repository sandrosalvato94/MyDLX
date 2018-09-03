----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:45:23 09/03/2018 
-- Design Name: 
-- Module Name:    BTB_misprediction_manager - Structural 
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

entity BTB_misprediction_manager is
	generic(NBIT_PC	: integer := 32);
	port(
		BMM_clk					:	in	 std_logic; 
		BMM_reset				:  in  std_logic;
		BMM_enable				:  in  std_logic;
		BMM_restore				:	in  std_logic;
		BMM_PC					:  in  std_logic_vector(NBIT_PC-1 downto 0);
		BMM_is_branch			:  in  std_logic;
		BMM_branch_taken		:  in  std_logic;
		BMM_PC_BTB				:  out std_logic_vector(NBIT_PC-1 downto 0);
		BMM_is_branch_BTB 	:  out std_logic;
		BMM_branch_taken_BTB	:  out std_logic
	);
end BTB_misprediction_manager;

architecture Structural of BTB_misprediction_manager is

	component Mux_NBit_2x1 is
	generic(NBIT_IN: integer := 32);
	port(
		port0	: in  std_logic_vector(NBIT_IN-1 downto 0);
		port1	: in  std_logic_vector(NBIT_IN-1 downto 0);
		sel	: in  std_logic;
		portY	: out std_logic_vector(NBIT_IN-1 downto 0)
	);
	end component;
	
	component Mux_1Bit_2X1 is
    Port ( port0 : in  STD_LOGIC;
           port1 : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           portY : out  STD_LOGIC);
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
	
	component SAT_Counter is
	generic(N : integer := 2);
	port(
		SAT_clk 		: in  std_logic;
		SAT_reset 	: in  std_logic;
		SAT_enable	: in  std_logic;
		SAT_Ud		: in  std_logic;
		SAT_update	: in  std_logic;
		SAT_setToDef 	: in  std_logic;
		SAT_SO		: out std_logic_vector(N-1 downto 0)
	);
	end component;

	signal s_cnt_out						: std_logic_vector(1 downto 0);
	signal s_pc_Freg_Tmux				: std_logic_vector(NBIT_PC-1 downto 0);
	signal s_is_branch_Freg_Tmux		: std_logic;
	signal s_branch_taken_Freg_Tmux	: std_logic;
	signal s_cnt_out_xored				: std_logic;
	signal s_not_cnt_out_xored			: std_logic;
	signal s_rst							: std_logic;

begin

-----------------------------------------------------------------------------
	s_rst <= BMM_restore OR BMM_reset;
	
	CNT : SAT_Counter	GENERIC MAP (N => 2) PORT MAP (
																	SAT_enable  => BMM_enable,
																	SAT_Ud  => '0',
																	SAT_clk => BMM_clk,
																	SAT_reset => BMM_reset,
																	SAT_update => '1',
																	SAT_setToDef => s_rst,
																	SAT_SO => s_cnt_out
																	);
	
	s_cnt_out_xored <= s_cnt_out(1) XOR s_cnt_out(0);
	s_not_cnt_out_xored <= NOT(s_cnt_out_xored);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------	
	REG_PC : NRegister GENERIC MAP (N => NBIT_PC) PORT MAP (
																	clk		=> BMM_clk,
																	reset		=> BMM_reset,
																	data_in	=> BMM_PC, 
																	enable   =>	s_not_cnt_out_xored,
																	load		=> '1',
																	data_out => s_pc_Freg_Tmux
																	);
	IS_BRANCH_REG : Reg1Bit PORT MAP (
											clk		=> BMM_clk,
											reset		=> BMM_reset,
											data_in	=> BMM_is_branch, 
											enable   =>	s_not_cnt_out_xored,
											load		=> '1',
											data_out => s_is_branch_Freg_Tmux
											);
											
	BRANCH_TAKEN_REG : Reg1Bit PORT MAP (
											clk		=> BMM_clk,
											reset		=> BMM_reset,
											data_in	=> BMM_branch_taken, 
											enable   =>	s_not_cnt_out_xored,
											load		=> '1',
											data_out => s_branch_taken_Freg_Tmux
											);
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
	MUX_PC : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_PC) PORT MAP (
																				port0	=> BMM_PC,
																				port1	=> s_pc_Freg_Tmux, 
																				sel	=> s_cnt_out_xored,
																				portY	=> BMM_PC_BTB
																				);
	MUX_IS_BRANCH : Mux_1Bit_2x1 PORT MAP (
											port0	=> BMM_is_branch,
											port1	=> s_is_branch_Freg_Tmux, 
											sel	=> s_cnt_out_xored,
											portY	=> BMM_is_branch_BTB
											);
											
	MUX_BRANCH_TAKEN : Mux_1Bit_2x1 PORT MAP (
											port0	=> BMM_branch_taken,
											port1	=> s_branch_taken_Freg_Tmux, 
											sel	=> s_cnt_out_xored,
											portY	=> BMM_branch_taken_BTB
											);
-----------------------------------------------------------------------------

end Structural;

