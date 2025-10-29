library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity single_digit_counter is
    Port (
        clk       : in std_logic;
        en        : in std_logic;
        rst       : in std_logic;
        clr       : in std_logic;
        top_count : in std_logic_vector(3 downto 0);
        Q         : out integer range 0 to 9;
        top_cnt_reach : out std_logic;
        reach_9   : out std_logic
    );
end single_digit_counter;

architecture RTL of single_digit_counter is
    
    signal r_count : integer range 0 to 9 := 0;

begin

-- Counting process
process(clk)
begin
    if rising_edge(clk) then
        if (rst = '1') or (clr = '1') then
            r_count <= 0;
        elsif (en = '1') then
            if r_count = 9 then
                r_count <= 0;
            else
                r_count <= r_count + 1;
            end if;
        end if;
    end if;
end process;

Q <= r_count;

-- Detect reaching top_count
process(top_count, r_count)
begin
    if (r_count = to_integer(unsigned(top_count))) then
        top_cnt_reach <= '1';
    else
        top_cnt_reach <= '0';
    end if;
end process;

-- Detect reaching 9
process(r_count)
begin
    if r_count = 9 then
        reach_9 <= '1';
    else
        reach_9 <= '0';
    end if;
end process;

end RTL;
