
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_counter_to_10 is
end tb_counter_to_10;

architecture Behavioral of tb_counter_to_10 is

    -- Component declaration
    component counter_to_10
        Port (
            clk   : in  STD_LOGIC;
            reset : in  STD_LOGIC;
            count : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    -- Signals to connect to DUT
    signal clk   : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal count : STD_LOGIC_VECTOR(3 downto 0);

    constant clk_period : time := 10 ns;

begin

    -- Instantiate the DUT (Device Under Test)
    uut: counter_to_10
        port map (
            clk   => clk,
            reset => reset,
            count => count
        );

    -- Clock generation
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Apply reset
        reset <= '1';
        wait for 3 ns;
        reset <= '0';

        -- Let the counter run for a while
        wait for 200 ns;

        -- Apply reset again to test behavior
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        -- Run again
        wait for 200 ns;

        -- Stop simulation
        wait;
    end process;

end Behavioral;
