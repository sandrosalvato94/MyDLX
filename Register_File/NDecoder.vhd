library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Decoder is
    generic(
        DEC_NBIT    :   integer :=  5);
    port(
        DEC_address :   in  std_logic_vector(DEC_NBIT-1 downto 0);
        DEC_enable  :   in  std_logic;
        DEC_output  :   out std_logic_vector(2**DEC_NBIT-1 downto 0));
end Decoder;

architecture Behavioral of decoder is
begin

    process(DEC_address, DEC_enable)
    begin
        DEC_output  <=  (others => '0');
        if DEC_enable = '1' then
            DEC_output(to_integer(unsigned(DEC_address)))   <=  '1';
        end if;
    end process;

end Behavioral;