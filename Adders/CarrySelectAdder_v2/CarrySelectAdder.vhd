----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:52:29 10/07/2017 
-- Design Name: 
-- Module Name:    CarrySelectAdder - Behavioral 
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

entity CarrySelectAdder is
	generic(N: integer := 4);
	port(
		A	: in  std_logic_vector(N-1 downto 0);
		B	: in  std_logic_vector(N-1 downto 0);
		Cin	: in  std_logic;
		Cout	: out std_logic;
		Sum	: out  std_logic_vector(N-1 downto 0)
	);
end CarrySelectAdder;

architecture Structural of CarrySelectAdder is
	
	component CarryLookahead_Flat is
	port(
		A	: in  std_logic_vector(3 downto 0);
		B	: in  std_logic_vector(3 downto 0);
		Cin	: in  std_logic;
		Cout 	: out std_logic;
		Sum	: out  std_logic_vector(3 downto 0)
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
	
	component Mux_1Bit_2X1 is
	Port ( port0 : in  STD_LOGIC;
           port1 : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           portY : out  STD_LOGIC);
	end component;
	
	signal s_c0, s_c1 		: std_logic;
	signal s_sum0, s_sum1 	: std_logic_vector(N-1 downto 0);
	
begin

	CLA0 : CarryLookahead_Flat  PORT MAP(
					A => A,
					B => B,
					Cin => '0',
					Cout => s_c0,
					Sum => s_sum0
				);
	CLA1 : CarryLookahead_Flat PORT MAP(
					A => A,
					B => B,
					Cin => '1',
					Cout => s_c1,
					Sum => s_sum1
				);
	MUXC : Mux_1Bit_2X1 PORT MAP (
					port0 => s_c0,
					port1 => s_c1,
					sel => Cin,
					portY => Cout
			);
	MUXS : Mux_NBit_2X1 GENERIC MAP (NBIT_IN => N)
			PORT MAP (
					port0 => s_sum0,
					port1 => s_sum1,
					sel => Cin,
					portY => Sum
			);


end Structural;

