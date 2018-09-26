----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Alessandro Salvato
-- 
-- Create Date:    12:06:03 03/30/2017 
-- Design Name: 
-- Module Name:    CarryGenerator - Behavioral 
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
use ieee.std_logic_unsigned.all;
USE ieee.math_real.all;
use work.constants.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CarryGenerator is
    Generic(N: integer := 32;	--parallelismo input
	  K: integer := 8); --parallelismo output
    Port ( A : in  STD_LOGIC_VECTOR (N-1 downto 0);
           B: in  STD_LOGIC_VECTOR (N-1 downto 0);
           c_in : in  STD_LOGIC;
           CarryVector : out  STD_LOGIC_VECTOR (K-1 downto 0));
end CarryGenerator;

architecture Behavioral of CarryGenerator is

	component GeneralGenerate is
	Port ( G_ik : in  STD_LOGIC;
           P_ik : in  STD_LOGIC;
           G_km1_j : in  STD_LOGIC;
           G_ij : out  STD_LOGIC);
	end component;
	
	component GeneralPropagate is
	Port ( G_ik : in  STD_LOGIC;
           P_ik : in  STD_LOGIC;
           G_km1_j : in  STD_LOGIC;
	 P_km1_j : in  STD_LOGIC;
           G_ij : out  STD_LOGIC;
	 P_ij : out  STD_LOGIC);
	end component;
	
	component PG_network is
	Generic(N: integer := 32);
	Port ( A : in  STD_LOGIC_VECTOR (N-1 downto 0);
           B : in  STD_LOGIC_VECTOR (N-1 downto 0);
	 c_in : in std_logic;
           G : out  STD_LOGIC_VECTOR (N-1 downto 0);
           P : out  STD_LOGIC_VECTOR (N-1 downto 0));
	end component;
	
	
	constant L: integer := log2(N);
	constant CJ: integer := N/K;	-- stands for carry "jump"
	
	type SignalVector is array (1 to L+1) of std_logic_vector(N downto 1);
	signal G_mat: SignalVector;
	signal P_mat: SignalVector;
	
	signal tmp: std_logic_vector(N downto 1);
	

begin

	PG_net: PG_network GENERIC MAP (N => N) PORT MAP (A => A, B=>B, G => G_mat(1), P => P_mat(1), c_in => c_in);

MAIN_FOR: for i in 1 to L generate
	REGIF: if(i <= (log2(CJ)+1)) generate --si dimezza
		REGFOR: for j in 1 to (N/(2**i)) generate -- 16, 8, 4
			REGIF_G: if(j = 1) generate --genero G
				PM0: GeneralGenerate PORT MAP (G_ik => G_mat(i)((2**i)*j), 
							 P_ik => P_mat(i)((2**i)*j), 
							 G_km1_j => G_mat(i)((2**i)*j-2**(i-1)), 
							 G_ij => G_mat(i+1)((2**i)*j));
							 
				REGIF_G_C: if(i >= log2(CJ)) generate
					tmp((2**i)*j) <= G_mat(i+1)((2**i)*j);
				end generate REGIF_G_C;
			end generate REGIF_G;
	
			REGIF_PG: if(j>1) generate --j>1 genero PG
				PM2: GeneralPropagate PORT MAP (G_ik => G_mat(i)((2**i)*j),
							  P_ik => P_mat(i)((2**i)*j), 
							  G_km1_j => G_mat(i)((2**i)*j-2**(i-1)), 
							  P_km1_j => P_mat(i)((2**i)*j-2**(i-1)), 
							  G_ij => G_mat(i+1)((2**i)*j), 
							  P_ij => P_mat(i+1)((2**i)*j));
			end generate REGIF_PG;
		end generate REGFOR;	
	end generate REGIF;
	
	IRREGIF: if(i>3) generate --se i > 3 struttura irregolare
		IRREGIF1: if(i < L) generate --se non sono all'ultimo livello
			IRREGFOR1: for gr in 1 to 2**(L-i) generate --cicla i gruppi
				IRREGIF1_G: if(gr = 1) generate --genera G						
					IRREGFOR_G_HALF1: for e in 1 to 2**(i-4) generate --cicla gli elementi della prima metà (alta) del gruppo
						PM3: GeneralGenerate PORT MAP(G_ik => G_mat(i)(2**i-(e-1)*CJ), 
									P_ik => P_mat(i)(2**i-(e-1)*CJ), 
									G_km1_j => G_mat(i)(2**(i-1)), 
									G_ij => G_mat(i+1)((2**i)-(e-1)*CJ));
						tmp((2**i)-(e-1)*CJ) <= G_mat(i+1)((2**i)-(e-1)*CJ);
					end generate IRREGFOR_G_HALF1;
					
					IRREGFOR_G_HALF2: for back in 1 to i-3 generate
						L1: if(back = i-3) generate
							PM4: GeneralGenerate PORT MAP(G_ik => G_mat(i-back)(2**(i-1)+CJ),  --(gr-1)*2**i = 0, as gr = 1
										P_ik => P_mat(i-back)(2**(i-1)+CJ),  --(gr-1)*2**i = 0, as gr = 1
										G_km1_j => G_mat(i)(2**(i-1)), 
										G_ij => G_mat(i+1)(2**(i-1)+CJ));
							tmp(2**(i-1)+CJ) <= G_mat(i+1)(2**(i-1)+CJ);
									
						end generate L1;
						
						L2: if(back < i-3) generate 
							L3: for e in 1 to 2**(i-4-back) generate --sfrutto la ricerca dicotomica partendo dal centro
									PM12: GeneralGenerate PORT MAP(G_ik => G_mat(i-back)(2**(i-1)+2**(i-1-back)-(e-1)*CJ), 
												 P_ik => P_mat(i-back)(2**(i-1)+2**(i-1-back)-(e-1)*CJ), 
												 G_km1_j => G_mat(i)(2**(i-1)), 
												 G_ij => G_mat(i+1)(2**(i-1)+2**(i-1-back)-(e-1)*CJ));
									tmp(2**(i-1)+2**(i-1-back)-(e-1)*CJ) <= G_mat(i+1)(2**(i-1)+2**(i-1-back)-(e-1)*CJ);
							end generate L3;
						end generate L2;
					end generate IRREGFOR_G_HALF2;
				end generate IRREGIF1_G;
				
				IRREGIF1_PG: if (gr > 1) generate --genera PG
					IRREGFOR_PG_HALF1: for e in 1 to 2**(i-4) generate 
						PM7: GeneralPropagate PORT MAP(G_ik => G_mat(i)(gr*(2**i) -(e-1)*CJ), 
									 P_ik => P_mat(i)(gr*(2**i) -(e-1)*CJ), 
									 G_km1_j => G_mat(i)(gr*(2**i)-2**(i-1)), 
									 P_km1_j => P_mat(i)(gr*(2**i)-2**(i-1)), 
									 G_ij => G_mat(i+1)(gr*(2**i) -(e-1)*CJ), 
									 P_ij => P_mat(i+1)(gr*(2**i) -(e-1)*CJ));
					end generate IRREGFOR_PG_HALF1;
					
					IRREGFOR_PG_HALF2: for back in 1 to i-3 generate
						L4: if(back = i-3) generate
							PM5: GeneralPropagate PORT MAP(G_ik => G_mat(i-back)(2**(i-1)+(gr-1)*(2**i)+CJ), 
									 P_ik => P_mat(i-back)(2**(i-1)+(gr-1)*(2**i)+CJ), 
									 G_km1_j => G_mat(i)(gr*(2**i)-2**(i-1)), 
									 P_km1_j => P_mat(i)(gr*(2**i)-2**(i-1)), 
									 G_ij => G_mat(i+1)(2**(i-1)+(gr-1)*(2**i)+CJ), 
									 P_ij => P_mat(i+1)(2**(i-1)+(gr-1)*(2**i)+CJ));
						end generate L4;
						
						L5: if(back < i-3) generate
							L6: for e in 1 to 2**(i-4-back) generate
									PM6: GeneralPropagate PORT MAP(G_ik => G_mat(i-back)(2**(i-1)+2**(i-1-back)+(gr-1)*(2**i)-(e-1)*CJ), 
												 P_ik => P_mat(i-back)(2**(i-1)+2**(i-1-back)+(gr-1)*(2**i)-(e-1)*CJ), 
												 G_km1_j => G_mat(i)(gr*(2**i)-2**(i-1)), 
												 P_km1_j => P_mat(i)(gr*(2**i)-2**(i-1)), 
												 G_ij => G_mat(i+1)(2**(i-1)+2**(i-1-back)+(gr-1)*(2**i)-(e-1)*CJ), 
												 P_ij => P_mat(i+1)(2**(i-1)+2**(i-1-back)+(gr-1)*(2**i)-(e-1)*CJ));
							end generate L6;
						end generate L5;
					end generate IRREGFOR_PG_HALF2;
				end generate IRREGIF1_PG;
			end generate IRREGFOR1;
		end generate IRREGIF1;
		LASTIF: if(i = L) generate --se sono all'ultimo livello --> i = log(N) & gr = 1 
			LAST_IRREGFOR_HALF1: for e in 1 to 2**(i-4) generate --cicla gli elementi della prima parte (p. alta) del gruppo
				PM9: GeneralGenerate PORT MAP(G_ik => G_mat(i)(2**i-(e-1)*CJ), 
							P_ik => P_mat(i)(2**i-(e-1)*CJ), 
							G_km1_j => G_mat(i)(2**(i-1)), 
							G_ij => G_mat(i+1)((2**i)-(e-1)*CJ));
				tmp((2**i)-(e-1)*CJ) <= G_mat(i+1)((2**i)-(e-1)*CJ);
			end generate LAST_IRREGFOR_HALF1;
			
			LAST_IRREGFOR_HALF2: for back in 1 to i-3 generate
					L7: if(back = i-3) generate
						PM13: GeneralGenerate  PORT MAP(G_ik => G_mat(i-back)(2**(i-1)+CJ), 
									 P_ik => P_mat(i-back)(2**(i-1)+CJ), 
									 G_km1_j => G_mat(i)(2**(i-1)), 
									 G_ij => G_mat(i+1)(2**(i-1)+CJ));
						tmp(2**(i-1)+CJ) <= G_mat(i+1)(2**(i-1)+CJ);
									
					end generate L7;
						
					L8: if(back < i-3) generate
						L9: for e in 1 to 2**(i-4-back) generate
								PM14: GeneralGenerate PORT MAP(G_ik => G_mat(i-back)(2**(i-1)+2**(i-1-back)-(e-1)*CJ), 
											 P_ik => P_mat(i-back)(2**(i-1)+2**(i-1-back)-(e-1)*CJ), 
											 G_km1_j => G_mat(i)(2**(i-1)), 
											 G_ij => G_mat(i+1)(2**(i-1)+2**(i-1-back)-(e-1)*CJ)); 
											 
								tmp(2**(i-1)+2**(i-1-back)-(e-1)*CJ) <= G_mat(i+1)(2**(i-1)+2**(i-1-back)-(e-1)*CJ);
						end generate L9;
					end generate L8;
			end generate LAST_IRREGFOR_HALF2;
		end generate LASTIF;
	end generate IRREGIF;	
end generate MAIN_FOR;

OUTPUTFOR: for z in 1 to N generate
	OUT_IF: if((z mod CJ) = 0) generate
		CarryVector(z/CJ-1) <= tmp(z);
	end generate OUT_IF;
end generate OUTPUTFOR;

end Behavioral;

