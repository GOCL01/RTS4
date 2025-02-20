library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity multiplier is
    Port ( DATA_IN : in STD_LOGIC_VECTOR(7 downto 0);
           POSITION: in STD_LOGIC_VECTOR(2 downto 0);
           DATA_OUT : out STD_LOGIC_VECTOR(7 downto 0));
end multiplier;

architecture dataFlow of multiplier is

begin

   DATA_OUT <= std_logic_vector(SHIFT_LEFT(unsigned(DATA_IN), to_integer(unsigned(POSITION))));
	 
end architecture dataFlow;
