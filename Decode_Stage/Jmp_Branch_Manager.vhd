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
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.1
-- Additional Comments: 
--	Version 0.1 - This design is not finished yet because I need to have
--		    a clearer look of the instruction set encoding, the 
--		    OPCODE first of all. Each reference to OPCODE is purely
--		    for running synthesis tool of Xilinx.	
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
		JBM_JMP_branch	: in std_logic;
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
	
begin
	
	JBM_taken <= NOT(JBM_JMP_branch) AND JBM_iszero;
	
	MUX_TRG : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => N) PORT MAP (
						port0 => JBM_Reg,
						port1 => JBM_Imm,
						sel => JBM_JMP_branch, --segnale scelto a caso
						portY => s_Fmuxtrg_Tadd
						);
	MUX_TBA : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => N) PORT MAP (
						port0 => s_allzeros,
						port1 => JBM_NPC,
						sel => JBM_JMP_branch, --segnale scelto a caso
						portY => s_Fmuxtba_Tadd
						);
						
	cyc : for i in 0 to N-1 generate
		s_not_tmp(i) <= NOT(s_Fmuxtrg_Tadd(i));
	end generate cyc;
						
	MUX_ADD : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => N) PORT MAP (
						port0 => s_Fmuxtrg_Tadd,
						port1 => s_not_tmp,
						sel => JBM_JMP_branch,
						portY => s_Tadd
						);
	ADD : PropagateCarryLookahead GENERIC MAP (N => N) PORT MAP (
						A => s_Tadd,
						B => s_Fmuxtba_Tadd,
						Cin => JBM_JMP_branch,
					--	Cout => , not useful in this prototype
						Sum => JBM_Upd_PC
						);

end Behavioral;

