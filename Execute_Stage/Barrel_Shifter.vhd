----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Alessandro Salvato
-- 
-- Create Date:    10:43:13 10/21/2017 
-- Design Name: 
-- Module Name:    Barrel_Shifter - Structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision 1.0
-- Additional Comments: 
--	BS_opcode 
--			00 : transparent mode
--			01 : SLR
--			10 : SLL
--			11 : SAR
--
--	Version 0.1 : all components tied up. Ready for testing.
--	Version 0.2 : changed mat_cyc lenght and s_m assignements. T1 passed.
--	Version 0.3 : introduced an output mux in order to select between
--                      a shifted value and a no one. Added a single pin input
--		    BS_is_shift. T1, T2 passed.
--	Version 0.4 : removed BS_is_shift on the pinout. That signal is computed
--		    inside by ORing the two bits of the opcode. It implies 
--		    that the transparent mode is legal just when BS_opcode=00.
--		    T1, T2 passed.
--	Version 0.5 : Changed input muxes assignements in the first stage.
--		    T1, T2, T3 (with proper inputs) passed.
--	Version 0.6 : Changed definition of s_out_mask in third_stage_prepare_cyc.
--		    Inverted the enumeration of the third stage multiplexer.
--		    T1, T2, T3 (with right inputs) passed.
--	Version 1.0 : Running. T1, T2, T3, T4, T5, T6, T7a, T7b passed. This codes
--		    is not yet synthetised. Rubbish code is not yet erased from
--		    the source code.
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

entity Barrel_Shifter is
	generic(NBIT_DATA : integer := 32);
	port(
		BS_data_in	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		BS_opcode		: in  std_logic_vector(1 downto 0); 
		BS_amount		: in  std_logic_vector(log2(NBIT_DATA)-1 downto 0);
		--BS_is_shift	: in  std_logic;
		BS_data_out	: out std_logic_vector(NBIT_DATA-1 downto 0)
	);
end Barrel_Shifter;

architecture Structural of Barrel_Shifter is
	component Mux_NBit_2x1 is
	generic(NBIT_IN: integer := 32);
	port(
		port0	: in  std_logic_vector(NBIT_IN-1 downto 0);
		port1	: in  std_logic_vector(NBIT_IN-1 downto 0);
		sel	: in  std_logic;
		portY	: out std_logic_vector(NBIT_IN-1 downto 0)
	);
	end component;
	
	type matrix_mask 		is array (0 to NBIT_DATA/8 - 1) of std_logic_vector(NBIT_DATA+8-1 downto 0);
	type matrix_sign 		is array (0 to NBIT_DATA/8 + 1) of std_logic_vector(7 downto 0);
	type matrixX2_mask 		is array (0 to NBIT_DATA/8 - 1) of matrix_mask;
	type matrix_out		is array (0 to 7) of std_logic_vector(NBIT_DATA-1 downto 0);
	type matrix_third_stage 	is array (0 to 4) of matrix_out;
	
	constant s_zeros	: std_logic_vector(7 downto 0) := (others => '0'); 
	constant L 	: integer := log2(NBIT_DATA/8);
	
	
	signal s_msb		: std_logic_vector(7 downto 0);
	signal s_masks		: matrix_mask;
	signal s_m		: matrix_sign;
	signal s_mX2		: matrixX2_mask;
	signal s_selected_mask 	: std_logic_vector(NBIT_DATA+8-1 downto 0);
	signal s_selected_mask_right	: std_logic_vector(NBIT_DATA+8-1 downto 0);
	signal s_selected_mask_left	: std_logic_vector(NBIT_DATA+8-1 downto 0);
	signal s_out_mask		: matrix_third_stage;
	signal s_is_shift		: std_logic;
	signal s_amount, s_not_amount	: std_logic_vector(2 downto 0);
	signal s_direction		: std_logic;
	signal s_or_opcode		: std_logic;
	signal s_op0, s_op1		: std_logic;
	signal s_sel_third		: std_logic;
	signal s_sel_out		: std_logic_vector(2 downto 0);
begin

-----------------------------------------------------------------------------------------------------------
	MSB_MUX : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => 8) PORT MAP (
						port0 => (others => '0'),
						port1 => (others => BS_data_in(NBIT_DATA-1)),
						sel => BS_opcode(1), 
						portY => s_msb
						);
-----------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------
	mat_cyc : for i in 0 to NBIT_DATA/8+1 generate
		if0 : if (i = 0) generate
			s_m(i) <= s_zeros;
		end generate if0;
		
		ifi : if (i > 0 AND i < NBIT_DATA/8+1) generate
			s_m(i) <= BS_data_in(i*8-1 downto (i-1)*8);
		end generate ifi; 
		
		ifN : if (i = NBIT_DATA/8+1) generate
			s_m(i) <= s_msb;
		end generate ifN;
	end generate mat_cyc;
-----------------------------------------------------------------------------------------------------------

--FIRST STAGE----------------------------------------------------------------------------------------------

	musk_cyc : for i in 0 to NBIT_DATA/8-1 generate
		mux_cyc : for j in 0 to NBIT_DATA/8 generate -- the inner loop runs a further one wrt the former
		
--		L : if (i = 0) generate
--			MUXi : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => 8) PORT MAP (
--						port0 => s_m(j),
--						port1 => s_m(j+1),
--						sel => BS_opcode(0), 
--						portY => s_masks(i)((j+1)*8-1 downto j*8)
--						);
--		end generate L;
		
		
--		L0 : if (i >= 0) generate
			L1 : if ((j <= i) XOR (j >= NBIT_DATA/8 - i)) generate
				CASE2 : if (j <= i) generate
					MUX2 : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => 8) PORT MAP (
						port0 => s_m(0),
						port1 => s_m(i+j+1),
						sel => BS_opcode(0), 
						portY => s_masks(i)((j+1)*8-1 downto j*8)
						);
				end generate CASE2;
				
				CASE3 : if (j >= NBIT_DATA/8 - i) generate
					MUX3 : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => 8) PORT MAP (
						port0 => s_m(j-i),
						port1 => s_m(NBIT_DATA/8 + 1),
						sel => BS_opcode(0), 
						portY => s_masks(i)((j+1)*8-1 downto j*8)
						);
				end generate CASE3;
			end generate L1;
			
			CASE4 : if ((j<=i) AND (j >= NBIT_DATA/8 - i)) generate
				MUX4 : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => 8) PORT MAP (
						port0 => s_m(0),
						port1 => s_m(NBIT_DATA/8 + 1),
						sel => BS_opcode(0), 
						portY => s_masks(i)((j+1)*8-1 downto j*8)
						);
			end generate CASE4;
			
			CASE1 : if ((j<=i) NOR (j >= NBIT_DATA/8 - i)) generate
				MUX1 : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => 8) PORT MAP (
						port0 => s_m(j-I),
						port1 => s_m(i+j+1),
						sel => BS_opcode(0), 
						portY => s_masks(i)((j+1)*8-1 downto j*8)
						);
			end generate CASE1;
--		end generate L0;
		end generate mux_cyc;
	end generate musk_cyc;

	s_mX2(0) <= s_masks;
-----------------------------------------------------------------------------------------------------------

--SECOND STAGE-------------------------------------------------------------------------------------------
	depth1: for i in 0 to L-1 generate 				
		width1: for j in 0 to NBIT_DATA/8-1 generate 	         
			mod_if1: if(j mod(2**(i+1)) = 0) generate 	
				MUX1: Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA+8) 
				           PORT MAP (port0 => s_mX2(i)(j),
						 port1 => s_mX2(i)(j+2**i),
						 Sel => BS_amount(3+i),
						 portY => s_mX2(i+1)(j));
			end generate mod_if1;
			
		end generate width1;
	end generate depth1;
	
	s_selected_mask_left <= s_mx2(L)(0);
	
	bit_handling_right_cyc : for i in NBIT_DATA+8-1 downto 1 generate
		s_selected_mask_right(i) <= s_mx2(L)(0)(i-1);
	end generate bit_handling_right_cyc;
		s_selected_mask_right(0) <= '0';
	
	MUX_selected_mask : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA+8)
				   PORT MAP (port0 => s_selected_mask_left,
					   port1 => s_selected_mask_right,
					   Sel => BS_opcode(0),
					   portY => s_selected_mask);
	
--	s_selected_mask <= s_mX2(L)(0);
-----------------------------------------------------------------------------------------------------------

--THIRD STAGE----------------------------------------------------------------------------------------------
	third_stage_prepare_cyc : for i in 0 to 7 generate
		--s_out_mask(0)(8-i) <= s_selected_mask(NBIT_DATA+i-1 downto i-1); 
		s_out_mask(0)(7-i) <= s_selected_mask(NBIT_DATA+i downto i+1); 
	end generate third_stage_prepare_cyc;
	
	s_or_opcode <= BS_opcode(1) OR BS_opcode(0);
	
	third_stage_prepare_cyc2 : for i in 0 to 2 generate
		s_amount(i) <= BS_amount(i) AND s_or_opcode;
	end generate third_stage_prepare_cyc2;
	
	s_not_amount_cyc : for i in 0 to 2 generate
		s_not_amount(i) <= NOT(s_amount(i));
	end generate s_not_amount_cyc;
	
	s_op1 <= NOT(BS_opcode(1));
	s_sel_third <= BS_opcode(0) AND s_op1;
	
	MUX3x1 : Mux_NBit_2x1 GENERIC MAP (NBIT_IN => 3)
			  PORT MAP (port0 => s_amount,
				  port1 => s_not_amount,
				  Sel => BS_opcode(0),
				  portY => s_sel_out);
	
	depth2: for i in 0 to 2 generate 				
		width2: for j in 0 to 7 generate 	         
			mod_if2: if(j mod(2**(i+1)) = 0) generate 	
				MUX2: Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) 
				           PORT MAP (port0 => s_out_mask(i)(j),
						 port1 => s_out_mask(i)(j+2**i),
						 Sel => s_sel_out(i), -- to be changed
						 portY => s_out_mask(i+1)(j));
			end generate mod_if2;
			
		end generate width2;
	end generate depth2;
	
	BS_data_out <= s_out_mask(3)(0);
-----------------------------------------------------------------------------------------------------------

--OUTPUT MUX-----------------------------------------------------------------------------------------------
--	s_is_shift <= BS_opcode(0) OR BS_opcode(1);
--	
--	MUX2: Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) 
--				         PORT MAP (port0 => s_selected_mask(NBIT_DATA+8-1 downto 8),
--					         port1 => s_out_mask(3)(0),
--					         Sel => s_is_shift,
--					         portY => BS_data_out);
-----------------------------------------------------------------------------------------------------------

end Structural;

