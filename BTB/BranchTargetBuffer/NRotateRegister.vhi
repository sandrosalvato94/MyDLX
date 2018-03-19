
-- VHDL Instantiation Created from source file NRotateRegister.vhd -- 13:35:33 10/02/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT NRotateRegister
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		enable : IN std_logic;
		load : IN std_logic;
		data_in : IN std_logic_vector(31 downto 0);
		rotate : IN std_logic;          
		data_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_NRotateRegister: NRotateRegister PORT MAP(
		clk => ,
		reset => ,
		enable => ,
		load => ,
		data_in => ,
		rotate => ,
		data_out => 
	);


