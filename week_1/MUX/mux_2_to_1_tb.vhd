library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2_to_1_tb is
end mux_2_to_1_tb;

architecture Behavioral of mux_2_to_1_tb is

    signal in1_tb    : STD_LOGIC := '0';
    signal in2_tb    : STD_LOGIC := '0';
    signal sel_tb    : STD_LOGIC := '0';
    signal output_tb : STD_LOGIC;

begin

    DUT: entity work.mux_2_to_1
        port map (
            in1    => in1_tb,
            in2    => in2_tb,
            sel    => sel_tb,
            output => output_tb
        );

    process
    begin

        -- Test 1
        in1_tb <= '0';
        in2_tb <= '1';
        sel_tb <= '0';
        wait for 10 ns;

        -- Test 2
        -- add your test scenario


        -- Test 3
        -- add your test scenario

        -- Test 4
        -- add your test scenario

        wait;

    end process;

end Behavioral;
