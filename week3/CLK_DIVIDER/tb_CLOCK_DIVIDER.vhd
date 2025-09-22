library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_CLOCK_DIVIDER is
end tb_CLOCK_DIVIDER;

architecture Behavioral of tb_CLOCK_DIVIDER is
    -- DUT ports
    signal SYS_CLK        : std_logic := '0';
    signal RST            : std_logic := '0';
    signal CLK_OUT_DIV_01 : std_logic;
    signal CLK_OUT_DIV_02 : std_logic;
    signal CLK_OUT_DIV_03 : std_logic;
    signal CLK_OUT_DIV_04 : std_logic;

    -- Clock period constant (100 ns = 10 MHz clock)
    constant CLK_PERIOD : time := 100 ns;
begin

    -- Instantiate the Unit Under Test (UUT)
    uut: entity work.CLOCK_DIVIDER
        port map (
            SYS_CLK        => SYS_CLK,
            RST            => RST,
            CLK_OUT_DIV_01 => CLK_OUT_DIV_01,
            CLK_OUT_DIV_02 => CLK_OUT_DIV_02,
            CLK_OUT_DIV_03 => CLK_OUT_DIV_03,
            CLK_OUT_DIV_04 => CLK_OUT_DIV_04
        );

    -- Clock generation
    clk_process : process
    begin
        while true loop
            SYS_CLK <= '0';
            wait for CLK_PERIOD / 2;
            SYS_CLK <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    -- Reset + simulation control
    stim_proc : process
    begin
        -- Apply reset
        RST <= '1';
        wait for 200 ns;   -- hold reset for 2 cycles
        RST <= '0';

        -- Run simulation for a while
        wait for 2 ms;

        -- Stop simulation
        assert false report "Simulation Finished" severity failure;
    end process;

end Behavioral;

