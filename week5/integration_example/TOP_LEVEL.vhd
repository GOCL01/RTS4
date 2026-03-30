library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TOP_LEVEL is
    Port (
        SYS_CLK : in  STD_LOGIC;  -- 50 MHz
        RST     : in  STD_LOGIC;
        S1      : in  STD_LOGIC;
        S2      : in  STD_LOGIC;
        CLK_OUT : out STD_LOGIC
    );
end TOP_LEVEL;

architecture Behavioral of TOP_LEVEL is

    ------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    ------------------------------------------------------------------
    component CLOCK_DIVIDER
        Port (
            SYS_CLK        : in  STD_LOGIC;
            RST            : in  STD_LOGIC;
            CLK_OUT_DIV_01 : out STD_LOGIC;
            CLK_OUT_DIV_02 : out STD_LOGIC;
            CLK_OUT_DIV_03 : out STD_LOGIC;
            CLK_OUT_DIV_04 : out STD_LOGIC
        );
    end component;

-- students declare here their MUX4 design


    -- INTERNAL SIGNALS

-- students declare here their internal signals

begin


    -- CLOCK DIVIDER INSTANTIATION

    uut_clk_div: CLOCK_DIVIDER
        port map (
            SYS_CLK        => SYS_CLK,
            RST            => RST,
            CLK_OUT_DIV_01 => DATA_IN_01,
            CLK_OUT_DIV_02 => DATA_IN_02,
            CLK_OUT_DIV_03 => DATA_IN_03,
            CLK_OUT_DIV_04 => DATA_IN_04
        );


    -- MUX4 INSTANTIATION

    -- students add here their MUX4 declaration


    -- OUTPUT

    CLK_OUT <= DATA_OUT;

end Behavioral;
