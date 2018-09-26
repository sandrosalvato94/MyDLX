----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Alessandro Salvato
-- 
-- Create Date:    18:23:05 09/16/2017 
-- Design Name: 
-- Module Name:    NRotateRegister - Behavioral 
-- Project Name:   Branch Target Buffer
-- Target Devices: 
-- Tool versions: 
-- Description: This is a customized rotate monodirectional-left generic register.
--	      Both the parallelism and the default/resetted value can be set as
--	      generics. 
--	      Reset is the priorest signal, so when it is driven high, the content
--	      is forced to DEFAULT_VALUE, regardless of the state of the other 
--	      control signals.
--	      Being a customized entity for the branch target buffer, it takes 
--	      into account only those useful functionalities. The load signal, for
--	      instance, is never used.
--	      Multiplexers are driven by a function, called phi, which taking as 
--	      inputs reset, enable and rotate signals, generates the two bits for
--	      selectors.
--
--	      Rst | E | Rot | phi_1 | phi_0
--	       0    0    0  |   1       0	MANTEIN
--	       0    0    1	|   1       0 	MANTEIN
--	       0    1    0  |   1       0	MANTEIN
--	       0    1    1  |   0       1	ROTATE
--	       1    x    x  |   0       0	RESET
--
-- Dependencies: 
--
-- Revision: 
-- Revision 1.0
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

entity NRotateRegister is
	generic(N: integer := 32);
	port(
		clk     : in  std_logic;
		reset   : in  std_logic;
		enable  : in  std_logic;
		load    : in  std_logic;
		data_in : in  std_logic_vector(N-1 downto 0);
		rotate  : in  std_logic;
		data_out: out std_logic_vector(N-1 downto 0)
	);
end NRotateRegister;

architecture Behavioral of NRotateRegister is

	component Mux_Bit is
	generic(NBIT_Sel : integer := 2);
	port(
		inputs : in  std_logic_vector(2**NBIT_Sel-1 downto 0);
		sel    : in  std_logic_vector(NBIT_Sel-1 downto 0);
		output : out std_logic
	);
	end component;
	
	component D_FF is
	Port ( D : in  STD_LOGIC;
           clk : in  STD_LOGIC;
	 --rst : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           Not_Q : out  STD_LOGIC);
	end component;

	
	type matrix is array (0 to N-1) of std_logic_vector(3 downto 0);
	
	--constant dataIN		: std_logic_vector(N-1 downto 0) := (N-1 => '1', others => '0');
	signal dataIN 		: std_logic_vector(N-1 downto 0) := (others => '0');
	signal s_notR 		: std_logic := '0';
	signal s_a, s_b 		: std_logic := '0';
	signal s_phi 		: std_logic_vector(1 downto 0) := "00";
	signal s_D_Fmux_TFF		: std_logic_vector(N-1 downto 0) := (others => '0');
	signal s_outFF		: std_logic_vector(N-1 downto 0) := (others => '0');
	signal s_rotate_FFF_Tmux	: std_logic_vector(N-1 downto 0) := (others => '0');
	signal s_mantein_FFF_Tmux	: std_logic_vector(N-1 downto 0) := (others => '0');
	signal s_outMux		: std_logic_vector(N-1 downto 0) := (others => '0');
	signal s_input_mux		: matrix := (others => (others => '0'));
	

begin

	s_notR <= NOT(reset);
	s_a <= s_notR AND NOT(enable);
	s_b <= s_notR AND NOT(rotate);
	s_phi(1) <= s_a OR s_b;
	s_phi(0) <= s_notR AND enable AND rotate;
	dataIN(N-1) <= '1';
	
------------------------------------------------------------------------------------
	GEN_FF : for i in 0 to N-1 generate
		DFF_i : D_FF PORT MAP(
				D => s_D_Fmux_TFF(i),
				clk => clk,
				Q => s_outFF(i)
				);
		s_mantein_FFF_Tmux(i) <= s_outFF(i);
		s_rotate_FFF_Tmux(i)  <= s_outFF(i);
		data_out(i)        <= s_outFF(i);
	end generate GEN_FF;
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
	GEN_MUX : for i in 0 to N-1 generate
		IF_M0 : if(i = 0) generate
			s_input_mux(i) <= dataIN(i) & s_mantein_FFF_Tmux(i) & s_rotate_FFF_Tmux(N-1) & dataIN(i);
			MUX_0 : Mux_Bit GENERIC MAP (2)
				PORT MAP(
					inputs => s_input_mux(i),
					sel => s_phi,
					output => s_D_Fmux_TFF(i)
					);
		end generate IF_M0;
		
		IF_Mi : if(i > 0) generate
			s_input_mux(i) <= dataIN(i) & s_mantein_FFF_Tmux(i) & s_rotate_FFF_Tmux(i-1) & dataIN(i);
			MUX_i : Mux_Bit PORT MAP(
					inputs => s_input_mux(i),
					sel => s_phi,
					output => s_D_Fmux_TFF(i)
					);
		
		end generate IF_Mi;
	end generate GEN_MUX;
------------------------------------------------------------------------------------

end Behavioral;

