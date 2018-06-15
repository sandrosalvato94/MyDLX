package CONSTANTS is
	--56 instructions
	--REG
	constant OPCODE_REG 	: std_logic_vector(5 downto 0) := "000000";
		constant FUNC_SLL		: std_logic_vector(10 downto 0) := "00000000100"; --0X04
		constant FUNC_SRL		: std_logic_vector(10 downto 0) := "00000000110"; --0X06
		constant FUNC_SRA		: std_logic_vector(10 downto 0) := "00000000111"; --0X07
		constant FUNC_ADD		: std_logic_vector(10 downto 0) := "00000010000"; --0X20
		constant FUNC_ADDU	: std_logic_vector(10 downto 0) := "00000010001"; --0X21
		constant FUNC_SUB		: std_logic_vector(10 downto 0) := "00000010010"; --0X22
		constant FUNC_SUBU	: std_logic_vector(10 downto 0) := "00000010011"; --0X23
		constant FUNC_AND		: std_logic_vector(10 downto 0) := "00000010100"; --0X24
		constant FUNC_OR		: std_logic_vector(10 downto 0) := "00000010101"; --0X25
		constant FUNC_XOR		: std_logic_vector(10 downto 0) := "00000010110"; --0X26
		constant FUNC_SEQ		: std_logic_vector(10 downto 0) := "00000101000"; --0X28
		constant FUNC_SNE		: std_logic_vector(10 downto 0) := "00000101001"; --0X29
		constant FUNC_SLT 	: std_logic_vector(10 downto 0) := "00000101010"; --0X2A
		constant FUNC_SGT 	: std_logic_vector(10 downto 0) := "00000101011"; --0X2B
		constant FUNC_SLE 	: std_logic_vector(10 downto 0) := "00000101100"; --0X2C
		constant FUNC_SGE 	: std_logic_vector(10 downto 0) := "00000101101"; --0X2D
		constant FUNC_SLTU 	: std_logic_vector(10 downto 0) := "00000111010"; --0X3A
		constant FUNC_SGTU 	: std_logic_vector(10 downto 0) := "00000111011"; --0X3B
		constant FUNC_SLEU 	: std_logic_vector(10 downto 0) := "00000111100"; --0X3C
		constant FUNC_SGEU 	: std_logic_vector(10 downto 0) := "00000111101"; --0X3D
	constant OPCODE_MUL 	: std_logic_vector(5 downto 0) := "000001"; --0X01
		constant FUNC_MULT	: std_logic_vector(10 downto 0) := "00000001110"; --0X0E
		constant FUNC_MULTU	: std_logic_vector(10 downto 0) := "00000010110"; --0X16
	
	--JMP
	constant OPCODE_J 	: std_logic_vector(5 downto 0) := "000010"; --0x02
	constant OPCODE_JAL 	: std_logic_vector(5 downto 0) := "000011"; --0x03
	constant OPCODE_JR	: std_logic_vector(5 downto 0) := "010010"; --0x12
	constant OPCODE_JALR	: std_logic_vector(5 downto 0) := "010011"; --0x13
	
	--BRANCH
	constant OPCODE_BEQZ	: std_logic_vector(5 downto 0) := "000100"; --0x04
	constant OPCODE_BNEZ	: std_logic_vector(5 downto 0) := "000101"; --0x05
	
	--IMM
	constant OPCODE_ADDI	: std_logic_vector(5 downto 0) := "001000"; --0x08
	constant OPCODE_ADDUI: std_logic_vector(5 downto 0) := "001001"; --0x09
	constant OPCODE_SUBI	: std_logic_vector(5 downto 0) := "001010"; --0x0A
	constant OPCODE_SUBUI: std_logic_vector(5 downto 0) := "001011"; --0x0B
	constant OPCODE_ANDI	: std_logic_vector(5 downto 0) := "001100"; --0x0C
	constant OPCODE_ORI	: std_logic_vector(5 downto 0) := "001101"; --0x0D
	constant OPCODE_XORI	: std_logic_vector(5 downto 0) := "001110"; --0x0E
	constant OPCODE_SLLI	: std_logic_vector(5 downto 0) := "010100"; --0x14
	constant OPCODE_SRLI	: std_logic_vector(5 downto 0) := "010110"; --0x16
	constant OPCODE_SRAI	: std_logic_vector(5 downto 0) := "010111"; --0x17
	constant OPCODE_SEQI	: std_logic_vector(5 downto 0) := "011000"; --0x18
	constant OPCODE_SNEI	: std_logic_vector(5 downto 0) := "011001"; --0x19
	constant OPCODE_SLTI	: std_logic_vector(5 downto 0) := "011010"; --0x1A
	constant OPCODE_SGTI	: std_logic_vector(5 downto 0) := "011011"; --0x1B
	constant OPCODE_SLEI	: std_logic_vector(5 downto 0) := "011100"; --0x1C
	constant OPCODE_SGEI	: std_logic_vector(5 downto 0) := "011101"; --0x1D
	constant OPCODE_SLTUI: std_logic_vector(5 downto 0) := "111010"; --0x3A
	constant OPCODE_SGTUI: std_logic_vector(5 downto 0) := "111011"; --0x3B
	constant OPCODE_SLEUI: std_logic_vector(5 downto 0) := "111100"; --0x3C
	constant OPCODE_SGEUI: std_logic_vector(5 downto 0) := "111101"; --0x3D
	
	--LOAD
	constant OPCODE_LB	: std_logic_vector(5 downto 0) := "100000"; --0x20
	constant OPCODE_LW	: std_logic_vector(5 downto 0) := "100011"; --0x23
	constant OPCODE_LBU	: std_logic_vector(5 downto 0) := "100100"; --0x24
	
	--STORE
	constant OPCODE_SB	: std_logic_vector(5 downto 0) := "101000"; --0x28
	constant OPCODE_SW	: std_logic_vector(5 downto 0) := "101011"; --0x2B
	
	--NOP
	constant OPCODE_NOP	: std_logic_vector(5 downto 0) := "010101"; --0x15
	
	--1 REG (and 1 IMM)
	constant OPCODE_LHI	: std_logic_vector(5 downto 0) := "001111"; --0x0F
	
	--SPECIAL 1 REG
	constant OPCODE_MFHI	: std_logic_vector(5 downto 0) := "111110"; --0xFE
	constant OPCODE_MFLO	: std_logic_vector(5 downto 0) := "111111"; --0xFF
	
	


	
	function log2( i : integer) return integer;

	--function f_log2 (x : positive) return natural;
      	--	variable i : natural;
  	--begin
	--	i := 0;  
	--	while (2**i < x) and i < 31 loop
	--		i := i + 1;
	--	end loop;
	--	return i;
	--end function;

end package CONSTANTS;

package body CONSTANTS is

	function log2( i : integer) return integer is
		variable temp    : integer := i;
		variable ret_val : integer := 0; 
	begin
		
		while temp > 1 loop
			ret_val := ret_val + 1;
			temp    := temp / 2;
		end loop;
		return ret_val;
	end function log2;

end package body CONSTANTS;