library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SPI_SLAVE_HANDLER is
    port(
        clk:                in   std_logic;
        rst:                in   std_logic;
        spiClk:             in   std_logic;
        ss:                 in   std_logic;
        mosi:               in   std_logic;
        sensorVals:         in   std_logic_vector(55 downto 0);
        miso:               out  std_logic;
        cmd:                out  std_logic_vector(55 downto 0)
    );
end entity SPI_SLAVE_HANDLER;

architecture Behavioral of SPI_SLAVE_HANDLER is
begin

    -- Add your design here

end architecture Behavioral;
