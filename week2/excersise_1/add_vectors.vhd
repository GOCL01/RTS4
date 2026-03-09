library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- This design is intentionally wrong 
-- Students must fix it 

entity add_vectors is
    port(
        a : in  std_logic_vector(3 downto 0);
        b : in  std_logic_vector(3 downto 0);
        sum : out std_logic_vector(4 downto 0)
    );
end add_vectors;

architecture Behavioral of add_vectors is
begin

    process(a,b)
    begin
        sum <= a + b;  
    end process;

end Behavioral;
