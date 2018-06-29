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
-- Revision: 0.2
-- Revision
--				0.2 - Added FCU_IF_ID_is_branch
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
		FCU_ID_EX_16_20	: in  std_logic_vector(4 downto 0);
		
		FCU_EX_MEM_11_15	: in  std_logic_vector(4 downto 0);
		FCU_EX_MEM_16_20	: in  std_logic_vector(4 downto 0);
		
		FCU_MEM_WB_11_15	: in  std_logic_vector(4 downto 0);
		FCU_MEM_WB_16_20	: in  std_logic_vector(4 downto 0);
		
		FCU_IF_ID_MUX		: out std_logic_vector(1 downto 0);
		
		FCU_ID_EX_TOP_MUX	: out std_logic_vector(1 downto 0);
		FCU_ID_EX_BOT_MUX : out std_logic_vector(1 downto 0);
		
		FCU_EX_MEM_MUX		: out std_logic;
		
		FCU_IF_ID_is_branch	: out std_logic;
		FCU_insert_stall	: out std_logic --true when '0'
	);
end FCU;

architecture Behavioral of FCU is

--	constant OPCODE_REG : std_logic_vector(5 downto 0) := "000000"; --0x00
--	constant OPCODE_MUL : std_logic_vector(5 downto 0) := "000001"; --0x01
--	-------------------------------------------------------------------
--	constant OPCODE_ADDI: std_logic_vector(5 downto 0) := "001000"; --0x08
--	constant OPCODE_XORI : std_logic_vector(5 downto 0):= "001110"; --0x0e
--	
--	constant OPCODE_SLLI: std_logic_vector(5 downto 0) := "010100"; --0x14
--	constant OPCODE_SGEI: std_logic_vector(5 downto 0) := "011101"; --0x1d
--	
--	constant OPCODE_SLTUI: std_logic_vector(5 downto 0) := "111010"; --0x3a
--	constant OPCODE_SGEUI: std_logic_vector(5 downto 0) := "111101"; --0x3d
--	
--	constant OPCODE_LAHI	: std_logic_vector(5 downto 0) := "111100"; --0xFC
--	constant OPCODE_LAHIU: std_logic_vector(5 downto 0) := "111101"; --0xFD
--	-------------------------------------------------------------------
--	constant OPCODE_J   : std_logic_vector(5 downto 0) := "000010"; --0x02
--	constant OPCODE_BNEZ: std_logic_vector(5 downto 0) := "000101"; --0x05
--	
--	constant OPCODE_JR  : std_logic_vector(5 downto 0) := "010010"; --0x12
--	constant OPCODE_JALR: std_logic_vector(5 downto 0) := "010011"; --0x13
--	-------------------------------------------------------------------
--	constant OPCODE_LB  : std_logic_vector(5 downto 0) := "100000"; --0x20
--	constant OPCODE_LHU : std_logic_vector(5 downto 0) := "100101"; --0x25
--	-------------------------------------------------------------------
--	constant OPCODE_SB  : std_logic_vector(5 downto 0) := "101000"; --0x28
--	constant OPCODE_SW	 : std_logic_vector(5 downto 0) := "101011"; --0x2b
	
	signal s_if_id_is_reg : std_logic;
	signal s_id_ex_is_reg : std_logic;
	signal s_ex_mem_is_reg : std_logic;
	signal s_mem_wb_is_reg : std_logic;
	
	signal s_if_id_is_imm : std_logic;
	signal s_id_ex_is_imm : std_logic;
	signal s_ex_mem_is_imm : std_logic;
	signal s_mem_wb_is_imm : std_logic;
	
	signal s_if_id_is_load : std_logic;
	signal s_id_ex_is_load : std_logic;
	signal s_ex_mem_is_load : std_logic;
	signal s_mem_wb_is_load : std_logic;
	
	signal s_if_id_is_store : std_logic;
	signal s_id_ex_is_store : std_logic;
	signal s_ex_mem_is_store : std_logic;
	signal s_mem_wb_is_store : std_logic;
	
	signal s_if_id_is_jmp : std_logic;
	signal s_id_ex_is_jmp : std_logic;
	signal s_ex_mem_is_jmp : std_logic; 
	signal s_mem_wb_is_jmp : std_logic;
	

begin
	
	STALL_proc : process(FCU_enable, FCU_IF_ID_Op, FCU_ID_EX_Op, FCU_EX_MEM_Op, FCU_IF_ID_6_10, 
								FCU_IF_ID_11_15, FCU_ID_EX_11_15, FCU_EX_MEM_11_15, FCU_ID_EX_16_20)
					 begin
					
					FCU_insert_stall <= '1';
					if(FCU_enable = '1') then
						
						if(s_id_ex_is_load = '1') then
							if(s_if_id_is_reg = '1') then
								if((FCU_ID_EX_11_15 = FCU_IF_ID_6_10) OR (FCU_ID_EX_11_15 = FCU_IF_ID_11_15)) then
									FCU_insert_stall <= '0';
								end if;
							end if;
							
							if((s_if_id_is_imm = '1') OR (s_if_id_is_load = '1') OR (s_if_id_is_store = '1') OR (s_if_id_is_jmp = '1')) then
								if(FCU_ID_EX_11_15 = FCU_IF_ID_6_10) then
									FCU_insert_stall <= '0';
								end if;
							end if;
							
						end if;
						
						if(s_ex_mem_is_load = '1') then
							if(s_if_id_is_jmp = '1') then
								if(FCU_EX_MEM_11_15 = FCU_IF_ID_6_10) then
									FCU_insert_stall <= '0';
								end if;
							end if;
						end if; 
						
						if(s_if_id_is_jmp = '1') then
							if(s_id_ex_is_reg = '1') then
								if(FCU_ID_EX_16_20 = FCU_IF_ID_6_10) then
									FCU_insert_stall <= '0';
								end if;
							end if;
							
							if((s_id_ex_is_imm = '1') OR (s_id_ex_is_store = '1')) then
								if(FCU_EX_MEM_11_15 = FCU_IF_ID_6_10) then
									FCU_insert_stall <= '0';
								end if;
							end if;
						end if;
						
					end if;
	end process;

	IF_ID_proc : process(FCU_enable, FCU_IF_ID_Op, FCU_EX_MEM_Op, FCU_MEM_WB_Op, FCU_IF_ID_6_10,
								FCU_EX_MEM_16_20, FCU_MEM_WB_11_15, s_if_id_is_jmp, s_ex_mem_is_reg, s_ex_mem_is_imm, s_mem_wb_is_load)
					 begin
					 
						FCU_IF_ID_MUX <= "00";
						if(FCU_enable = '1') then
							if(s_if_id_is_jmp = '1') then
								if(s_ex_mem_is_reg = '1') then
									if(FCU_EX_MEM_16_20 = FCU_IF_ID_6_10) then
										FCU_IF_ID_MUX <= "01";
									end if;
								end if;
								if(s_ex_mem_is_imm = '1') then
									if(FCU_EX_MEM_11_15 = FCU_IF_ID_6_10) then
										FCU_IF_ID_MUX <= "01";
									end if;
								end if;

--								if(s_id_ex_is_imm = '1') then
--									if(FCU_ID_EX_11_15 = FCU_IF_ID_6_10) then
--										FCU_IF_ID_MUX <= "01";
--									end if;
--								end if;
								
								if(s_mem_wb_is_load = '1') then
									if(FCU_MEM_WB_11_15 = FCU_IF_ID_6_10) then
										FCU_IF_ID_MUX <= "10";
									end if;
								end if;
							end if;
						end if;		
	end process;
	
	ID_EX_proc : process(FCU_enable, FCU_EX_MEM_Op, FCU_ID_EX_Op, FCU_EX_MEM_16_20, FCU_ID_EX_6_10,
								FCU_ID_EX_11_15, FCU_EX_MEM_11_15, FCU_MEM_WB_Op, FCU_MEM_WB_16_20,
								FCU_MEM_WB_11_15, s_mem_wb_is_reg, s_id_ex_is_reg, s_id_ex_is_imm, s_id_ex_is_load, s_id_ex_is_store,
								s_mem_wb_is_imm, s_mem_wb_is_load, s_ex_mem_is_reg, s_ex_mem_is_imm)
					 begin
					 
					 FCU_ID_EX_TOP_MUX <= "00";
					 FCU_ID_EX_BOT_MUX <= "00";
					 
					 if(FCU_enable = '1') then
						-----------------------------------
						-----------------------------------
						if(s_mem_wb_is_reg = '1') then
							if((s_id_ex_is_reg = '1') OR (s_id_ex_is_imm = '1') OR (s_id_ex_is_load = '1') OR (s_id_ex_is_store = '1')) then
								if(FCU_MEM_WB_16_20 = FCU_ID_EX_6_10) then
									FCU_ID_EX_TOP_MUX <= "10";
								end if;
							end if;
							if(s_id_ex_is_reg = '1') then
								if(FCU_MEM_WB_16_20 = FCU_ID_EX_11_15) then
									FCU_ID_EX_BOT_MUX <= "10";
								end if;
							end if;
						end if;
						-----------------------------------
						if((s_mem_wb_is_imm = '1') OR (s_mem_wb_is_load = '1')) then
							if((s_id_ex_is_reg = '1') OR (s_id_ex_is_imm = '1') OR (s_id_ex_is_load = '1') OR (s_id_ex_is_store = '1')) then
								if(FCU_MEM_WB_11_15 = FCU_ID_EX_6_10) then
									FCU_ID_EX_TOP_MUX <= "10";
								end if;
							end if;
							if(s_id_ex_is_reg = '1') then
								if(FCU_MEM_WB_11_15 = FCU_ID_EX_11_15) then
									FCU_ID_EX_BOT_MUX <= "10";
								end if;
							end if; 
						end if;
						-----------------------------------
						-----------------------------------
						if(s_ex_mem_is_reg = '1') then
							if((s_id_ex_is_reg = '1') OR (s_id_ex_is_imm = '1') OR (s_id_ex_is_load = '1') OR (s_id_ex_is_store = '1')) then
								if(FCU_EX_MEM_16_20 = FCU_ID_EX_6_10) then
									FCU_ID_EX_TOP_MUX <= "01";
								end if;
							end if;
							if(s_id_ex_is_reg = '1') then
								if(FCU_EX_MEM_16_20 = FCU_ID_EX_11_15) then
									FCU_ID_EX_BOT_MUX <= "01";
								end if;
							end if;
						end if;
						-----------------------------------
						if(s_ex_mem_is_imm = '1') then
							if((s_id_ex_is_reg = '1') OR (s_id_ex_is_imm = '1') OR (s_id_ex_is_load = '1') OR (s_id_ex_is_store = '1')) then
								if(FCU_EX_MEM_11_15 = FCU_ID_EX_6_10) then
									FCU_ID_EX_TOP_MUX <= "01";
								end if;
							end if;
							if(s_id_ex_is_reg = '1') then
								if(FCU_EX_MEM_11_15 = FCU_ID_EX_11_15) then
									FCU_ID_EX_BOT_MUX <= "01";
								end if;
							end if;
						end if;
						-----------------------------------
					 end if;
	
	end process;
	
	EX_MEM_proc : process (FCU_enable, FCU_EX_MEM_Op, FCU_MEM_WB_Op, FCU_MEM_WB_11_15, 
								  FCU_MEM_WB_16_20, FCU_EX_MEM_11_15, s_ex_mem_is_store, s_mem_wb_is_reg,
								  s_mem_wb_is_imm, s_mem_wb_is_load)
	begin
		FCU_EX_MEM_MUX <= '0';
		
		if(FCU_enable = '1') then
			if(s_ex_mem_is_store = '1') then
				
				if(s_mem_wb_is_reg = '1') then
					if(FCU_MEM_WB_16_20 = FCU_EX_MEM_11_15) then
						FCU_EX_MEM_MUX <= '1';
					end if;
				end if;
				
				if((s_mem_wb_is_imm = '1') OR (s_mem_wb_is_load = '1')) then
					if(FCU_MEM_WB_11_15 = FCU_EX_MEM_11_15) then
						FCU_EX_MEM_MUX <= '1';
					end if;
				end if;
			
			end if;
			
		end if;
	end process;

	process(FCU_IF_ID_Op, FCU_ID_EX_Op, FCU_EX_MEM_Op, FCU_MEM_WB_Op, FCU_enable)
	begin 
	-----------------------------------------------------------------------
		if(FCU_enable = '1') then
			if((FCU_IF_ID_Op = OPCODE_REG) OR (FCU_IF_ID_Op = OPCODE_MUL)) then
				s_if_id_is_reg <= '1';
			else
				s_if_id_is_reg <= '0';
			end if;
			
			if((FCU_ID_EX_Op = OPCODE_REG) OR (FCU_ID_EX_Op = OPCODE_MUL)) then
				s_id_ex_is_reg <= '1';
			else
				s_id_ex_is_reg <= '0';
			end if;
			
			if((FCU_EX_MEM_Op = OPCODE_REG) OR (FCU_EX_MEM_Op = OPCODE_MUL)) then
				s_ex_mem_is_reg <= '1';
			else
				s_ex_mem_is_reg <= '0';
			end if;
			
			if((FCU_MEM_WB_Op = OPCODE_REG) OR (FCU_MEM_WB_Op = OPCODE_MUL)) then
				s_mem_wb_is_reg <= '1';
			else
				s_mem_wb_is_reg <= '0';
			end if;
		-----------------------------------------------------------------------
		-----------------------------------------------------------------------
			if(((FCU_IF_ID_Op >= OPCODE_ADDI) AND (FCU_IF_ID_Op <= OPCODE_XORI)) OR
				((FCU_IF_ID_Op >= OPCODE_SRLI) AND (FCU_IF_ID_Op <= OPCODE_SGEI)) OR
				((FCU_IF_ID_Op >= OPCODE_SLTUI) AND (FCU_IF_ID_Op <= OPCODE_SGEUI)) OR
				(FCU_IF_ID_Op = OPCODE_LAHI) OR (FCU_IF_ID_Op = OPCODE_LAHIU) OR (FCU_IF_ID_Op = OPCODE_SLLI)) then
				s_if_id_is_imm <= '1';
			else 
				s_if_id_is_imm <= '0';
			end if;
			
			if(((FCU_ID_EX_Op >= OPCODE_ADDI) AND (FCU_ID_EX_Op <= OPCODE_XORI)) OR
				((FCU_ID_EX_Op >= OPCODE_SRLI) AND (FCU_ID_EX_Op <= OPCODE_SGEI)) OR
				((FCU_ID_EX_Op >= OPCODE_SLTUI) AND (FCU_ID_EX_Op <= OPCODE_SGEUI)) OR
				(FCU_ID_EX_Op = OPCODE_LAHI) OR (FCU_ID_EX_Op = OPCODE_LAHIU) OR (FCU_ID_EX_Op = OPCODE_SLLI) ) then
				s_id_ex_is_imm <= '1';
			else 
				s_id_ex_is_imm <= '0';
			end if;
			
			if(((FCU_EX_MEM_Op >= OPCODE_ADDI) AND (FCU_EX_MEM_Op <= OPCODE_XORI)) OR
				((FCU_EX_MEM_Op >= OPCODE_SRLI) AND (FCU_EX_MEM_Op <= OPCODE_SGEI)) OR
				((FCU_EX_MEM_Op >= OPCODE_SLTUI) AND (FCU_EX_MEM_Op <= OPCODE_SGEUI)) OR
				(FCU_EX_MEM_Op = OPCODE_LAHI) OR (FCU_EX_MEM_Op = OPCODE_LAHIU) OR (FCU_EX_MEM_Op = OPCODE_SLLI)) then
				s_ex_mem_is_imm <= '1';
			else 
				s_ex_mem_is_imm<= '0';
			end if;
			
			if(((FCU_MEM_WB_Op >= OPCODE_ADDI) AND (FCU_MEM_WB_Op <= OPCODE_XORI)) OR
				((FCU_MEM_WB_Op >= OPCODE_SRLI) AND (FCU_MEM_WB_Op <= OPCODE_SGEI)) OR
				((FCU_MEM_WB_Op >= OPCODE_SLTUI) AND (FCU_MEM_WB_Op <= OPCODE_SGEUI)) OR
				(FCU_MEM_WB_Op = OPCODE_LAHI) OR (FCU_MEM_WB_Op = OPCODE_LAHIU) OR (FCU_MEM_WB_Op = OPCODE_SLLI)) then
				s_mem_wb_is_imm <= '1';
			else 
				s_mem_wb_is_imm<= '0';
			end if;
			-----------------------------------------------------------------------
			-----------------------------------------------------------------------
			if((FCU_IF_ID_Op = OPCODE_LHU) OR (FCU_IF_ID_Op = OPCODE_LB)) then
				s_if_id_is_load <= '1';
			else
				s_if_id_is_load <= '0';
			end if;
			
			if((FCU_ID_EX_Op = OPCODE_LHU) OR (FCU_ID_EX_Op = OPCODE_LB)) then
				s_id_ex_is_load <= '1';
			else
				s_id_ex_is_load <= '0';
			end if;
			
			if((FCU_EX_MEM_Op = OPCODE_LHU) OR (FCU_EX_MEM_Op = OPCODE_LB)) then
				s_ex_mem_is_load <= '1';
			else
				s_ex_mem_is_load <= '0';
			end if;
			
			if((FCU_MEM_WB_Op = OPCODE_LHU) OR (FCU_MEM_WB_Op = OPCODE_LB)) then
				s_mem_wb_is_load <= '1';
			else
				s_mem_wb_is_load <= '0';
			end if;
			-----------------------------------------------------------------------
			-----------------------------------------------------------------------
			if((FCU_IF_ID_Op = OPCODE_SW) OR (FCU_IF_ID_Op = OPCODE_SB)) then
				s_if_id_is_store <= '1';
			else
				s_if_id_is_store <= '0';
			end if;
			
			if((FCU_ID_EX_Op = OPCODE_SW) OR (FCU_ID_EX_Op = OPCODE_SB)) then
				s_id_ex_is_store <= '1';
			else
				s_id_ex_is_store <= '0';
			end if;
			
			if((FCU_EX_MEM_Op = OPCODE_SW) OR (FCU_EX_MEM_Op = OPCODE_SB)) then
				s_ex_mem_is_store <= '1';
			else
				s_ex_mem_is_store <= '0';
			end if;
			
			if((FCU_MEM_WB_Op = OPCODE_SW) OR (FCU_MEM_WB_Op = OPCODE_SB)) then
				s_mem_wb_is_store <= '1';
			else
				s_mem_wb_is_store <= '0';
			end if;
			-----------------------------------------------------------------------
			-----------------------------------------------------------------------
			if(((FCU_IF_ID_Op >= OPCODE_J) AND (FCU_IF_ID_Op <= OPCODE_BNEZ)) OR (FCU_IF_ID_Op = OPCODE_JR) OR (FCU_IF_ID_Op = OPCODE_JALR)) then
				s_if_id_is_jmp <= '1';
			else 
				s_if_id_is_jmp <= '0';
			end if;
			
			if(((FCU_ID_EX_Op >= OPCODE_J) AND (FCU_ID_EX_Op <= OPCODE_BNEZ)) OR (FCU_ID_EX_Op = OPCODE_JR) OR (FCU_ID_EX_Op = OPCODE_JALR)) then
				s_id_ex_is_jmp <= '1';
			else 
				s_id_ex_is_jmp <= '0';
			end if;
			
			if(((FCU_EX_MEM_Op >= OPCODE_J) AND (FCU_EX_MEM_Op <= OPCODE_BNEZ)) OR (FCU_EX_MEM_Op = OPCODE_JR) OR (FCU_EX_MEM_Op = OPCODE_JALR)) then
				s_ex_mem_is_jmp <= '1';
			else 
				s_ex_mem_is_jmp <= '0';
			end if;
			
			if(((FCU_MEM_WB_Op >= OPCODE_J) AND (FCU_MEM_WB_Op <= OPCODE_BNEZ)) OR (FCU_MEM_WB_Op = OPCODE_JR) OR (FCU_MEM_WB_Op = OPCODE_JALR)) then
				s_mem_wb_is_jmp <= '1';
			else 
				s_mem_wb_is_jmp <= '0';
			end if;
			-----------------------------------------------------------------------
			
			if((FCU_IF_ID_Op = OPCODE_BNEZ) OR (FCU_IF_ID_Op = OPCODE_BEQZ)) then
				FCU_IF_ID_is_branch <= '1';
			else
				FCU_IF_ID_is_branch <= '0';
			end if;
		end if;
	end process;

end Behavioral;

