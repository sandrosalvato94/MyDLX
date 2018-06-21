library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- ASSUMPTIONS: 
--		1. N >= 6
-- 	2. N multiple of 2

entity BOOTHMUL is
	generic (N : integer := 32);
	port (A, B : in std_logic_vector(N-1 downto 0);
			P : out std_logic_vector((2*N)-1 downto 0)
			);
end BOOTHMUL;

architecture Structural of BOOTHMUL is
	
	component Encoder is
		port (A : in std_logic_vector(2 downto 0);
				O : out std_logic_vector(2 downto 0)
				);
	end component;
	
	component Mux5x1 is
		generic (N : integer := 16);
		port (B, C, D, E : in std_logic_vector(N-1 downto 0);
				sel : in std_logic_vector(2 downto 0);
				O : out std_logic_vector(N-1 downto 0)
				);
	end component;
	
	component AdderN is
		generic (N : integer := 16);
		port (A, B : in std_logic_vector(N-1 downto 0);
				S : out std_logic_vector(N-1 downto 0)
				);
	end component;
	
	component Shifter is
		generic (N : integer := 16);
		port (A : in std_logic_vector(N-1 downto 0);
				B, C, D, E : out std_logic_vector(N-1 downto 0)
				);
	end component;
	
	component Shifter2 is
		generic (N : integer := 16);
		port (A1, A2, A3, A4 : in std_logic_vector(N-1 downto 0);
				B, C, D, E : out std_logic_vector(N-1 downto 0)
				);
	end component;
	
	component Extender is
			generic (N : integer := 8);
			port (A : in std_logic_vector(N-1 downto 0);
					Y : out std_logic_vector((2*N)-1 downto 0)
					);
	end component;
	
	type mat1_type is array(0 to (N/2)-1) of std_logic_vector(2 downto 0);  -- encoder outputs
	signal mat1 : mat1_type;
	
	signal e : std_logic_vector((2*N)-1 downto 0);  -- extender output
	
	type mat2_type is array(0 to (N/2)-1) of std_logic_vector((2*N)-1 downto 0);  -- shifter outputs
	signal s1, s2, s3, s4 : mat2_type;
	
	type mat3_type is array(0 to (N/2)-1) of std_logic_vector((2*N)-1 downto 0);  -- mux outputs
	signal x : mat3_type;
	
	type mat4_type is array(0 to (N/2)-3) of std_logic_vector((2*N)-1 downto 0);  -- adderN outputs
	signal t : mat4_type;
	
begin

	gen1 : for i in 0 to N-2 generate  -- encoder instantiations
		if1 : if (i mod 2 = 0) generate
			if2 : if (i = 0) generate
				enc : Encoder port map (
									A(0) => '0',
									A(1) => B(0),
									A(2) => B(1),
									O => mat1(0)
									);
			end generate if2;
			if3 : if (i /= 0) generate
				enc : Encoder port map (
									A(0) => B(i-1),
									A(1) => B(i),
									A(2) => B(i+1),
									O => mat1(i/2)
									);
			end generate if3;
		end generate if1;
	end generate gen1;
	
	
	exten : Extender  -- extender instantiation
					generic map (N)
					port map (
						A => A,
						Y => e
						);
		
	sh : Shifter  -- shifter instantiation
					generic map (2*N)
					port map (
						A => e,
						B => s1(0),
						C => s2(0),
						D => s3(0),
						E => s4(0)
						);
								
	gen2 : for i in 0 to (N/2)-2 generate  -- shifter2 and mux instantiation
		sh2 : Shifter2 
					generic map (2*N)
					port map (
						A1 => s1(i),
						A2 => s2(i),
						A3 => s3(i),
						A4 => s4(i),
						B => s1(i+1),
						C => s2(i+1),
						D => s3(i+1),
						E => s4(i+1)
						);
		mux : Mux5x1
					generic map (2*N)
					port map (
						B => s1(i),
						C => s2(i),
						D => s3(i),
						E => s4(i),
						sel => mat1(i),
						O => x(i)
						);
	end generate gen2;
	
	sum0 : AdderN  -- first adder instantiation
				generic map (2*N)
				port map (
					A => x(1),
					B => x(0),
					S => t(0)
					);
	
	gen3 : for i in 0 to (N/2)-4 generate  -- other adders instantiation
		sum : AdderN
				generic map (2*N)
				port map (
					A => x(i+2),
					B => t(i),
					S => t(i+1)
					);
	end generate gen3;
	
	mux1 : Mux5x1  -- last mux instantiation
				generic map (2*N)
				port map (
					B => s1((N/2)-1),
					C => s2((N/2)-1),
					D => s3((N/2)-1),
					E => s4((N/2)-1),
					sel => mat1((N/2)-1),
					O => x((N/2)-1)
					);
	
	sum1 : AdderN  -- last adderN instantiation
				generic map (2*N)
				port map (
					A => x((N/2)-1),
					B => t((N/2)-3),
					S => P
					);
					
end Structural;



