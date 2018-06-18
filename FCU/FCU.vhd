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
		FCU_ID_EX_16_20	: in  std_logic_vector(4 downto 0);
		
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
	constant OP_XORI : std_logic_vector(5 downto 0):= "001110"; --0x0e
	
	constant OP_SLLI: std_logic_vector(5 downto 0) := "010100"; --0x14
	constant OP_SGEI: std_logic_vector(5 downto 0) := "011101"; --0x1d
	
	constant OP_SLTUI: std_logic_vector(5 downto 0) := "111010"; --0x3a
	constant OP_SGEUI: std_logic_vector(5 downto 0) := "111101"; --0x3d
	-------------------------------------------------------------------
	constant OP_J   : std_logic_vector(5 downto 0) := "000010"; --0x02
	constant OP_BNEZ: std_logic_vector(5 downto 0) := "000101"; --0x05
	
	constant OP_JR  : std_logic_vector(5 downto 0) := "010010"; --0x12
	constant OP_JALR: std_logic_vector(5 downto 0) := "010011"; --0x13
	-------------------------------------------------------------------
	constant OP_LB  : std_logic_vector(5 downto 0) := "100000"; --0x20
	constant OP_LHU : std_logic_vector(5 downto 0) := "100101"; --0x25
	-------------------------------------------------------------------
	constant OP_SB  : std_logic_vector(5 downto 0) := "101000"; --0x28
	constant OP_SW	 : std_logic_vector(5 downto 0) := "101011"; --0x2b
	
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
					
					FCU_insert_stall <= '0';
					if(FCU_enable = '1') then
						
						if(s_id_ex_is_load = '1') then
							if(s_if_id_is_reg = '1') then
								if((FCU_ID_EX_11_15 = FCU_IF_ID_6_10) OR (FCU_ID_EX_11_15 = FCU_IF_ID_11_15)) then
									FCU_insert_stall <= '1';
								end if;
							end if;
							
							if((s_if_id_is_imm = '1') OR (s_if_id_is_load = '1') OR (s_if_id_is_store = '1') OR (s_if_id_is_jmp = '1')) then
								if(FCU_ID_EX_11_15 = FCU_IF_ID_6_10) then
									FCU_insert_stall <= '1';
								end if;
							end if;
							
						end if;
						
						if(s_ex_mem_is_load = '1') then
							if(s_if_id_is_jmp = '1') then
								if(FCU_EX_MEM_11_15 = FCU_IF_ID_6_10) then
									FCU_insert_stall <= '1';
								end if;
							end if;
						end if; 
						
						if(s_if_id_is_jmp = '1') then
							if(s_id_ex_is_reg = '1') then
								if(FCU_ID_EX_16_20 = FCU_IF_ID_6_10) then
									FCU_insert_stall <= '1';
								end if;
							end if;
							
							if((s_id_ex_is_imm = '1') OR (s_id_ex_is_store = '1')) then
								if(FCU_EX_MEM_11_15 = FCU_IF_ID_6_10) then
									FCU_insert_stall <= '1';
								end if;
							end if;
						end if;
						
					end if;
	end process;

	IF_ID_proc : process(FCU_enable, FCU_IF_ID_Op, FCU_EX_MEM_Op, FCU_MEM_WB_Op, FCU_IF_ID_6_10,
								FCU_EX_MEM_16_20, FCU_MEM_WB_11_15)
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
								FCU_MEM_WB_11_15)
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
								  FCU_MEM_WB_16_20, FCU_EX_MEM_11_15)
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

	process(FCU_IF_ID_Op, FCU_ID_EX_Op, FCU_EX_MEM_Op, FCU_MEM_WB_Op)
	begin 
	-----------------------------------------------------------------------
		if((FCU_IF_ID_Op = OP_REG) OR (FCU_IF_ID_Op = OP_MUL)) then
			s_if_id_is_reg <= '1';
		else
			s_if_id_is_reg <= '0';
		end if;
		
		if((FCU_ID_EX_Op = OP_REG) OR (FCU_ID_EX_Op = OP_MUL)) then
			s_id_ex_is_reg <= '1';
		else
			s_id_ex_is_reg <= '0';
		end if;
		
		if((FCU_EX_MEM_Op = OP_REG) OR (FCU_EX_MEM_Op = OP_MUL)) then
			s_ex_mem_is_reg <= '1';
		else
			s_ex_mem_is_reg <= '0';
		end if;
		
		if((FCU_MEM_WB_Op = OP_REG) OR (FCU_MEM_WB_Op = OP_MUL)) then
			s_mem_wb_is_reg <= '1';
		else
			s_mem_wb_is_reg <= '0';
		end if;
	-----------------------------------------------------------------------
	-----------------------------------------------------------------------
		if(((FCU_IF_ID_Op >= OP_ADDI) AND (FCU_IF_ID_Op <= OP_XORI)) OR
			((FCU_IF_ID_Op >= OP_SLLI) AND (FCU_IF_ID_Op <= OP_SGEI)) OR
			((FCU_IF_ID_Op >= OP_SLTUI) AND (FCU_IF_ID_Op <= OP_SGEUI))) then
			s_if_id_is_imm <= '1';
		else 
			s_if_id_is_imm <= '0';
		end if;
		
		if(((FCU_ID_EX_Op >= OP_ADDI) AND (FCU_ID_EX_Op <= OP_XORI)) OR
			((FCU_ID_EX_Op >= OP_SLLI) AND (FCU_ID_EX_Op <= OP_SGEI)) OR
			((FCU_ID_EX_Op >= OP_SLTUI) AND (FCU_ID_EX_Op <= OP_SGEUI))) then
			s_id_ex_is_imm <= '1';
		else 
			s_id_ex_is_imm <= '0';
		end if;
		
		if(((FCU_EX_MEM_Op >= OP_ADDI) AND (FCU_EX_MEM_Op <= OP_XORI)) OR
			((FCU_EX_MEM_Op >= OP_SLLI) AND (FCU_EX_MEM_Op <= OP_SGEI)) OR
			((FCU_EX_MEM_Op >= OP_SLTUI) AND (FCU_EX_MEM_Op <= OP_SGEUI))) then
			s_ex_mem_is_imm <= '1';
		else 
			s_ex_mem_is_imm<= '0';
		end if;
		
		if(((FCU_MEM_WB_Op >= OP_ADDI) AND (FCU_MEM_WB_Op <= OP_XORI)) OR
			((FCU_MEM_WB_Op >= OP_SLLI) AND (FCU_MEM_WB_Op <= OP_SGEI)) OR
			((FCU_MEM_WB_Op >= OP_SLTUI) AND (FCU_MEM_WB_Op <= OP_SGEUI))) then
			s_mem_wb_is_imm <= '1';
		else 
			s_mem_wb_is_imm<= '0';
		end if;
		-----------------------------------------------------------------------
		-----------------------------------------------------------------------
		if((FCU_IF_ID_Op = OP_LHU) OR (FCU_IF_ID_Op = OP_LB)) then
			s_if_id_is_load <= '1';
		else
			s_if_id_is_load <= '0';
		end if;
		
		if((FCU_ID_EX_Op = OP_LHU) OR (FCU_ID_EX_Op = OP_LB)) then
			s_id_ex_is_load <= '1';
		else
			s_id_ex_is_load <= '0';
		end if;
		
		if((FCU_EX_MEM_Op = OP_LHU) OR (FCU_EX_MEM_Op = OP_LB)) then
			s_ex_mem_is_load <= '1';
		else
			s_ex_mem_is_load <= '0';
		end if;
		
		if((FCU_MEM_WB_Op = OP_LHU) OR (FCU_MEM_WB_Op = OP_LB)) then
			s_mem_wb_is_load <= '1';
		else
			s_mem_wb_is_load <= '0';
		end if;
		-----------------------------------------------------------------------
		-----------------------------------------------------------------------
		if((FCU_IF_ID_Op = OP_SW) OR (FCU_IF_ID_Op = OP_SB)) then
			s_if_id_is_store <= '1';
		else
			s_if_id_is_store <= '0';
		end if;
		
		if((FCU_ID_EX_Op = OP_SW) OR (FCU_ID_EX_Op = OP_SB)) then
			s_id_ex_is_store <= '1';
		else
			s_id_ex_is_store <= '0';
		end if;
		
		if((FCU_EX_MEM_Op = OP_SW) OR (FCU_EX_MEM_Op = OP_SB)) then
			s_ex_mem_is_store <= '1';
		else
			s_ex_mem_is_store <= '0';
		end if;
		
		if((FCU_MEM_WB_Op = OP_SW) OR (FCU_MEM_WB_Op = OP_SB)) then
			s_mem_wb_is_store <= '1';
		else
			s_mem_wb_is_store <= '0';
		end if;
		-----------------------------------------------------------------------
		-----------------------------------------------------------------------
		if(((FCU_IF_ID_Op >= OP_J) AND (FCU_IF_ID_Op <= OP_BNEZ)) OR (FCU_IF_ID_Op = OP_JR) OR (FCU_IF_ID_Op = OP_JALR)) then
			s_if_id_is_jmp <= '1';
		else 
			s_if_id_is_jmp <= '0';
		end if;
		
		if(((FCU_ID_EX_Op >= OP_J) AND (FCU_ID_EX_Op <= OP_BNEZ)) OR (FCU_ID_EX_Op = OP_JR) OR (FCU_ID_EX_Op = OP_JALR)) then
			s_id_ex_is_jmp <= '1';
		else 
			s_id_ex_is_jmp <= '0';
		end if;
		
		if(((FCU_EX_MEM_Op >= OP_J) AND (FCU_EX_MEM_Op <= OP_BNEZ)) OR (FCU_EX_MEM_Op = OP_JR) OR (FCU_EX_MEM_Op = OP_JALR)) then
			s_ex_mem_is_jmp <= '1';
		else 
			s_ex_mem_is_jmp <= '0';
		end if;
		
		if(((FCU_MEM_WB_Op >= OP_J) AND (FCU_MEM_WB_Op <= OP_BNEZ)) OR (FCU_MEM_WB_Op = OP_JR) OR (FCU_MEM_WB_Op = OP_JALR)) then
			s_mem_wb_is_jmp <= '1';
		else 
			s_mem_wb_is_jmp <= '0';
		end if;
		-----------------------------------------------------------------------
	end process;

end Behavioral;

