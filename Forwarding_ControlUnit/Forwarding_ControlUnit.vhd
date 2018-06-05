----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 	Alessandro Salvato
-- 
-- Create Date:    10:54:17 05/25/2018 
-- Design Name: 
-- Module Name:    Forwarding_ControlUnit - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--				In according to Patterson's directives, all comperison are performed.
--				In order to distinguish between an instruction register content, 
--				either a reg or an imm type instruction, I add a signal, because the
--				structure of the IR is different in both scenarios.
--				Two kind of output are declared, as data forwording is performed for 
--				both the input operands of the ALU: the top and the bottom ones, in 
--				according to Patterson's names. FCU_REG_imm and FCU_is_load refer to
--				the instruction type at the beginning of the
--		
--				FCU_MUX_TOP_ALU(1) FCU_MUX_TOP_ALU(0) 			Description
--     -------------------------------------------------------------------------------
--						0							0					Registers under processing
--																		in EX, MEM and WB are different,
--																		so no forwording is needed	
--		  
--						0							1					The same Register(s) coming from
--																		RF and the output of MEM are under
--																		processing. So MEM output is required
--																		as TOP input of the ALU immediately.
--																		MEM/WB --> ID/EX
--
--						1							0					The output of the ALU/MUL stage is
--																		required as their own input for the
--																		next clock cycle. So that data is
--																		forwarded back by one stage.
--																		EX/MEM --> ID/EX
--
--						1							1					This is the scenario where the same
--																		register occurs as the destination one
--																		of 3 consecutives assembly instructions.
--																		For this scenario the best choice is
--																		forwarding back the EX/MEM output.
--																		EX/MEM --> ID/EX
-- Dependencies: 
--
-- Revision: 0.5
-- Revision 
--				0.01 	- File Created
--				0.2	- All components tied up.
--				0.3	- Changed the declaration of FCU_MUX_TOP_ALU and FCU_MUX_BOT_ALU. Now
--						  it takes care of the case where the same register is under processing
--						  ID/EX, EX/MEM and MEM/WB, setting the priority for EX/MEM --> ID/EX
--				0.5   - T1 passed. T2 passed as well but I'd like to highlight a point: T2.CC2
--						  After a reset, a boot or something like that, EX/MEM.IR and MEM/WB.IR registers
--					     are set to all 0s. FCU compares their content, being equal produces an 
--						  unwanted output. A possible solution is delaying FCU_enable by 2 clock cycles
--						  or simpler accepting this behavior; as matter of fact at CC2 the execute
--					     stage doesn't work yet, so who cares about the input operands. However,
--						  at this revision, I don't fix yet this possible trouble.
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

entity Forwarding_ControlUnit is
	port(
		FCU_REG_imm				: in  std_logic;
		FCU_enable				: in  std_logic;
		FCU_EX_MEM_IR_16_20	: in  std_logic_vector(4 downto 0);
		FCU_EX_MEM_IR_11_15	: in  std_logic_vector(4 downto 0);
		FCU_ID_EX_IR_11_15	: in  std_logic_vector(4 downto 0);
		FCU_ID_EX_IR_6_10	   : in  std_logic_vector(4 downto 0);
		FCU_MEM_WB_IR_16_20	: in  std_logic_vector(4 downto 0);
		FCU_MEM_WB_IR_11_15	: in  std_logic_vector(4 downto 0);
		FCU_MUX_TOP_ALU		: out std_logic_vector(1 downto 0);
		FCU_MUX_BOT_ALU		: out std_logic_vector(1 downto 0)
	);
end Forwarding_ControlUnit;

architecture Structural of Forwarding_ControlUnit is
	
	component Comparator5Bit is
	port(
			CMP_A			: in  std_logic_vector(4 downto 0);
			CMP_B 		: in  std_logic_vector(4 downto 0);
			CMP_EQ_neq	: out std_logic
		);
	end component;
	
	component Mux_1Bit_2X1 is
    Port ( port0 : in  STD_LOGIC;
           port1 : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           portY : out  STD_LOGIC);
	end component;
	
	signal s_out_cmp		: std_logic_vector(0 to 7);
	signal s_out_mux  	: std_logic_vector(0 to 3);
	signal s_not_out_mux : std_logic_vector(0 to 1);
	
begin
----------------------------------------------------------------------------------------
	CMP_TOP1 : Comparator5Bit PORT MAP (
											CMP_A => FCU_EX_MEM_IR_16_20,
											CMP_B => FCU_ID_EX_IR_6_10,
											CMP_EQ_neq => s_out_cmp(0)
											);
	CMP_TOP2 : Comparator5Bit PORT MAP (
											CMP_A => FCU_ID_EX_IR_6_10,
											CMP_B => FCU_MEM_WB_IR_16_20,
											CMP_EQ_neq => s_out_cmp(1)
											);
	CMP_TOP3 : Comparator5Bit PORT MAP (
											CMP_A => FCU_EX_MEM_IR_11_15,
											CMP_B => FCU_ID_EX_IR_6_10,
											CMP_EQ_neq => s_out_cmp(2)
											);
	CMP_TOP4 : Comparator5Bit PORT MAP (
											CMP_A => FCU_MEM_WB_IR_11_15,
											CMP_B => FCU_ID_EX_IR_6_10,
											CMP_EQ_neq => s_out_cmp(3)
											);
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
	CMP_BOT1 : Comparator5Bit PORT MAP (
											CMP_A => FCU_ID_EX_IR_11_15,
											CMP_B => FCU_EX_MEM_IR_16_20,
											CMP_EQ_neq => s_out_cmp(4)
											);
	CMP_BOT2 : Comparator5Bit PORT MAP (
											CMP_A => FCU_ID_EX_IR_11_15,
											CMP_B => FCU_MEM_WB_IR_16_20,
											CMP_EQ_neq => s_out_cmp(5)
											);
	CMP_BOT3 : Comparator5Bit PORT MAP (
											CMP_A => FCU_ID_EX_IR_11_15,
											CMP_B => FCU_EX_MEM_IR_11_15,
											CMP_EQ_neq => s_out_cmp(6)
											);
	CMP_BOT4 : Comparator5Bit PORT MAP (
											CMP_A => FCU_ID_EX_IR_11_15,
											CMP_B => FCU_MEM_WB_IR_11_15,
											CMP_EQ_neq => s_out_cmp(7)
											);
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
	MUX_TOP1 : Mux_1Bit_2X1 PORT MAP (
										port0 => s_out_cmp(2),
										port1 => s_out_cmp(0),
										sel => FCU_REG_imm,
										portY => s_out_mux(1)
										);
	MUX_TOP2 : Mux_1Bit_2X1 PORT MAP (
										port0 => s_out_cmp(3),
										port1 => s_out_cmp(1),
										sel => FCU_REG_imm,
										portY => s_out_mux(0)
										);
-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------
	MUX_BOT1 : Mux_1Bit_2X1 PORT MAP (
										port0 => s_out_cmp(6),
										port1 => s_out_cmp(4),
										sel => FCU_REG_imm,
										portY => s_out_mux(3)
										);
	MUX_BOT2 : Mux_1Bit_2X1 PORT MAP (
										port0 => s_out_cmp(7),
										port1 => s_out_cmp(5),
										sel => FCU_REG_imm,
										portY => s_out_mux(2)
										);
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
	s_not_out_mux(0) <= NOT(s_out_mux(1));
	s_not_out_mux(1) <= NOT(s_out_mux(3));
	
	FCU_MUX_TOP_ALU(1) <= s_out_mux(1) AND FCU_enable;
	FCU_MUX_TOP_ALU(0) <= s_not_out_mux(0) AND s_out_mux(0) AND FCU_enable;
	
	FCU_MUX_BOT_ALU(1) <= s_out_mux(3) AND FCU_enable;
	FCU_MUX_BOT_ALU(0) <= s_not_out_mux(1) AND s_out_mux(2) AND FCU_enable;
-----------------------------------------------------------------------------------------
end Structural;

