----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Alessandro Salvato
-- 
-- Create Date:    12:06:43 10/17/2017 
-- Design Name: 
-- Module Name:    Jmp_Branch_Manager - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--				Instracions should trigger this components are jumps and branches, such as:
--				j, jal, jr, jalr, beqz, bnez. 
--				Jumps are totally unconditioned, so the value of JBM_iszero signal doesn't matter
--				On the contrary, it's something we take care for branches.
--
--				JBM_JMP_branch(1)	JBM_JMP_branch(0)						Description
--						 0						 0										BNEZ
--						 0						 1										BEQZ
--						 1						 0									  J, JAL
--						 1						 1						          JALR, JR
--
--				
--				JBM_JMP_branch(1)	JBM_JMP_branch(0)	JBM_iszero	|	JBM_taken
--						 0						 0					 0			|		 1
--						 0						 1					 0			|      0
--						 0						 0					 1			|      0
--						 0						 1					 1			|	    1
--						 1						 -					 -			|		 1
--				Beqz and Bnez use imm16, PC<- NPC + imm 
--				J and Jal use imm26		 PC<- NPC + imm
--				Jalr and Jr use Reg, replace PC
--
--				The transparent mode is not yet took into account. 
--				Here the idea is to avoid the introduction of another control signal
--				coming from the main control unit. Looking at the control_word excel
--				I see that never occours the following scenario: BNEZ instruction
--				and RD1 = 0, since BNEZ requires reading the first operand from the
--				register file. So, from the control unit I have just to force JBM_JMP_branch
--				to "00", it's trivial, and check it the value of a signal used for another
--				main purpose.
-- 			JBM_JMP_branch(1)	JBM_JMP_branch(0)	JBM_iszero	JBM_transparent_mode	|	JBM_taken
--						 0						 0					 0			   0		|		 1	 //transparent mode!!
--						 0						 0					 0			   1		|		 0
--						 0						 1					 0				-		|      0
--						 0						 0					 1				-		|      0
--						 0						 1					 1				-		|	    1
--						 1						 -					 -				-		|		 1
-- Dependencies: 
--
-- Revision: 
-- Revision 0.3
-- Additional Comments: 
--	Version 0.1 - This design is not finished yet because I need to have
--		    a clearer look of the instruction set encoding, the 
--		    OPCODE first of all. Each reference to OPCODE is purely
--		    for running synthesis tool of Xilinx.	
--				0.2 - Changed pinout (JBM_JMP_branch	: in std_logic_vector(1 downto 0);)
--						in order to distinguish among jumps, beqz and bnez.
--						New combinational logic inside, to drive multiplexers.
--				0.3 - Changed pinout (+ JBM_transparent_mode). Modified the definition of JBM_taken,
--					   now it takes into account JBM_transparent_mode.
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

entity Jmp_Branch_Manager is
	generic(N : integer := 32);
	port(
		JBM_iszero: in  std_logic;
		JBM_Reg	: in  std_logic_vector(N-1 downto 0);
		JBM_Imm	: in  std_logic_vector(N-1 downto 0);
		JBM_NPC	: in  std_logic_vector(N-1 downto 0);
		---JBM_Opcode: in  std_logic_vector(5 downto 0); 
		JBM_JMP_branch	: in std_logic_vector(1 downto 0);
		JBM_transparent_mode			: in std_logic; --attivo basso
		JBM_Upd_PC: out std_logic_vector(N-1 downto 0);
		JBM_taken : out std_logic
	);
end Jmp_Branch_Manager;

architecture Behavioral of Jmp_Branch_Manager is
	
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
	
	constant s_allzeros : std_logic_vector(N-1 downto 0) := (others => '0');
	
	signal s_Fmuxtrg_Tadd	: std_logic_vector(N-1 downto 0);
	signal s_Fmuxtba_Tadd	: std_logic_vector(N-1 downto 0);
	signal s_not_tmp			: std_logic_vector(N-1 downto 0);
	signal s_Tadd				: std_logic_vector(N-1 downto 0);
--	signal s_sel_mux_trg		: std_logic;
--	signal s_sel_mux_tba		: std_logic;
--	signal s_mux_add			: std_logic;
	signal s_sel_muxes		: std_logic;
--	signal s_cin				: std_logic;
	
	
begin
---------------------------------------------------------------------------------------------------------------------------	
	--<-- 29 Giugno
	JBM_taken <= ((NOT(JBM_JMP_branch(0))AND NOT(JBM_iszero) AND NOT(JBM_transparent_mode)) 
						OR (JBM_JMP_branch(0) AND JBM_iszero AND NOT(JBM_transparent_mode)) OR JBM_JMP_branch(1));
---------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------	
	s_sel_muxes <= JBM_JMP_branch(1) NAND JBM_JMP_branch(0);
	
	MUX_TRG : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => N) PORT MAP (
						port0 => JBM_Reg,
						port1 => JBM_Imm,
						sel => s_sel_muxes, 
						portY => s_Fmuxtrg_Tadd
						);
	MUX_TBA : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => N) PORT MAP (
						port0 => s_allzeros,
						port1 => JBM_NPC,
						sel => s_sel_muxes, 
						portY => s_Fmuxtba_Tadd
						);
---------------------------------------------------------------------------------------------------------------------------
						
---------------------------------------------------------------------------------------------------------------------------
	cyc : for i in 0 to N-1 generate
		s_not_tmp(i) <= NOT(s_Fmuxtrg_Tadd(i));
	end generate cyc;
						
	MUX_ADD : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => N) PORT MAP (
						port0 => s_Fmuxtrg_Tadd,
						port1 => s_not_tmp,
						sel => s_sel_muxes,
						portY => s_Tadd
						);
	ADD : PropagateCarryLookahead GENERIC MAP (N => N) PORT MAP (
						A => s_Tadd,
						B => s_Fmuxtba_Tadd,
						Cin => s_sel_muxes,
					--	Cout => , not useful in this prototype
						Sum => JBM_Upd_PC
						);
---------------------------------------------------------------------------------------------------------------------------
end Behavioral;

