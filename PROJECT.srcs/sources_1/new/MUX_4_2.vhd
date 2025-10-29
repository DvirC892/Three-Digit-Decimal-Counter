library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_4_2 is
port (
    Q_0_digit : in integer range 0 to 9;
    Q_1_digit : in integer range 0 to 9;
    Q_2_digit : in integer range 0 to 9;
    sel_mux   : in std_logic_vector (1 downto 0);
    Q_out_mux : out integer range 0 to 9
);
end MUX_4_2;

architecture Behavioral of MUX_4_2 is

begin

process (Q_0_digit, Q_1_digit, Q_2_digit, sel_mux)

begin
    case sel_mux is
        when "00" => Q_out_mux <= Q_0_digit;
        when "01" => Q_out_mux <= Q_1_digit;
        when "10" => Q_out_mux <= Q_2_digit;
        when others => Q_out_mux <= 0;
    end case;
end process;

end Behavioral;
