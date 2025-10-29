library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter3_digits is
port (
    reset, clk_sys : in std_logic;
    count_limit : in std_logic_vector (3 downto 0);
    led_out : out std_logic;
    seg_out : out std_logic_vector (6 downto 0);
    anode_ctrl : out std_logic_vector (2 downto 0);
    anode_enable : out std_logic
);
end counter3_digits;

architecture Behavioral of counter3_digits is

signal clk_slow, clk_fast : std_logic;
signal top_reach : std_logic_vector (2 downto 0);
signal reach_9_flags : std_logic_vector (1 downto 0);
signal clear : std_logic_vector (2 downto 0);
signal enable : std_logic_vector (1 downto 0);
signal digit0, digit1, digit2 : integer range 0 to 9;
signal sel_mux : std_logic_vector (1 downto 0);
signal mux_out : integer range 0 to 9;
signal shift_reg : std_logic_vector (2 downto 0);

begin

divider_inst: entity work.divider(RTL)
    port map (clk_in => clk_sys, rst => reset, clk_out_slow => clk_slow, clk_out_fast => clk_fast);

counter0_inst: entity work.single_digit_counter(RTL)
    port map (top_count => count_limit, clk => clk_slow, rst => reset, en => '1', clr => clear(0), Q => digit0, reach_9 => reach_9_flags(0), top_cnt_reach => top_reach(0));

counter1_inst: entity work.single_digit_counter(RTL)
    port map (top_count => count_limit, clk => clk_slow, rst => reset, en => enable(0), clr => clear(1), Q => digit1, reach_9 => reach_9_flags(1), top_cnt_reach => top_reach(1));

counter2_inst: entity work.single_digit_counter(RTL)
    port map (top_count => count_limit, clk => clk_slow, rst => reset, en => enable(1), clr => clear(2), Q => digit2, top_cnt_reach => top_reach(2));

logic_inst: entity work.combinational_logic(Behavioral)
    port map (enable => enable, clear => clear, top_reach => top_reach, reach_9_flags => reach_9_flags);

mux_inst: entity work.MUX_4_2(Behavioral)
    port map (Q_0_digit => digit0, Q_1_digit => digit1, Q_2_digit => digit2, sel_mux => sel_mux, Q_out_mux => mux_out);

encoder_inst: entity work.Anode_Encoder(Behavioral)
    port map (Q_reg_in => shift_reg, sel_out => sel_mux);

shift_inst: entity work.Shift_Register(Behavioral)
    port map (Q_reg_buffer => shift_reg, clk => clk_fast, rst => reset);

decoder_inst: entity work.Seven_seg_decoder(Behavioral)
    port map (mux_in => mux_out, seg_out => seg_out);

led_inst: entity work.LED(Behavioral)
    port map (top_reach => top_reach, led_out => led_out);

anode_ctrl <= shift_reg;
anode_enable <= '1';

end Behavioral;
