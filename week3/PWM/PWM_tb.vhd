-------------------------------------------------------------------------
-- TESTBENCH for PWMgen
-- - Provides clock and reset
-- - Drives different "power" values to exercise PWM
-- - Allows observation of PWMout, PWMdir, and PWMerror
-------------------------------------------------------------------------

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_STD.all;

entity PWMGEN_TB is
end entity PWMGEN_TB;

architecture BENCH of PWMGEN_TB is
    -------------------------------------------
    -- Signals and constants
    -------------------------------------------
    signal CLK       : std_logic := '0';   
    signal RST       : std_logic := '0';   
    signal power     : std_logic_vector(15 downto 0) := (others => '0');
    signal PWMout    : std_logic;
    signal PWMerror  : std_logic;
    signal PWMdir    : std_logic; 

    constant CLK_PERIOD : time := 20 ns; -- 50 MHz clock

begin
    -------------------------------------------
    -- Clock generator
    -------------------------------------------
    clk_gen : process
    begin
        while now < 2 ms loop  -- run simulation long enough to observe PWM
            CLK <= '0';
            wait for CLK_PERIOD/2;
            CLK <= '1';
            wait for CLK_PERIOD/2;
        end loop;
        wait;
    end process;

    -------------------------------------------
    -- Stimulus process
    -------------------------------------------
    stim_proc : process
    begin
        -- Apply reset
        RST <= '1';
        wait for 5*CLK_PERIOD;
        RST <= '0';

        -- EXAMPLE 5% DUTY CYCLE
        power <= std_logic_vector(to_signed(1000, 16));
        wait for 200*CLK_PERIOD;

        -- Write different scenarios following above example


        -- Finish simulation
        wait;
    end process;

    -------------------------------------------
    -- Instantiate the UUT
    -------------------------------------------
    UUT: entity work.PWMgen
        port map (
            CLK      => CLK,
            RST      => RST,
            power    => power,
            PWMout   => PWMout,
            PWMdir   => PWMdir,
            PWMerror => PWMerror
        );

end architecture BENCH;
