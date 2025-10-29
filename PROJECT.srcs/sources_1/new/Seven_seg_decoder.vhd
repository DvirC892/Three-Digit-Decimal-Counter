library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Seven_seg_decoder is
port (
    mux_in  : in integer range 0 to 9;
    seg_out : out std_logic_vector(6 downto 0)
);
end Seven_seg_decoder;

architecture Behavioral of Seven_seg_decoder is

begin

process (mux_in)
begin
    case mux_in is
        when 0 => seg_out <= "0000001";
        when 1 => seg_out <= "1001111";
        when 2 => seg_out <= "0010010";
        when 3 => seg_out <= "0000110";
        when 4 => seg_out <= "1001100";
        when 5 => seg_out <= "0100100";
        when 6 => seg_out <= "0100000";
        when 7 => seg_out <= "0001111";
        when 8 => seg_out <= "0000000";
        when 9 => seg_out <= "0000100";
        when others => seg_out <= "1111111";
    end case;
end process;

end Behavioral;
