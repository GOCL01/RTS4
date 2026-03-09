library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_unsigned_adder is
-- Testbench has no ports
end tb_unsigned_adder;

architecture Behavioral of tb_unsigned_adder is

    -- Inputs
    signal a, b : std_logic_vector(3 downto 0);
    signal sum  : std_logic_vector(4 downto 0);  -- 5 bits to handle carry

begin

    -----------------------------------------------------------------
    -- Unsigned adder (concurrent)
    -----------------------------------------------------------------
    sum <= std_logic_vector(
               resize(unsigned(a), sum'length) + 
               resize(unsigned(b), sum'length)
           );

    -----------------------------------------------------------------
    -- Stimulus
    -----------------------------------------------------------------
    stim_proc : process
    begin
        a <= "0101";  -- 5
        b <= "0011";  -- 3
        wait for 10 ns;

        a <= "1111";  -- 15
        b <= "0001";  -- 1 → 16 (check 5-bit sum)
        wait for 10 ns;

        a <= "0000";  
        b <= "0000";
        wait for 10 ns;

        wait; -- End simulation
    end process stim_proc;

end Behavioral;
