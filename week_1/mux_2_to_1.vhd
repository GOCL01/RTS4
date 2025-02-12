----------------------------------------------------------------------------------
-- Company: University of Applied Sciences Fontys
-- Author: GON01 
-- 
-- Create Date: 21.06.2023 11:02:51
-- Design Name: mux_2_to_1.vhd
-- Module Name: mux_2_to_1 - Behavioral
-- Project Name: mux_2_to_1
-- Target Devices: zybo z7-10
-- Description: 2-to-1 MUX
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

entity mux_2_to_1 is
    Port ( in1 : in STD_LOGIC;
           in2 : in STD_LOGIC;
           sel: in STD_LOGIC;
           output : out STD_LOGIC);
end mux_2_to_1;

architecture Behavioral of mux_2_to_1 is

begin

output <= (sel and in1) or (not sel and in2);


end Behavioral;
