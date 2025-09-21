library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity UP_DOWN_COUNTER is
    port (   
        CLK        : in  std_logic;
        RST        : in  std_logic;
        COUNT_DOWN : in  std_logic;
        DATA_OUT   : out std_logic_vector(7 downto 0)
    );
end entity UP_DOWN_COUNTER;

architecture behavior of UP_DOWN_COUNTER is

    type stateMachine is (IDLE, CNT_UP, CNT_DOWN);

    signal currentState : stateMachine;
    signal sigCounter   : integer range -128 to 127;

begin
    process (CLK, RST)
    begin
        if (rising_edge(CLK)) then
            if (RST = '1') then
                currentState <= IDLE;
                sigCounter   <= 0;
            else
                case currentState is
                    when CNT_UP =>
                        if (COUNT_DOWN = '1') then
                            currentState <= CNT_DOWN;
                            sigCounter   <= sigCounter - 1;
                        else
                            sigCounter   <= sigCounter + 1;
                        end if;

                    when IDLE =>
                        if (COUNT_DOWN = '1') then
                            currentState <= CNT_DOWN;
                            sigCounter   <= sigCounter - 1;
                        else
                            currentState <= CNT_UP;
                            sigCounter   <= sigCounter + 1;
                        end if;

                    when CNT_DOWN =>
                        if (COUNT_DOWN = '1') then
                            sigCounter   <= sigCounter - 1;
                        else
                            currentState <= CNT_UP;
                            sigCounter   <= sigCounter + 1;
                        end if;
                end case;
            end if;
        end if;
    end process;

    -- Map integer counter to output
    DATA_OUT <= std_logic_vector(to_signed(sigCounter, 8));

end architecture behavior;
