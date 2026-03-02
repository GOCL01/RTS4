-- IMPORTANT NOTICE THAT : THIS IS A TESTBENCH, FOR NOW ONLY USE IT IN MODELSIM 
-- IMPORTANT NOTICE THAT : TESTBENCHES ARE NOT USED TO COMPILE / SYNTHEZISED DESIGNS IN QUARTUS

library IEEE;
use IEEE.std_logic_1164.all;

entity tb_DEMUX_1_TO_8 is
end entity;

architecture behavior of tb_DEMUX_1_TO_8 is
    -- Component Declaration for the Unit Under Test (UUT)
    component DEMUX_1_TO_8
        port (
            DMUX_IN    : in  std_logic;
            SEL        : in  std_logic_vector(2 downto 0);
            DMUX_OUT   : out std_logic_vector(7 downto 0)

        );
    end component;

    -- Signals to connect to UUT
    signal DMUX_IN    : std_logic := '0';
    signal SEL        : std_logic_vector(2 downto 0) := "000";
    signal DMUX_OUT   : std_logic_vector(7 downto 0);


begin
    -- Instantiate the Unit Under Test (UUT)
    uut: DEMUX_1_TO_8
        port map (
            DMUX_IN    => DMUX_IN,
            SEL        => SEL,
            DMUX_OUT   => DMUX_OUT
        );

    -- Stimulus Process
    stim_proc: process
    begin
        -- Test case 1: DMUX_IN = '1', SEL = "000"
        DMUX_IN <= '1'; 
        SEL <= "000"; wait for 10 ns;

        -- Test case 2: DMUX_IN = '1', SEL = "001"
        SEL <= "001"; wait for 10 ns;

        -- Test case 3: DMUX_IN = '1', SEL = "010"
        SEL <= "010"; wait for 10 ns;

        -- Test case 4: DMUX_IN = '1', SEL = "011"
        SEL <= "011"; wait for 10 ns;

        -- TODO : complete the tests

        -- Test case 5: DMUX_IN = '0', cycle through all selects
        DMUX_IN <= '0';
        SEL <= "000"; wait for 10 ns;
        SEL <= "001"; wait for 10 ns;
        SEL <= "010"; wait for 10 ns;
        SEL <= "011"; wait for 10 ns;
        -- TODO : complete the tests

        -- End simulation
        wait;
    end process;
end architecture behavior;
