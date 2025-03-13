library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_ENTITY is
    port (
        VIDEO : in  STD_LOGIC_VECTOR(3 downto 0); -- Assuming 3-bit input
        SEL   : in  STD_LOGIC_VECTOR(1 downto 0);
        V_BUS : out STD_LOGIC
    );
end MUX_ENTITY;

architecture Behavioral of MUX_ENTITY is

begin

    MUX: process (VIDEO, SEL)
    begin 
        -- Keep the given lines as they are
        for SEL in  0 to 3 loop
            V_BUS <= VIDEO(SEL); 
        end loop;
    end process MUX;
end Behavioral;
