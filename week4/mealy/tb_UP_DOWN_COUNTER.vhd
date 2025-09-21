library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_UP_DOWN_COUNTER is
end entity;

architecture sim of tb_UP_DOWN_COUNTER is
    -- DUT signals
    signal CLK        : std_logic := '0';
    signal RST        : std_logic := '0';
    signal COUNT_DOWN : std_logic := '0';
    signal DATA_OUT   : std_logic_vector(7 downto 0);

    -- Clock period constant
    constant CLK_PERIOD : time := 10 ns;

begin
    -- Instantiate DUT
    DUT: entity work.UP_DOWN_COUNTER
        port map (
            CLK        => CLK,
            RST        => RST,
            COUNT_DOWN => COUNT_DOWN,
            DATA_OUT   => DATA_OUT
        );

    -- Clock process
    clk_gen : process
    begin
        while now < 500 ns loop
            CLK <= '0';
            wait for CLK_PERIOD/2;
            CLK <= '1';
            wait for CLK_PERIOD/2;
        end loop;
        wait;
    end process clk_gen;

    -- Stimulus process
    stim_proc : process
    begin
        -- Initial reset
        RST <= '1';
        wait for 2*CLK_PERIOD;
        RST <= '0';

        -- Let counter run UP for a while
        COUNT_DOWN <= '0';
        wait for 10*CLK_PERIOD;

        -- Switch to COUNT DOWN
        COUNT_DOWN <= '1';
        wait for 10*CLK_PERIOD;

        -- Back to COUNT UP
        COUNT_DOWN <= '0';
        wait for 10*CLK_PERIOD;

        -- Assert reset again
        RST <= '1';
        wait for 2*CLK_PERIOD;
        RST <= '0';

        wait for 10*CLK_PERIOD;

        -- Finish simulation
        wait;
    end process stim_proc;

end architecture sim;
