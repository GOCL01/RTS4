library IEEE;
use IEEE.std_logic_1164.all;

entity tb_DEMUX_1_TO_4 is
end entity;

architecture behavior of tb_DEMUX_1_TO_4 is
    -- Component Declaration for the Unit Under Test (UUT)
    component DEMUX_1_TO_4
        port (
            DMUX_IN    : in  std_logic;
            SEL        : in  std_logic_vector(1 downto 0);
            DMUX_OUT_0 : out std_logic;
            DMUX_OUT_1 : out std_logic;
            DMUX_OUT_2 : out std_logic;
            DMUX_OUT_3 : out std_logic
        );
    end component;

    -- Signals to connect to UUT
    signal DMUX_IN    : std_logic := '0';
    signal SEL        : std_logic_vector(1 downto 0) := "00";
    signal DMUX_OUT_0 : std_logic;
    signal DMUX_OUT_1 : std_logic;
    signal DMUX_OUT_2 : std_logic;
    signal DMUX_OUT_3 : std_logic;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: DEMUX_1_TO_4
        port map (
            DMUX_IN    => DMUX_IN,
            SEL        => SEL,
            DMUX_OUT_0 => DMUX_OUT_0,
            DMUX_OUT_1 => DMUX_OUT_1,
            DMUX_OUT_2 => DMUX_OUT_2,
            DMUX_OUT_3 => DMUX_OUT_3
        );

    -- Stimulus Process
    stim_proc: process
    begin
        -- Test case 1: DMUX_IN = '1', SEL = "00"
        DMUX_IN <= '1'; SEL <= "00"; wait for 10 ns;

        -- Test case 2: DMUX_IN = '1', SEL = "01"
        SEL <= "01"; wait for 10 ns;

        -- Test case 3: DMUX_IN = '1', SEL = "10"
        SEL <= "10"; wait for 10 ns;

        -- Test case 4: DMUX_IN = '1', SEL = "11"
        SEL <= "11"; wait for 10 ns;

        -- Test case 5: DMUX_IN = '0', cycle through all selects
        DMUX_IN <= '0';
        SEL <= "00"; wait for 10 ns;
        SEL <= "01"; wait for 10 ns;
        SEL <= "10"; wait for 10 ns;
        SEL <= "11"; wait for 10 ns;

        -- End simulation
        wait;
    end process;
end architecture behavior;
