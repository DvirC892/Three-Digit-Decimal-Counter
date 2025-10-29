library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity divider is
    Port (
        clk_in       : in  std_logic;
        rst          : in  std_logic;
        clk_out_slow : out std_logic;
        clk_out_fast : out std_logic
    );
end divider;

architecture RTL of divider is

    constant DIV_SLOW_CYCLES : natural := 100;--100000000 / 10;    -- 10M
    constant DIV_FAST_CYCLES : natural := 10;-- 100000000 / 1000;  -- 100k
    constant DIV_SLOW_TB     : natural := 100; -- For simulation (500kHz)
    constant DIV_FAST_TB     : natural := 10; -- For simulation (5MHz)

    signal count_5   : integer range 0 to 10000000 := 0;
    signal count_500 : integer range 0 to 100000 := 0;

    signal tmp_5   : std_logic := '0';
    signal tmp_500 : std_logic := '0';
    signal rdy_rst : std_logic := '0';
    signal prev_rst: std_logic := '0';

begin

-- Detect reset rising edge
process(clk_in)
begin
    if rising_edge(clk_in) then
        if (rst = '1' and prev_rst = '0') then
            rdy_rst <= '1';
        else
            rdy_rst <= '0';
        end if;
        prev_rst <= rst;
    end if;
end process;

-- Clock divider logic
process(clk_in)
begin
    if rising_edge(clk_in) then
        if (rdy_rst = '1') then
            count_5   <= 0;
            count_500 <= 0;
            tmp_5     <= '0';
            tmp_500   <= '0';
        else
            if count_5 < DIV_SLOW_CYCLES then
                count_5 <= count_5 + 1;
            else
                count_5 <= 0;
                tmp_5   <= not tmp_5;
            end if;

            if count_500 < DIV_FAST_CYCLES then
                count_500 <= count_500 + 1;
            else
                count_500 <= 0;
                tmp_500   <= not tmp_500;
            end if;
        end if;
    end if;
end process;

clk_out_slow <= tmp_5;
clk_out_fast <= tmp_500;

end RTL;
