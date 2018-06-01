----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Alessandro Salvato
-- 
-- Create Date:    17:53:07 04/21/2017 
-- Design Name: 
-- Module Name:    P4Adder - Behavioral 
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

entity P4Adder is
	GENERIC(N: integer := 32);
	PORT(
		A : IN std_logic_vector(N-1 downto 0);
		B : IN std_logic_vector(N-1 downto 0);
		c_in: IN std_logic;
		c_out: OUT std_logic;
		Sum : OUT std_logic_vector(N-1 downto 0)
	);
end P4Adder;

architecture Behavioral of P4Adder is

	constant input_parallelism : integer := N;	-- <-------
	constant carry_parallelism : integer := N/4;	-- <-------
	constant RCA_parallelism : integer := input_parallelism/carry_parallelism;
	
	component CarryGenerator is
	Generic(N: integer := 32;	--parallelismo input
	        K: integer := 8); --parallelismo carry
	Port ( A : in  STD_LOGIC_VECTOR (N-1 downto 0);
                 B: in  STD_LOGIC_VECTOR (N-1 downto 0);
                 c_in : in  STD_LOGIC;
                 CarryVector : out  STD_LOGIC_VECTOR (K-1 downto 0));
	end component;
	
	component CarrySelect is
	generic (N : integer := 32;	--input parallelism
	         K : integer := 4);	--RCA parallelism
	port (A : in std_logic_vector(N-1 downto 0);	
	      B : in std_logic_vector(N-1 downto 0);	
	      Cin : in std_logic_vector((N/K)-1 downto 0);	--carry parallelism
	      S : out std_logic_vector(N-1 downto 0));
	end component;
	
	signal carry_tmp: std_logic_vector(carry_parallelism downto 0);
	
begin
	
	CG: CarryGenerator GENERIC MAP (N => input_parallelism, K => carry_parallelism)
		         PORT MAP (A => A, B => B, 
		                   c_in => c_in, 
			         CarryVector => carry_tmp(carry_parallelism downto 1));
	
	c_out <= carry_tmp(carry_parallelism);
	carry_tmp(0) <= c_in;
	
	CS: CarrySelect GENERIC MAP(N => input_parallelism, K => RCA_parallelism)
		      PORT MAP(A => A, B => B, Cin => carry_tmp(carry_parallelism-1 downto 0), S => Sum);


end Behavioral;

