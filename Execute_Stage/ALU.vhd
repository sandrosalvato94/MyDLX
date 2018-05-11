----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Alessandro Salvato
-- 
-- Create Date:    19:18:08 10/20/2017 
-- Design Name: 
-- Module Name:    ALU - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 0.1
-- Revision:	
--	0.1 - Declared all components
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

entity ALU is
	generic(NBIT_DATA : integer := 32);
	port(
		ALU_OpA		: in  std_logic_vector(NBIT_DATA-1 downto 0);
		ALU_OpB		: in  std_logic_vector(NBIT_DATA-1 downto 0);
		ALU_Opcode	: in  std_logic_vector(4 downto 0);
		ALU_output	: out std_logic_vector(NBIT_DATA-1 downto 0);
		ALU_flags		: out std_logic_vector(4 downto 0)
	);
end ALU;

architecture Structural of ALU is

	component Barrel_Shifter is
	generic(--NBIT_DATA : integer := 16; NBIT_DATA = 2**NBIT_AMOUNT
	        NBIT_AMOUNT : integer := 5);
	port(
		BS_data_in	: in  std_logic_vector(2**NBIT_AMOUNT-1 downto 0);
		BS_opcode		: in  std_logic_vector(1 downto 0); 
		BS_amount		: in  std_logic_vector(NBIT_AMOUNT-1 downto 0);
		BS_data_out	: out std_logic_vector(2**NBIT_AMOUNT-1 downto 0)
	);
	end component;
	
	component P4Adder is
	GENERIC(N: integer := 32);
	PORT(
		A : IN std_logic_vector(N-1 downto 0);
		B : IN std_logic_vector(N-1 downto 0);
		c_in: IN std_logic;
		c_out: OUT std_logic;
		Sum : OUT std_logic_vector(N-1 downto 0)
	);
	end component;
	
	component Logic_Unit is
	generic(NBIT_DATA : integer := 32);
	port(
		LU_OpA 	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		LU_OpB 	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		LU_Opcode	: in  std_logic_vector(3 downto 0);
		LU_Y	: out std_logic_vector(NBIT_DATA-1 downto 0)
	);
	end component;
	
	component Comparison_Logic is
	generic(NBIT_DATA : integer := 32);
	port(
		CMPL_OpA		: in  std_logic_vector(NBIT_DATA-1 downto 0);
		CMPL_OpB  	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		CMPL_OPCODE	: in  std_logic_vector(3 downto 0);
--		CMPL_sgn_usgn	: in  std_logic;
		CMPL_Y		: out std_logic_vector(NBIT_DATA-1 downto 0)
	);
	end component;
	
	component Flag_Generator is
	generic(NBIT_ALU : integer := 32);
	port(
		FG_ALU_out	: in  std_logic_vector(NBIT_ALU-1 downto 0);
		FG_sgn_usgn	: in  std_logic;
		FG_carry		: in  std_logic;
		FG_ZF		: out std_logic;
		FG_PF		: out std_logic;
		FG_SF		: out std_logic;
		FG_CF		: out std_logic;
		FG_OF		: out std_logic
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
	
	constant L: integer := log2(NBIT_DATA);
	
	constant

begin

--	type collectionEntry  is array (0 to N_ENTRY-1) of std_logic_vector (NBIT_ENTRY-1 downto 0);
--	type collectionTarget is array (0 to N_ENTRY-1) of std_logic_vector (NBIT_TARGET-1 downto 0);
--	type matrixTarget is array(0 to N_ENTRY-1) of collectionTarget;
--	
--	signal s_mux_signals		: matrixTarget :=(others => (others => (others => '0')));

--	depth1: for i in 0 to L-1 generate 				--0,  1, 2,  3
--		width1: for j in 0 to N_ENTRY-1 generate 	         --15,  7, 3,  1
--			mod_if1: if(j mod(2**(i+1)) = 0) generate 	--2,  4, 8, 16
--				MUX1: Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_TARGET) 
--				           PORT MAP (port0 => s_mux_signals(i)(j),
--						 port1 => s_mux_signals(i)(j+2**i),
--						 Sel => s_selmuxes_Fencoder_Tmuxes(i),
--						 portY => s_mux_signals(i+1)(j));
--			end generate mod_if1;
--			
--		end generate width1;
--	end generate depth1;


end Structural;

