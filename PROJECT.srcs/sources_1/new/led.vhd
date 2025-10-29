library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LED is
port (
    top_reach : in std_logic_vector (2 downto 0);
    led_out   : out std_logic
);
end LED;

architecture Behavioral of LED is

begin

led_out <= top_reach(0) and top_reach(1) and top_reach(2);

end Behavioral;
