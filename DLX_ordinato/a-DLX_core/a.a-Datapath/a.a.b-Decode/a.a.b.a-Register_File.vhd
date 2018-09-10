----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:49:24 06/29/2018 
-- Design Name: 
-- Module Name:    Register_File - Structural 
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
use work.constants.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register_File is
	generic(NBIT_ADDR	: integer := 5;
			  NBIT_DATA : integer := 32);
	port(
			RF_clk		: in  std_logic;
			RF_reset 	: in  std_logic;
			RF_enable	: in  std_logic;
			RF_RD1		: in  std_logic;
			RF_RD2		: in  std_logic;
			RF_WR			: in  std_logic;
			RF_AddrRd1	: in  std_logic_vector(NBIT_ADDR-1 downto 0);
			RF_AddrRd2	: in  std_logic_vector(NBIT_ADDR-1 downto 0);
			RF_AddrWr	: in  std_logic_vector(NBIT_ADDR-1 downto 0);
			RF_data_in	: in  std_logic_vector(NBIT_DATA-1 downto 0);
			RF_out1		: out std_logic_vector(NBIT_DATA-1 downto 0);
			RF_out2		: out std_logic_vector(NBIT_DATA-1 downto 0)
	);
end Register_File;

architecture Structural of Register_File is

	component Decoder is
    generic(
        DEC_NBIT    :   integer :=  5);
    port(
        DEC_address :   in  std_logic_vector(DEC_NBIT-1 downto 0);
        DEC_enable  :   in  std_logic;
        DEC_output  :   out std_logic_vector(2**DEC_NBIT-1 downto 0));
	end component;
	
	component NRegister is
	generic(N: integer:= 32);
	port(
		clk:	in  std_logic;
		reset:	in  std_logic; --Active high
		data_in:	in  std_logic_vector(N-1 downto 0);
		enable:	in  std_logic;
		load:	in  std_logic; --Load enable high
		data_out: out std_logic_vector(N-1 downto 0));
	end component;
	
	component Enable_Interface is
	generic(NBIT_DATA : integer := 32);
	port(
		EI_datain	: in  std_logic_vector(NBIT_DATA-1 downto 0);
		EI_enable	: in  std_logic;
		EI_dataout: out std_logic_vector(NBIT_DATA-1 downto 0) 
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
	
	type collectionDataOut is array (0 to 2**NBIT_ADDR-1) of std_logic_vector (NBIT_DATA-1 downto 0);
	type matrixDataOut is array(0 to 2**NBIT_ADDR-1) of collectionDataOut;
	
	constant L: integer := NBIT_ADDR;
	
	signal s_wr_enable			 : std_logic;
	signal s_rd1_enable			 : std_logic;
	signal s_rd2_enable  		 : std_logic;
	signal s_load_Fdec_Tregs	 : std_logic_vector(2**NBIT_ADDR-1 downto 0);
	signal s_addrRd1_Fei_Tmux	 : std_logic_vector(NBIT_ADDR-1 downto 0);
	signal s_addrRd2_Fei_Tmux	 : std_logic_vector(NBIT_ADDR-1 downto 0);
	signal s_not_clk				 : std_logic;
	signal s_mux1_signals		 : matrixDataOut :=(others => (others => (others => '0')));
	signal s_mux2_signals		 : matrixDataOut :=(others => (others => (others => '0')));
	signal s_data_out1_Fmux_Treg: std_logic_vector(NBIT_DATA-1 downto 0);
	signal s_data_out2_Fmux_Treg: std_logic_vector(NBIT_DATA-1 downto 0);
	
begin

	s_wr_enable <= RF_enable AND RF_WR;
	s_rd1_enable <= RF_enable AND RF_RD1;
	s_rd2_enable <= RF_enable AND RF_RD2;
	s_not_clk <= NOT(RF_clk);

------------------------------------------------------------------------
	WR_DEC : Decoder GENERIC MAP (DEC_NBIT => NBIT_ADDR) PORT MAP (
		  DEC_address => RF_AddrWr,
        DEC_enable  => s_wr_enable,
        DEC_output  => s_load_Fdec_Tregs
		);
------------------------------------------------------------------------

------------------------------------------------------------------------
	RD1_EI : Enable_Interface GENERIC MAP (NBIT_DATA => NBIT_ADDR) PORT MAP (
		EI_datain  => RF_AddrRd1,
		EI_enable  => s_rd1_enable,
		EI_dataout => s_addrRd1_Fei_Tmux
		);
		
	RD2_EI : Enable_Interface GENERIC MAP (NBIT_DATA => NBIT_ADDR) PORT MAP (
		EI_datain  => RF_AddrRd2,
		EI_enable  => s_rd2_enable,
		EI_dataout => s_addrRd2_Fei_Tmux
		);
------------------------------------------------------------------------
--
------------------------------------------------------------------------
	cyc_regs : for i in 0 to 2**NBIT_ADDR-1 generate
		if0 : if(i = 0) generate
			R0	: NRegister GENERIC MAP (N => NBIT_DATA) PORT MAP (
				clk => s_not_clk,
				reset => RF_reset,
				enable => RF_enable,
				load => '0',
				data_in => (others => '0'),
				data_out => s_mux1_signals(0)(0)
				);
		end generate if0;
		
		ifi : if(i > 0) generate
			Ri	: NRegister GENERIC MAP (N => NBIT_DATA) PORT MAP (
				clk => s_not_clk,
				reset => RF_reset,
				enable => RF_enable,
				load => s_load_Fdec_Tregs(i),
				data_in => RF_data_in,
				data_out => s_mux1_signals(0)(i)
				);
		end generate ifi;
	end generate cyc_regs;
	
	s_mux2_signals(0) <= s_mux1_signals(0);
------------------------------------------------------------------------

------------------------------------------------------------------------
	depth1: for i in 0 to NBIT_ADDR-1 generate 				--0,  1, 2,  3
			width1: for j in 0 to 2**NBIT_ADDR-1 generate 	         --15,  7, 3,  1
				mod_if1: if(j mod(2**(i+1)) = 0) generate 	--2,  4, 8, 16
					MUX1: Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) 
								  PORT MAP (port0 => s_mux1_signals(i)(j),
							 port1 => s_mux1_signals(i)(j+2**i),
							 Sel => s_addrRd1_Fei_Tmux(i),
							 portY => s_mux1_signals(i+1)(j));
				end generate mod_if1;
			end generate width1;
		end generate depth1;
	
	depth2: for i in 0 to NBIT_ADDR-1 generate 				--0,  1, 2,  3
			width2: for j in 0 to 2**NBIT_ADDR-1 generate 	         --15,  7, 3,  1
				mod_if2: if(j mod(2**(i+1)) = 0) generate 	--2,  4, 8, 16
					MUX2: Mux_NBit_2x1 GENERIC MAP (NBIT_IN => NBIT_DATA) 
								  PORT MAP (port0 => s_mux2_signals(i)(j),
							 port1 => s_mux2_signals(i)(j+2**i),
							 Sel => s_addrRd2_Fei_Tmux(i),
							 portY => s_mux2_signals(i+1)(j));
				end generate mod_if2;
			end generate width2;
		end generate depth2;
		
--	s_data_out1_Fmux_Treg <= s_mux1_signals(NBIT_ADDR)(0);
--	s_data_out2_Fmux_Treg <= s_mux2_signals(NBIT_ADDR)(0);

	RF_out1 <= s_mux1_signals(NBIT_ADDR)(0);
	RF_out2 <= s_mux2_signals(NBIT_ADDR)(0);
------------------------------------------------------------------------

----------------------------------------------------------------------
--	OUT1	: NRegister GENERIC MAP (N => NBIT_DATA) PORT MAP (
--				clk => RF_clk,
--				reset => RF_reset,
--				enable => RF_enable,
--				load => '1',
--				data_in => s_data_out1_Fmux_Treg,
--				data_out => RF_out1
--				);
--	
--	OUT2	: NRegister GENERIC MAP (N => NBIT_DATA) PORT MAP (
--				clk => RF_clk,
--				reset => RF_reset,
--				enable => RF_enable,
--				load => '1',
--				data_in => s_data_out2_Fmux_Treg,
--				data_out => RF_out2
--				);
------------------------------------------------------------------------
end Structural;

