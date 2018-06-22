----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:51:39 09/18/2017 
-- Design Name: 
-- Module Name:    NShiftRegister - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity NShiftRegisterSISO is
	generic(N: integer := 2);
	port(
		clk     : in  std_logic;
		reset   : in  std_logic;
		enable  : in  std_logic;
		load    : in  std_logic;
		bit_in  : in  std_logic;
		shift   : in  std_logic;
		bit_out : out std_logic
	);
end NShiftRegisterSISO;

architecture Structural of NShiftRegisterSISO is

	component D_FF_rst is
	Port ( D : in  STD_LOGIC;
           clk : in  STD_LOGIC;
	 rst : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           Not_Q : out  STD_LOGIC);
	end component;
	
	component Mux_Bit is
	generic(NBIT_Sel : integer := 2);
	port(
		inputs : in  std_logic_vector(2**NBIT_Sel-1 downto 0);
		sel    : in  std_logic_vector(NBIT_Sel-1 downto 0);
		output : out std_logic
	);
	end component;
	
	constant s_WEAK_UNTAKEN : std_logic_vector(N-1 downto 0) := std_logic_vector(to_unsigned(2**(N-1)-1, N));
	constant s_WEAK_TAKEN   : std_logic_vector(N-1 downto 0) := std_logic_vector(to_unsigned(2**(N-1), N));
	
	type matrix is array (0 to N-1) of std_logic_vector(3 downto 0);
	
	signal s_input_FF  		: std_logic_vector(N-1 downto 0) := (others => '0');
	signal s_output_FF 		: std_logic_vector(N-1 downto 0) := (others => '0');
	signal s_shift_FFF_Tmux	: std_logic_vector(N-1 downto 0) := (others => '0');
	signal s_mantein_FFF_Tmux	: std_logic_vector(N-1 downto 0) := (others => '0');
	signal s_notS, s_notE	: std_logic := '0';
	signal s_a, s_b, s_c, s_d     : std_logic := '0';
	signal s_phi 		: std_logic_vector(1 downto 0) := "11";
	signal s_input_mux		: matrix := (others => (others => '0'));
	
begin

	s_notS <= NOT(shift);
	s_notE <= NOT(enable);
	s_a <= s_notS AND NOT(load);
	s_b <= s_notS AND s_notE;
	s_c <= load AND bit_in;
	s_d <= shift AND s_notE;
	s_phi(0) <= s_a OR s_b OR s_c OR s_d;



--	s_phi(0) <= NOT(shift) OR (load AND bit_in);
	s_phi(1) <= enable AND load;
------------------------------------------------------------------
	GEN_FF: for i in 0 to N-1 generate
		D_FF_I : D_FF_rst PORT MAP(
					D => s_input_FF(i),
					clk => clk,
					rst => reset,
					Q => s_output_FF(i)
					);
		s_shift_FFF_Tmux(i) <= s_output_FF(i);
		s_mantein_FFF_Tmux(i) <= s_output_FF(i);
	end generate GEN_FF;
------------------------------------------------------------------

------------------------------------------------------------------
	GEN_MUX: for i in 0 to N-1 generate
		IF0 : if i = 0 generate
			s_input_mux(i) <= s_WEAK_TAKEN(i) & s_WEAK_UNTAKEN(i) & s_mantein_FFF_Tmux(i) & bit_in;
			MUX0: Mux_Bit GENERIC MAP (NBIT_Sel => 2)
				    PORT MAP (
					inputs => s_input_mux(i),
					sel => s_phi,
					output => s_input_FF(i)
				    );
		end generate IF0;
		
		IFi : if i > 0 generate
			s_input_mux(i) <= s_WEAK_TAKEN(i) & s_WEAK_UNTAKEN(i) & s_mantein_FFF_Tmux(i) & s_shift_FFF_Tmux(i-1);
			MUXi: Mux_Bit GENERIC MAP (NBIT_Sel => 2)
				    PORT MAP (
					inputs => s_input_mux(i),
					sel => s_phi,
					output => s_input_FF(i)
				    );
			
		end generate IFi;
	end generate GEN_MUX;
------------------------------------------------------------------

	bit_out <= s_output_FF(N-1);

end Structural;

