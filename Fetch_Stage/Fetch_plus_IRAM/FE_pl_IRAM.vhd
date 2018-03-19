----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:29:38 10/09/2017 
-- Design Name: 
-- Module Name:    FE_pl_IRAM - Behavioral 
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

entity FE_pl_IRAM is
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
		--FE_IR_in			: in  std_logic_vector(NBIT_IR-1 downto 0);
		FE_IR_out			: out std_logic_vector(NBIT_IR-1 downto 0);
		FE_PC			: out std_logic_vector(NBIT_PC-1 downto 0);
		FE_NPC			: out std_logic_vector(NBIT_PC-1 downto 0)
		
	);
end FE_pl_IRAM;

architecture Behavioral of FE_pl_IRAM is

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
		FE_IR_in			: in  std_logic_vector(NBIT_IR-1 downto 0);
		FE_IR_out			: out std_logic_vector(NBIT_IR-1 downto 0);
		FE_PC			: out std_logic_vector(NBIT_PC-1 downto 0);
		FE_NPC			: out std_logic_vector(NBIT_PC-1 downto 0)
		
	);
	end component;
	
	component IRAM is
	generic (
		IRAM_DEPTH : integer := 48;
		I_SIZE : integer := 32);
	port (
	Rst  : in  std_logic;
	Addr : in  std_logic_vector(I_SIZE - 1 downto 0);
	Enable     : in  std_logic;
	Dout : out std_logic_vector(I_SIZE - 1 downto 0)
	);
	end component;
	
	signal s_pc_out : std_logic_vector(NBIT_PC-1 downto 0);
	signal s_ir_in  : std_logic_vector(NBIT_IR-1 downto 0);

begin

	FE : Fetch GENERIC MAP(NBIT_PC, NBIT_IR) PORT MAP (
		FE_clk =>	FE_clk,
		FE_rst => FE_rst	,
		FE_enable => FE_enable,          
		FE_PC_enable => FE_PC_enable	,
		FE_PC_clear => FE_PC_clear	,
		FE_IR_enable => FE_IR_enable	,
		FE_IR_clear => FE_IR_clear	,
		FE_btb_target_prediction => FE_btb_target_prediction	,
		FE_btb_prediction	=> FE_btb_prediction	,
		FE_branch_taken => FE_branch_taken		,
		FE_IR_in	=>	s_ir_in	,
		FE_IR_out	=>	FE_IR_out	,
		FE_PC	=>	s_pc_out	,
		FE_NPC	=> 	FE_NPC	
					);
	FE_PC <= s_pc_out;
	RAM : IRAM GENERIC MAP (1024, NBIT_IR) PORT MAP (
					Rst => FE_rst,
					Addr => s_pc_out,
					Enable => FE_enable,
					Dout => s_ir_in
					);

end Behavioral;

