
----------------------------------------------------------------------------------
-- Company: University of Applied Sciences Fontys
-- Author: GON01 
-- 
-- Create Date: 12.02.25
-- Design Name: COMP.vhd
-- Module Name: COMP - Flow
-- Project Name: COMP
-- Target Devices: Altera Devices
-- Description: This module compares 2-bit numbers to determine if they are equal or not.
----------------------------------------------------------------------------------



library IEEE;
use IEEE.std_logic_1164.all;

entity COMP is
port
( 
  A:  in  std_logic_vector(1 downto 0);
  B:  in  std_logic_vector(1 downto 0);
  EQ: out std_logic);
  
end entity COMP;

architecture flow of COMP is 
begin

   EQ <=  '1' when (A = B) else '0';

end architecture flow;
