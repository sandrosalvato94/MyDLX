----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:32:47 09/14/2017 
-- Design Name: 
-- Module Name:    BTB - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision 1.0 
-- Additional Comments: 
-- 	Version 0.3 - Solved problems related to simulation. I'm going to
--		    apply an exhaustive testbench.
--	Version 0.4 - Erased s_clk_enb and other minor changes. Components 
--		    directly tied up with BTB_enable. Performed Test 1, 2, 3, 4
--		    5, 6.
--	Version 0.5 - Changed s_update_rotate_reg boolean expression. Needed to 
--		    be modified direction of the output encoder array and 
--		    shifter registers (WRONG BEHAVIOUR).
--	Version 0.6 - Modified direction of the output encoder array. Starting
--		    designing structural saturation counter through JK flip flop.
--        Version 0.7 - New SAT Counters used. Performed Test 1, 2, 3.            
--        Version 0.8 - Changed again SAT Counter architecture. Toggle FF used
--                      rather than JK. All tests passed.
--        Version 1.0 - Synthesis run on Design Vision OK. Performed little changes
--                      as some features of VHDL run on Xilinx ISE but on Design
--                      Vision. Splitted T_FF into T_FF_RST0 and T_FF_RST1, chenged
--                      dataIN signal declarations in RotReg.vhd.
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

entity BTB is
	generic(
		N_ENTRY: 		integer := 32;
		NBIT_ENTRY: 	integer := 32;
		NBIT_TARGET:	integer := 32;
		NBIT_PREDICTION:	integer := 2);
	port(
		BTB_clk:			in std_logic;
		BTB_rst:			in std_logic;
		BTB_enable:		in std_logic;
		BTB_PC_From_IF:		in std_logic_vector(NBIT_ENTRY-1 downto 0);
		BTB_PC_From_DE:		in std_logic_vector(NBIT_ENTRY-1 downto 0);
		--BTB_NPC_From_DE:		in std_logic_vector(NBIT_ENTRY-1 downto 0);
		BTB_target_From_DE:		in std_logic_vector(NBIT_TARGET-1 downto 0);
		BTB_is_branch:		in std_logic; -- 1 true, 0 false
		BTB_branch_taken:		in std_logic; -- 1 true, 0 false. Coming from DE
		BTB_target_prediction:	out std_logic_vector(NBIT_TARGET-1 downto 0);
		BTB_prediction:		out std_logic -- 1 predicted taken, 0 predicted untaken
		
	);
end BTB;

architecture Structural of BTB is

	component NComparatorWithEnable is
	generic(
		NBIT: integer := 32);
	port(
		A:             in	std_logic_vector(NBIT-1 downto 0);
		B:             in	std_logic_vector(NBIT-1 downto 0);
		Enable: 	     in	std_logic;
		ComparatorBit: out	std_logic);	-- 1 if equal, 0 else
	end component;
	
	component ORGate_NX1 is
	generic(N: integer:= 8);
	port(
		A:	in  std_logic_vector(N-1 downto 0);
		B:	in  std_logic_vector(N-1 downto 0);
		Y:	out std_logic);
	     
	end component;
	
	component NPriorityEncoder is
	generic(NBIT_OUT : integer := 5);
	port(
		data_in : in  std_logic_vector(2**NBIT_OUT-1 downto 0);
		enable:	in  std_logic;
		data_out: out std_logic_vector(NBIT_OUT-1 downto 0)
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
	
	component NRotateRegister is
	generic(N: integer := 32);
	port(
		clk     : in  std_logic;
		reset   : in  std_logic;
		enable  : in  std_logic;
		load    : in  std_logic;
		data_in : in  std_logic_vector(N-1 downto 0);
		rotate  : in  std_logic;
		data_out: out std_logic_vector(N-1 downto 0)
	);
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
	
	component SAT_Counter_BTB is
	generic(N : integer := 2);
	port(
		SAT_clk 		: in  std_logic;
		SAT_reset 	: in  std_logic;
		SAT_enable	: in  std_logic;
		SAT_Ud		: in  std_logic;
		SAT_update	: in  std_logic;
		SAT_setToDef 	: in  std_logic;
		SAT_SO		: out std_logic
	);
	end component;
	
	component Mux_Bit is
	generic(NBIT_Sel : integer := 2);
	port(
		inputs : in  std_logic_vector(2**NBIT_Sel-1 downto 0);
		sel    : in  std_logic_vector(NBIT_Sel-1 downto 0);
		output : out std_logic
	);
	end component;
	
	component Mux_1Bit_2X1 is
	Port ( port0 : in  STD_LOGIC;
	 port1 : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           portY : out  STD_LOGIC);
	end component;
	
	type collectionEntry  is array (0 to N_ENTRY-1) of std_logic_vector (NBIT_ENTRY-1 downto 0);
	type collectionTarget is array (0 to N_ENTRY-1) of std_logic_vector (NBIT_TARGET-1 downto 0);
	type matrixTarget is array(0 to N_ENTRY-1) of collectionTarget;
	
	constant L: integer := log2(N_ENTRY);
	
	signal s_entries_Freg_Tcmp		: collectionEntry := (others => (others => '0'));
	signal s_targets_Freg_Tmux		: collectionTarget := (others => (others => '0'));
	signal s_cmpbits_Fcmp_Tencoder	: std_logic_vector(N_ENTRY-1 downto 0) := (others => '0');
	signal s_clk_enb			: std_logic := '0';
	signal s_HIT_miss			: std_logic := '0';
	signal s_HIT_miss_Freg_Txor		: std_logic := '0';
	signal s_update_rotate_reg		: std_logic := '0';
	signal s_selmuxes_Fencoder_Tmuxes	: std_logic_vector(L-1 downto 0) := (others => '0');
	signal s_regenabl_FrotateR_Tregs	: std_logic_vector(N_ENTRY-1 downto 0) := (others => '0');
	signal s_regenabl_entry		: std_logic_vector(N_ENTRY-1 downto 0):= (others => '0');
	signal s_regenabl_target		: std_logic_vector(N_ENTRY-1 downto 0):= (others => '0');
	signal s_regenabl_sat		: std_logic_vector(N_ENTRY-1 downto 0):= (others => '0');
	signal s_updateSat_FregCmpBits_Tsats    : std_logic_vector(N_ENTRY-1 downto 0):= (others => '0');
	signal s_prediction_Fsat_Tmuxes	: std_logic_vector(0 to N_ENTRY-1):= (others => '0');
	signal s_sat_prediction_Toutput	: std_logic := '0';
	signal s_mux_signals		: matrixTarget :=(others => (others => (others => '0')));


begin
	
	--s_clk_enb <= BTB_clk AND BTB_enable;

------------------------------------------------------------------------------------	
	GEN_NCmp:	for i in 0 to N_ENTRY-1 generate
		NCmp_i: NComparatorWithEnable GENERIC MAP(NBIT=>NBIT_ENTRY)
			PORT MAP(
				A => BTB_PC_From_IF,
				B => s_entries_Freg_Tcmp(i),
				Enable => BTB_enable,
				ComparatorBit => s_cmpbits_Fcmp_Tencoder(i)
			);
	end generate GEN_NCmp;
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
	ORGate32X1: ORGate_NX1 GENERIC MAP (N => N_ENTRY)
			PORT MAP(
				A => s_cmpbits_Fcmp_Tencoder,
				B => (others => '0'),
				Y => s_HIT_miss
			);
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
	PriorityEncoder32X5: NPriorityEncoder GENERIC MAP (NBIT_OUT => L)
				PORT MAP(
					data_in => s_cmpbits_Fcmp_Tencoder,
					enable => BTB_enable, 
					data_out => s_selmuxes_Fencoder_Tmuxes
				);
------------------------------------------------------------------------------------	

------------------------------------------------------------------------------------
	GEN_ENTR_REG: for i in 0 to N_ENTRY-1 generate
		EntrReg_i: NRegister GENERIC MAP (N=>NBIT_ENTRY)
				PORT MAP(
					clk => BTB_clk,
					reset => BTB_rst,
					data_in => BTB_PC_From_DE,
					enable => BTB_enable,
					load => s_regenabl_entry(N_ENTRY-i-1),
					data_out => s_entries_Freg_Tcmp(i)
				);
	end generate GEN_ENTR_REG;
------------------------------------------------------------------------------------
--
------------------------------------------------------------------------------------
	GEN_TARG_REG: for i in 0 to N_ENTRY-1 generate
		TargReg_i: NRegister GENERIC MAP (N=>NBIT_TARGET)
				PORT MAP(
					clk => BTB_clk,
					reset => BTB_rst,
					data_in => BTB_target_From_DE,
					enable => BTB_enable,
					load => s_regenabl_target(N_ENTRY-i-1),
					data_out => s_targets_Freg_Tmux(i)
				);
	end generate GEN_TARG_REG;
	
	s_mux_signals(0) <= s_targets_Freg_Tmux;
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
	HitMissReg: Reg1Bit 
			PORT MAP(
				clk => BTB_clk,
				reset => BTB_rst,
				data_in => s_HIT_miss,
				enable => BTB_enable,
				load => '1',
				data_out => s_HIT_miss_Freg_Txor
			);
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
	--s_update_rotate_reg <= (s_HIT_miss_Freg_Txor XOR BTB_is_branch); --AND BTB_clk
	s_update_rotate_reg <= NOT(s_HIT_miss_Freg_Txor) AND BTB_is_branch;
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
	RotReg : NRotateRegister GENERIC MAP (N => N_ENTRY)
				PORT MAP (
					clk => BTB_clk,
					reset => BTB_rst,
					enable => BTB_enable,
					load => '0', 
					data_in => (others => '0'),
					rotate => s_update_rotate_reg,
					data_out => s_regenabl_FrotateR_Tregs
				);
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
	Mux_Frot_Tentr : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => N_ENTRY)
				PORT MAP(
					port0 => (others => '0'),
					port1 => s_regenabl_FrotateR_Tregs,
					sel => s_update_rotate_reg, 
					portY => s_regenabl_entry
				);
	
	Mux_Frot_Ttarg : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => N_ENTRY)
				PORT MAP(
					port0 => (others => '0'),
					port1 => s_regenabl_FrotateR_Tregs,
					sel => s_update_rotate_reg, 
					portY => s_regenabl_target
				);
	
	Mux_Frot_Tsat  : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => N_ENTRY)
				PORT MAP(
					port0 => (others => '0'),
					port1 => s_regenabl_FrotateR_Tregs,
					sel => s_update_rotate_reg, 
					portY => s_regenabl_sat
				);
------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
	CompBitsReg: NRegister GENERIC MAP (N=>N_ENTRY)
				PORT MAP(
					clk => BTB_clk,
					reset => BTB_rst,
					data_in => s_cmpbits_Fcmp_Tencoder,
					enable => BTB_enable,
					load => '1',
					data_out => s_updateSat_FregCmpBits_Tsats
				);
--------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
	GEN_SAT: for i in 0 to N_ENTRY-1 generate
		SAT_Cnt_i : SAT_Counter_BTB GENERIC MAP (N => NBIT_PREDICTION)
					 PORT MAP(
						SAT_clk     => BTB_clk,
						SAT_reset   => BTB_rst,
						SAT_enable  => BTB_enable,
						SAT_setToDef    => s_regenabl_sat(N_ENTRY-i-1),
						SAT_Ud  => BTB_branch_taken,
						SAT_update   => s_updateSat_FregCmpBits_Tsats(i),
						SAT_SO => s_prediction_Fsat_Tmuxes(i)
					 );
	end generate GEN_SAT;
--------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
	MuxSat: Mux_Bit GENERIC MAP(NBIT_Sel => L)
		      PORT MAP(
			inputs => s_prediction_Fsat_Tmuxes,
			sel => s_selmuxes_Fencoder_Tmuxes,
			output => s_sat_prediction_Toutput
		      );
	
	MuxSatOut: Mux_1Bit_2X1 PORT MAP(
				port0 => '0',
				port1 => s_sat_prediction_Toutput,
				sel => s_HIT_miss,
				portY => BTB_prediction
			    );
--------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
	depth1: for i in 0 to L-1 generate 				--0,  1, 2,  3
		width1: for j in 0 to N_ENTRY-1 generate 	         --15,  7, 3,  1
			mod_if1: if(j mod(2**(i+1)) = 0) generate 	--2,  4, 8, 16
				MUX1: Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_TARGET) 
				           PORT MAP (port0 => s_mux_signals(i)(j),
						 port1 => s_mux_signals(i)(j+2**i),
						 Sel => s_selmuxes_Fencoder_Tmuxes(i),
						 portY => s_mux_signals(i+1)(j));
			end generate mod_if1;
			
		end generate width1;
	end generate depth1;
	
	MuxTargOut : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_TARGET) 
				PORT MAP (port0 => (others => '0'),
					port1 => s_mux_signals(L)(0),
					Sel => s_HIT_miss,
					portY => BTB_target_prediction
				);
--------------------------------------------------------------------------------------

end Structural;

