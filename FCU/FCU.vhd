----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:53:18 06/12/2018 
-- Design Name: 	 Forwording Control Unit
-- Module Name:    FCU - Behavioral 
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

entity FCU is
	port(
		FCU_enable			: in  std_logic;
		
		FCU_IF_ID_Op		: in  std_logic_vector(5 downto 0);
		FCU_ID_EX_Op		: in  std_logic_vector(5 downto 0);
		FCU_EX_MEM_Op		: in  std_logic_vector(5 downto 0);
		FCU_MEM_WB_Op  	: in  std_logic_vector(5 downto 0);
		
		FCU_IF_ID_6_10		: in  std_logic_vector(4 downto 0);
		FCU_IF_ID_11_15	: in  std_logic_vector(4 downto 0);
		
		FCU_ID_EX_6_10		: in  std_logic_vector(4 downto 0);
		FCU_ID_EX_11_15	: in  std_logic_vector(4 downto 0);
		
		FCU_EX_MEM_11_15	: in  std_logic_vector(4 downto 0);
		FCU_EX_MEM_16_20	: in  std_logic_vector(4 downto 0);
		
		FCU_MEM_WB_11_15	: in  std_logic_vector(4 downto 0);
		FCU_MEM_WB_16_20	: in  std_logic_vector(4 downto 0);
		
		FCU_IF_ID_MUX		: out std_logic_vector(1 downto 0);
		
		FCU_ID_EX_TOP_MUX	: out std_logic_vector(1 downto 0);
		FCU_ID_EX_BOT_MUX : out std_logic_vector(1 downto 0);
		
		FCU_EX_MEM_MUX		: out std_logic;
		
		FCU_insert_stall	: out std_logic
	);
end FCU;

architecture Behavioral of FCU is

	constant OP_REG : std_logic_vector(5 downto 0) := "000000"; --0x00
	constant OP_MUL : std_logic_vector(5 downto 0) := "000001"; --0x01
	-------------------------------------------------------------------
	constant OP_ADDI: std_logic_vector(5 downto 0) := "001000"; --0x08
	constant OP_LHI : std_logic_vector(5 downto 0) := "001111"; --0x0f
	
	constant OP_SLLI: std_logic_vector(5 downto 0) := "?010100?"; --0x14
	constant OP_SGEI: std_logic_vector(5 downto 0) := "011101"; --0x1d
	
	constant OP_SLTUI: std_logic_vector(5 downto 0) := "111010"; --0x3a
	constant OP_SGEUI: std_logic_vector(5 downto 0) := "111101"; --0x3d
	-------------------------------------------------------------------
	constant OP_J   : std_logic_vector(5 downto 0) := "000010"; --0x02
	constant OP_BNEZ: std_logic_vector(5 downto 0) := "000101"; --0x05
	
	constant OP_JR  : std_logic_vector(5 downto 0) := "010010"; --0x12
	constant OP JALR: std_logic_vector(5 downto 0) := "010011"; --0x03
	-------------------------------------------------------------------
	constant OP_LB  : std_logic_vector(5 downto 0) := "100000"; --0x20
	constant OP_LW	 : std_logic_vector(5 downto 0) := "100011"; --0x23
	-------------------------------------------------------------------
	constant OP_SB  : std_logic_vector(5 downto 0) := "101000"; --0x28
	constant OP_SW	 : std_logic_vector(5 downto 0) := "101011"; --0x2b
	

begin

	IF_ID_proc : process(FCU_enable, FCU_IF_ID_Op, FCU_EX_MEM_Op, FCU_MEM_WB_Op, FCU_IF_ID_6_10,
								FCU_EX_MEM_16_20, FCU_MEM_WB_11_15)
					 begin
						if(FCU_enable = '1') then
							if(((FCU_IF_ID_Op >= OP_J) AND (FCU_IF_ID_Op <= OP_BNEZ)) OR FCU_IF_ID_Op = OP_JR OR FCU_IF_ID_Op = JALR) then
								--if IF/ID.Op = JMP
								if((FCU_EX_MEM_Op = OP_REG) OR (FCU_EX_MEM_Op = OP_MUL)) then
									-- if EX/MEM.Op = REG
									if(FCU_EX_MEM_16_20 = FCU_IF_ID_6_10) then
										FCU_insert_stall <= '1';
									end if;
								end if;
								
							end if;
						end if;
				
	end process;

end Behavioral;

