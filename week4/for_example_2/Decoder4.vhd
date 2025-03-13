library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Decoder4 is
    Port (
        A : in  STD_LOGIC_VECTOR (1 downto 0);
        Z : out STD_LOGIC_VECTOR (3 downto 0)
    );
end Decoder4;

architecture Behavioral of Decoder4 is
begin
    process (A)
    begin
        Z <= (others => '0');
        
        for Idx in 0 to 3 loop
            if (A = std_logic_vector(to_unsigned(Idx, 2))) then
                Z(Idx) <= '1';
            end if;
        end loop;
        
    end process;
end Behavioral;
