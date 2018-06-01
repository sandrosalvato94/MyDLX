----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 	Alessandro Salvato
-- 
-- Create Date:    16:16:06 05/22/2018 
-- Design Name: 
-- Module Name:    Datapath - Structural 
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
--		DE_addr_rd1 	: in  std_logic_vector(NBIT_ADDR-1 downto 0);
--		DE_addr_rd2 	: in  std_logic_vector(NBIT_ADDR-1 downto 0);
--		DE_addr_wr 	: in  std_logic_vector(NBIT_ADDR-1 downto 0);
		DE_data_Fwb	: in  std_logic_vector(NBIT_DATA-1 downto 0);
--		DE_instr_type	: in  std_logic_vector(7 downto 0); --one hot encoding, one bit per instr type
		DE_signext	: in  std_logic_vector(1 downto 0); --[IMM/jump, SIGNED/unsigned]
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
--	        NBIT_PC 	: integer := 32;
--	        NBIT_IR 	: integer := 32
	        );
	port(
		EX_clk 		: in  std_logic;
		EX_reset 		: in  std_logic;
		EX_enable		: in  std_logic;
--		EX_IR		: in  std_logic_vector(NBIT_IR-1 downto 0);
--		EX_PC		: in  std_logic_vector(NBIT_PC-1 downto 0);
		EX_OpA		: in  std_logic_vector(NBIT_DATA-1 downto 0);
		EX_OpB		: in  std_logic_vector(NBIT_DATA-1 downto 0);
--		EX_OpAEnable	: in  std_logic;
--		EX_OpBEnable	: in  std_logic;
--		EX_AluEnable	: in  std_logic;
--		EX_MulEnable	: in  std_logic;
		EX_Opcode		: in  std_logic_vector(5 downto 0);
--		EX_ShiftOp	: in  std_logic_vector(2 downto 0);
		EX_ShiftAmount	: in  std_logic_vector(NBIT_BS_AMOUNT-1 downto 0);
		EX_sel_mux_out	: in  std_logic_vector(1 downto 0);
		
		EX_data_out	: out std_logic_vector(NBIT_DATA-1 downto 0);
--		EX_PC		: out std_logic_vector(NBIT_PC-1 downto 0);
--		EX_IR		: out std_logic_vector(NBIT_IR-1 downto 0);
		EX_PSW		: out std_logic_vector(4 downto 0);
		EX_AluOutBack	: out std_logic_vector(NBIT_DATA-1 downto 0)
	);
	end component ;
	
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
		WB_OpA	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		WB_OpB	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		WB_sel	: in  std_logic;
		WB_out	: out std_logic_vector(NBIT_DATA-1 downto 0)
	);
	end component ;

begin


end Structural;

