----------------------------------------------------------------------------------
-- Company: University of Applied Sciences Fontys
-- Author: GON01 
-- 
-- Create Date: 21.06.2023 11:02:51
-- Design Name: signed_adder_Nbits.vhd
-- Module Name: signed_adder_Nbits - Behavioral
-- Project Name: signed_adder_Nbits
-- Target Devices: zybo z7-10
-- Description: Simple design that performs an unsigned 
--              addition of two N-bits length numbers, where N is a parameter
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder is
    generic(length : integer:=8; -- parametrize length
            max : integer:=((2**8)/2)-1); -- parametrize range   
    Port ( in1 : in STD_LOGIC_VECTOR (length-1 downto 0);
           in2 : in STD_LOGIC_VECTOR (length-1 downto 0);
           output : out STD_LOGIC_VECTOR (length downto 0));
end adder;

architecture Behavioral of adder is
signal output_s : integer range -max+1 to max;
begin

output_s <= to_integer(signed(in1)) + to_integer(signed(in2));
output <= std_logic_vector(to_signed(output_s, length+1));

end Behavioral;
