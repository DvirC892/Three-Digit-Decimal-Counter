library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity combinational_logic is
port(
    top_reach : in std_logic_vector (2 downto 0);
    reach_9_flags : in std_logic_vector (1 downto 0);
    clear : out std_logic_vector (2 downto 0);
    enable : out std_logic_vector (1 downto 0)
);
end combinational_logic;

architecture Behavioral of combinational_logic is

begin

clear(0) <= reach_9_flags(0) or (top_reach(0) and top_reach(1) and top_reach(2));
clear(1) <= (reach_9_flags(0) and reach_9_flags(1)) or (top_reach(0) and top_reach(1) and top_reach(2));
clear(2) <= (top_reach(0) and top_reach(1) and top_reach(2));
enable(0) <= reach_9_flags(0);
enable(1) <= (reach_9_flags(0) and reach_9_flags(1));

end Behavioral;
