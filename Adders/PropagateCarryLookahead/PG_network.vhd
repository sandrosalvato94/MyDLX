----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:11:26 03/30/2017 
-- Design Name: 
-- Module Name:    PG_network - Behavioral 
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

entity PG_network is
    Generic(N: integer := 32);
    Port ( A : in  STD_LOGIC_VECTOR (N-1 downto 0);
           B : in  STD_LOGIC_VECTOR (N-1 downto 0);
	 c_in : in std_logic;
           G : out  STD_LOGIC_VECTOR (N-1 downto 0);
           P : out  STD_LOGIC_VECTOR (N-1 downto 0));
end PG_network;

architecture Behavioral of PG_network is

	component PG_cell is
		Port ( A : in  STD_LOGIC;
		       B : in  STD_LOGIC;
                           p : out  STD_LOGIC;
                           g : out  STD_LOGIC);
	end component;
	
	component GeneralGenerate is
	Port ( G_ik : in  STD_LOGIC;
           P_ik : in  STD_LOGIC;
           G_km1_j : in  STD_LOGIC;
           G_ij : out  STD_LOGIC);
	end component;
   
   signal tmp1, tmp2: std_logic;

begin
   
   tmp1 <= A(0) AND B(0);
   tmp2 <= A(0) XOR B(0);
   
	cyc: for i in 0 to N-1 generate
		PG_cell_i : PG_cell PORT MAP (A => A(i), B => B(i), p => P(i), g => G(i));
	
--		IF0: if(i = 0) generate
--			G_cell_0 : GeneralGenerate PORT MAP (G_ik => tmp1, 
--						       P_ik => tmp2,
--						       G_km1_j => c_in,
--						       G_ij => G(0));
--		end generate IF0;
--		
--		IFN: if(i > 0) generate
--			PG_cell_i : PG_cell PORT MAP (A => A(i), B => B(i), p => P(i), g => G(i));
--		end generate IFN;
	end generate cyc;

end Behavioral;

