library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB is
end TB;

architecture Behavioral of TB is

-- Signals for testbench
signal reset, clk_sys : std_logic := '0';
signal count_limit : std_logic_vector (3 downto 0);
signal led_out : std_logic;
signal seg_out : std_logic_vector (6 downto 0);
signal anode_ctrl : std_logic_vector (2 downto 0);
signal anode_enable : std_logic;

begin

U9: entity work.counter3_digits(Behavioral)
    port map (
        reset => reset, clk_sys => clk_sys, 
        count_limit => count_limit, 
        led_out => led_out, 
        seg_out => seg_out, 
        anode_ctrl => anode_ctrl, 
        anode_enable => anode_enable
    );

-- Clock generation process
process
begin

    clk_sys <= not clk_sys;
    wait for 5 ps;
end process;

-- Test process
process
begin
    -- Initial reset
    reset <= '0';
    wait for 200 ns;      -- Wait for some time

    reset <= '1';        
    wait for 200 ns;       -- Apply reset
    reset <= '0';         -- Release reset

    -- Test input values
    count_limit <= "0100";  -- Set a value for count_limit
    wait for 200 ns;        -- Wait for simulation time so that the counter reaches 2

    -- Apply reset again for further testing
    reset <= '1';        
    wait for 200 ns;   
    reset <= '0';

    -- Wait for 1ms to complete the test sequence
    wait for 1 ms;

    -- End simulation
    wait;
end process;


end Behavioral;
