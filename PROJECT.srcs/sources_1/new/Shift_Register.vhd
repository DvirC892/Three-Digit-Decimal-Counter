library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Shift_Register is
port (
    clk          : in std_logic;
    rst          : in std_logic;
    Q_reg_buffer : buffer std_logic_vector (2 downto 0) :="110"
);
end Shift_Register;

architecture Behavioral of Shift_Register is

signal rst_ready  : std_logic;
signal prev_rst_flag : std_logic;

begin

process(clk)
begin
    if rising_edge(clk) then
        if (rst = '1' and prev_rst_flag = '0') then
            rst_ready <= '1';
        else
            rst_ready <= '0';
        end if;

        prev_rst_flag <= rst; 
    end if;
end process;

process (clk)
begin
    if (rising_edge(clk)) then
        if (rst_ready = '1') then
            Q_reg_buffer <= "110";
        else
            Q_reg_buffer <= Q_reg_buffer(1 downto 0) & Q_reg_buffer(2);--110->101->011->110
        end if;
    end if;
end process;

end Behavioral;
