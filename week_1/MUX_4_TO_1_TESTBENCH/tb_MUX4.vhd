library IEEE;
use IEEE.std_logic_1164.all;

entity tb_MUX4 is
end entity;

architecture sim of tb_MUX4 is



    -- Signals for DUT
    signal DATA_IN_01 : std_logic := '0';
    signal DATA_IN_02 : std_logic := '0';
    signal DATA_IN_03 : std_logic := '0';
    signal DATA_IN_04 : std_logic := '0';
    signal S1, S2    : std_logic := '0';
    signal DATA_OUT  : std_logic;

begin
    -- DUT Instantiation
    uut: entity work.MUX4
        port map (
            DATA_IN_01 => DATA_IN_01,
            DATA_IN_02 => DATA_IN_02,
            DATA_IN_03 => DATA_IN_03,
            DATA_IN_04 => DATA_IN_04,
            S1 => S1,
            S2 => S2,
            DATA_OUT => DATA_OUT
        );

    -- Stimulus Process
    stim_proc: process
    begin
        -- Test 1: DATA_IN_01 selected
        DATA_IN_01 <= '1'; DATA_IN_02 <= '0'; DATA_IN_03 <= '0'; DATA_IN_04 <= '0';
        S1 <= '0'; S2 <= '0';
        wait for 10 ns;

        -- Test 2: DATA_IN_02 selected
        DATA_IN_01 <= '0'; DATA_IN_02 <= '1';
        S1 <= '0'; S2 <= '1';
        wait for 10 ns;

        -- Test 3: DATA_IN_03 selected
        DATA_IN_02 <= '0'; DATA_IN_03 <= '1';
        S1 <= '1'; S2 <= '0';
        wait for 10 ns;

        -- Test 4: DATA_IN_04 selected
        DATA_IN_03 <= '0'; DATA_IN_04 <= '1';
        S1 <= '1'; S2 <= '1';
        wait for 10 ns;

        -- Additional tests with mixed values
        DATA_IN_01 <= '1'; DATA_IN_02 <= '1'; DATA_IN_03 <= '0'; DATA_IN_04 <= '0';
        S1 <= '0'; S2 <= '0';  
        wait for 10 ns;

        S1 <= '0'; S2 <= '1'; 
        wait for 10 ns;

        S1 <= '1'; S2 <= '0';  
        wait for 10 ns;

        S1 <= '1'; S2 <= '1';  
        wait for 10 ns;

        wait; -- end simulation
    end process;

end architecture sim;
