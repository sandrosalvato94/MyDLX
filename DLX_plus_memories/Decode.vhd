
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:05:48 10/12/2017 
-- Design Name: 
-- Module Name:    Decode - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.9
-- Additional Comments: 
--	Version 0.1 - Each component has been instantiated in. No test has been 
--		    performed yet. Jmp_Branch_Manager is not completed because
--		    I need to know very well how to optimize the instruction
--		    set enconding.
--			 0.5 - Changed pinout and data forwording
--			 0.6 - New version of JBManager
--			 0.7 - Minor modifications
--			 0.8 - Added Write_Mux and DE_save_PC signal on pinout
--			 0.9 - Added DE_imm_address on pinout
--			 0.10 - Changed addresses DE_IR toward register file addresses
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

entity Decode is
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
--		DE_addr_rd1 	: in  std_logic_vector(NBIT_ADDR-1 downto 0);
--		DE_addr_rd2 	: in  std_logic_vector(NBIT_ADDR-1 downto 0);
--		DE_addr_wr 	: in  std_logic_vector(NBIT_ADDR-1 downto 0);
		DE_data_Fwb	: in  std_logic_vector(NBIT_DATA-1 downto 0);
--		DE_instr_type	: in  std_logic_vector(7 downto 0); --one hot encoding, one bit per instr type
		DE_signext	: in  std_logic_vector(1 downto 0); --[IMM/jump, SIGNED/unsigned]
		DE_JMP_branch	: in  std_logic_vector(1 downto 0);
		DE_jmp_or_branch	: in std_logic;
		DE_save_PC	: in std_logic;
		DE_branch_taken	: out std_logic;
		DE_new_PC		: out std_logic_vector(NBIT_PC-1 downto 0);
		DE_imm_address		: out std_logic_vector(NBIT_DATA-1 downto 0);
		DE_RegA		: out std_logic_vector(NBIT_DATA-1 downto 0);
		DE_RegB		: out std_logic_vector(NBIT_DATA-1 downto 0);
		DE_RegI		: out std_logic_vector(NBIT_DATA-1 downto 0)
	);
	        
end Decode;

architecture Structural of Decode is

--	component register_file is
--	generic(N: integer := 32; --# of registers
--	        M: integer := 64; --depth of each resgister
--                  K: integer := 5   --# bits for addressing
--	);
--	port ( 	CLK: 	IN std_logic;
--		RESET: 	IN std_logic;
--		ENABLE: 	IN std_logic;
--		RD1: 	IN std_logic;
--		RD2: 	IN std_logic;
--		WR: 	IN std_logic;
--		ADD_WR: 	IN std_logic_vector(K-1 downto 0); -- 32 registers
--		ADD_RD1: 	IN std_logic_vector(K-1 downto 0);
--		ADD_RD2: 	IN std_logic_vector(K-1 downto 0);
--		DATAIN: 	IN std_logic_vector(M-1 downto 0);
--		OUT1: 	OUT std_logic_vector(M-1 downto 0);
--		OUT2: 	OUT std_logic_vector(M-1 downto 0));
--	end component ;

	component Register_File is
	generic(NBIT_ADDR	: integer := 5;
			  NBIT_DATA : integer := 32);
	port(
			RF_clk		: in  std_logic;
			RF_reset 	: in  std_logic;
			RF_enable	: in  std_logic;
			RF_RD1		: in  std_logic;
			RF_RD2		: in  std_logic;
			RF_WR			: in  std_logic;
			RF_AddrRd1	: in  std_logic_vector(NBIT_ADDR-1 downto 0);
			RF_AddrRd2	: in  std_logic_vector(NBIT_ADDR-1 downto 0);
			RF_AddrWr	: in  std_logic_vector(NBIT_ADDR-1 downto 0);
			RF_data_in	: in  std_logic_vector(NBIT_DATA-1 downto 0);
			RF_out1		: out std_logic_vector(NBIT_DATA-1 downto 0);
			RF_out2		: out std_logic_vector(NBIT_DATA-1 downto 0)
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
	
	component NComparatorWithEnable is
	generic(
		NBIT: integer := 32);
	port(
		A:             in	std_logic_vector(NBIT-1 downto 0);
		B:             in	std_logic_vector(NBIT-1 downto 0);
		Enable: 	     in	std_logic;
		ComparatorBit: out	std_logic);	-- 1 if equal, 0 else
	end component;
	
	component Sign_Extender is
	generic(NBIT_DATA : integer := 32);
	port(
		SE_I_J	: in  std_logic; -- high immediate, low jump
		SE_S_U	: in  std_logic; -- high signed,  low unsigned
		SE_in	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		SE_out	: out std_logic_vector(NBIT_DATA-1 downto 0)
	);
	end component;
	
	component Jmp_Branch_Manager is
	generic(N : integer := 32);
	port(
		JBM_iszero: in  std_logic;
		JBM_Reg	: in  std_logic_vector(N-1 downto 0);
		JBM_Imm	: in  std_logic_vector(N-1 downto 0);
		JBM_NPC	: in  std_logic_vector(N-1 downto 0);
		---JBM_Opcode: in  std_logic_vector(5 downto 0); 
		JBM_JMP_branch	: in std_logic_vector(1 downto 0);
		JBM_transparent_mode			: in std_logic;
		JBM_Upd_PC: out std_logic_vector(N-1 downto 0);
		JBM_taken : out std_logic
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
	
	component Reg1Bit is
	port(
		clk:	in  std_logic;
		reset:	in  std_logic; --Active high
		data_in:	in  std_logic;
		enable:	in  std_logic;
		load:	in  std_logic; --Load enable high
		data_out: out std_logic);
	end component;
	
	signal s_ex, s_mem, s_wb	: std_logic_vector(NBIT_ADDR-1 downto 0) := (others => '0');
	signal s_data_Frf_TregA	: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_data_Frf_TregB	: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_data_Fse_Timm	: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_data_Fir_Tse	: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_data_Frega_Tcmp	: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_iszero_Fcmp_Tcond	: std_logic;
	signal s_fwd_tmp 				: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_fwd_fmux_tcmp 		: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_fmux_tr1				: std_logic_vector(NBIT_ADDR-1 downto 0);
	signal s_wr_addr_type			: std_logic_vector(NBIT_ADDR-1 downto 0);
	signal s_wr_de					: std_logic;
	signal s_wr_ex					: std_logic;
	signal s_wr_mem					: std_logic;
	signal s_notRd2				: std_logic;
	signal s_isnt_jmp_or_branch: std_logic;
	signal s_enable1				: std_logic;
	signal s_enable2				: std_logic;
	signal s_enable3				: std_logic;

begin

------------------------------------------------------------------------------------
	R1_enable	: Reg1Bit PORT MAP (
		clk 			=> DE_clk,
		reset			=> DE_reset ,
		data_in		=> DE_enable,
		enable		=> DE_enable,
		load			=> '1',
		data_out		=> s_enable1
		);
		
	R2_enable	: Reg1Bit PORT MAP (
		clk 			=> DE_clk,
		reset			=> DE_reset ,
		data_in		=> s_enable1,
		enable		=> DE_enable,
		load			=> '1',
		data_out		=> s_enable2
		);
		
	R3_enable	: Reg1Bit PORT MAP (
		clk 			=> DE_clk,
		reset			=> DE_reset ,
		data_in		=> s_enable2,
		enable		=> DE_enable,
		load			=> '1',
		data_out		=> s_enable3
		);
------------------------------------------------------------------------------------


------------------------------------------------------------------------------------
	R1_wr	: Reg1Bit PORT MAP (
		clk 			=> DE_clk,
		reset			=> DE_reset ,
		data_in		=> DE_wr,
		enable		=> DE_enable,
		load			=> '1',
		data_out		=> s_wr_de
		);
		
	R2_wr	: Reg1Bit PORT MAP (
		clk 			=> DE_clk,
		reset			=> DE_reset ,
		data_in		=> s_wr_de,
		enable		=> s_enable1,
		load			=> '1',
		data_out		=> s_wr_ex
		);
		
	R3_wr	: Reg1Bit PORT MAP (
		clk 			=> DE_clk,
		reset			=> DE_reset ,
		data_in		=> s_wr_ex,
		enable		=> s_enable2,
		load			=> '1',
		data_out		=> s_wr_mem
		);
------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------	
	s_notRd2 <= NOT(DE_RD2);
	
	TypeWr_MUX : Mux_NBit_2x1 GENERIC MAP(NBIT_ADDR) PORT MAP ( --agiunto il 28/06
						port0 => DE_IR(15 downto 11), 
						port1 => DE_IR(20 downto 16), 
						sel => s_notRd2,
						portY => s_wr_addr_type
						);
	
	Write_MUX : Mux_NBit_2x1 GENERIC MAP(NBIT_ADDR) PORT MAP (
						port0 => s_wr_addr_type, 
						port1 => (others => '1'), --31
						sel => DE_save_PC,
						portY => s_fmux_tr1
						);
	
	R1 : NRegister GENERIC MAP (N => NBIT_ADDR) PORT MAP (
						clk => DE_clk,
						reset => DE_reset,
						enable => DE_enable,
						load => '1',
						data_in => s_fmux_tr1,
						data_out => s_ex
						);
	R2 : NRegister GENERIC MAP (N => NBIT_ADDR) PORT MAP (
						clk => DE_clk,
						reset => DE_reset,
						enable => s_enable1,
						load => '1',
						data_in => s_ex,
						data_out => s_mem
						);
	R3 : NRegister GENERIC MAP (N => NBIT_ADDR) PORT MAP (
						clk => DE_clk,
						reset => DE_reset,
						enable => s_enable2,
						load => '1',
						data_in => s_mem,
						data_out => s_wb
						);
-------------------------------------------------------------------------------------
	
--	RF : register_file GENERIC MAP (N => 2**NBIT_ADDR,
--				  M => NBIT_DATA,
--				  K => NBIT_ADDR)
--		         PORT MAP (
--				CLK => DE_clk,
--				RESET => DE_reset,
--				ENABLE => DE_enable,
--				RD1 => DE_rd1,
--				RD2 => DE_rd2,
--				WR => s_wr_mem,
--				ADD_WR => s_wb,
--				ADD_RD1 => DE_IR(25 downto 21),
--				ADD_RD2 => DE_IR(20 downto 16),
--				DATAIN => DE_data_Fwb,
--				OUT1 => s_data_Frf_TregA,
--				OUT2 => s_data_Frf_TregB
--		         );

	RF : Register_File GENERIC MAP (NBIT_ADDR => NBIT_ADDR, NBIT_DATA => NBIT_DATA) PORT MAP (
			RF_clk 			=> DE_clk,
			RF_reset			=> DE_reset,
			RF_enable		=> DE_enable,
			RF_RD1			=> DE_rd1,
			RF_RD2			=> DE_rd2,
			RF_WR				=> s_wr_mem,
			RF_ADDRRD1		=> DE_IR(25 downto 21),
			RF_ADDRRD2		=> DE_IR(20 downto 16),
			RF_ADDRWR		=> s_wb,
			RF_DATA_IN		=> DE_data_Fwb,
			RF_out1			=> s_data_Frf_TregA,
			RF_out2			=> s_data_Frf_TregB
		);

-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
	
	s_data_Fir_Tse <= "000000" & DE_IR(25 downto 0);
	
	SE : Sign_Extender GENERIC MAP (NBIT_DATA => NBIT_DATA) PORT MAP (
							SE_I_J => DE_signext(1),
							SE_S_U => DE_signext(0),
							SE_in => s_data_Fir_Tse,
							SE_out => s_data_Fse_Timm
							);
							
	DE_imm_address <= s_data_Fse_Timm;
-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
	FWD_MUX1 : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) PORT MAP (
																port0 => s_data_Frf_TregA, 
																port1 => DE_data_fex,
																sel => DE_sel_data_forward(0),
																portY => s_fwd_tmp
																);
	FWD_MUX2 : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) PORT MAP (
																port0 => s_fwd_tmp, 
																port1 => DE_data_Fwb,
																sel => DE_sel_data_forward(1),
																portY => s_fwd_fmux_tcmp
																);
-------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------
	RegA : NRegister GENERIC MAP (N => NBIT_DATA) PORT MAP (
						clk => DE_clk,
						reset => DE_reset,
						enable => DE_enable,
						load => '1',
						data_in => s_data_Frf_TregA,
						data_out => DE_RegA
						);
	
	RegB : NRegister GENERIC MAP (N => NBIT_DATA) PORT MAP (
						clk => DE_clk,
						reset => DE_reset,
						enable => DE_enable,
						load => '1',
						data_in => s_data_Frf_TregB,
						data_out => DE_RegB
						);
	RegI : NRegister GENERIC MAP (N => NBIT_DATA) PORT MAP (
						clk => DE_clk,
						reset => DE_reset,
						enable => DE_enable,
						load => '1',
						data_in => s_data_Fse_Timm,
						data_out => DE_RegI
						);
-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
	Cmp : NComparatorWithEnable GENERIC MAP (NBIT => NBIT_DATA) PORT MAP (
							A => s_fwd_fmux_tcmp,
							B => (others => '0'),
							Enable => DE_enable,
							ComparatorBit => s_iszero_Fcmp_Tcond
							);
-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
	s_isnt_jmp_or_branch <= NOT(DE_jmp_or_branch);
	
	JBM : Jmp_Branch_Manager GENERIC MAP (N => NBIT_DATA) PORT MAP (
							JBM_iszero => s_iszero_Fcmp_Tcond,
							JBM_Reg => s_data_Frf_TregA,
							JBM_Imm => s_data_Fse_Timm,
							JBM_NPC => DE_NPC,
							JBM_JMP_branch => DE_JMP_branch,
							JBM_transparent_mode => s_isnt_jmp_or_branch,
							JBM_Upd_PC => DE_new_PC,
							JBM_taken => DE_branch_taken
							);
-------------------------------------------------------------------------------------

end Structural;

