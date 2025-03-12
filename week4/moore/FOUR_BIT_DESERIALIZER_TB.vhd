library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FOUR_BIT_DESERIALIZER_TB is
end entity FOUR_BIT_DESERIALIZER_TB;

architecture testbench of FOUR_BIT_DESERIALIZER_TB is

    signal CLK        : std_logic := '0';
    signal RST        : std_logic := '0';
    signal DATA_IN    : std_logic := '0';
    signal VALID_IN   : std_logic := '0';
    signal DATA_OUT   : std_logic_vector(3 downto 0);
    signal VALID_OUT  : std_logic;
    
    constant CLK_PERIOD : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: entity work.FOUR_BIT_DESERIALIZER
    port map (
        CLK       => CLK,
        RST       => RST,
        DATA_IN   => DATA_IN,
        VALID_IN  => VALID_IN,
        DATA_OUT  => DATA_OUT,
        VALID_OUT => VALID_OUT
    );

    -- Clock process
    process
    begin
        while true loop
            CLK <= '0';
            wait for CLK_PERIOD / 2;
            CLK <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    -- Stimulus process without loop
    process
    begin
        -- Reset the design
        RST <= '1';
        wait for 2 * CLK_PERIOD;
        RST <= '0';
        wait for CLK_PERIOD;

        -- Send 4-bit data serially without loop
        DATA_IN <= '1'; VALID_IN <= '1'; wait for CLK_PERIOD;
        DATA_IN <= '0'; VALID_IN <= '1'; wait for CLK_PERIOD;
        DATA_IN <= '1'; VALID_IN <= '1'; wait for CLK_PERIOD;
        DATA_IN <= '1'; VALID_IN <= '1'; wait for CLK_PERIOD;
        
        -- End of transmission
        VALID_IN <= '0';
        wait for CLK_PERIOD;
        
        -- Observe output
        wait for 5 * CLK_PERIOD;
        
        -- End simulation
        --assert false report "Simulation finished" severity note;
        wait;
    end process;

end architecture testbench;
