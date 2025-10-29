library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Anode_Encoder is
port (
    Q_reg_in : in std_logic_vector (2 downto 0);
    sel_out  : out std_logic_vector (1 downto 0)
);
end Anode_Encoder;

architecture Behavioral of Anode_Encoder is

begin

process (Q_reg_in)
begin
    case Q_reg_in is
        when "110" => sel_out <= "00";
        when "101" => sel_out <= "01";
        when "011" => sel_out <= "10";
        when others => sel_out <= "XX";
    end case;
end process;

end Behavioral;
