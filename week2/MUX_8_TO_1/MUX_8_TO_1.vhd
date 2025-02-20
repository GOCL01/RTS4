----------------------------------------------------------------------------------
-- Company: University of Applied Sciences Fontys
-- 
-- 
-- Create Date: 21.06.2023 
-- Design Name: mux_8_to_1.vhd
-- Module Name: mux_8_to_1 - Behavioral
-- Project Name: mux_8_to_1
-- Target Devices: Altera boards
-- Description: 8-to-1 MUX
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity MUX_8_TO_1 is
    Port ( MUX_IN : in STD_LOGIC_VECTOR(7 downto 0);
           SEL: in STD_LOGIC_VECTOR(2 downto 0);
           MUX_OUT : out STD_LOGIC);
end MUX_8_TO_1;

architecture combinatory of MUX_8_TO_1 is
begin 

    MUX_EVAL: process(SEL, MUX_IN) is
    begin
       MUX_OUT <= MUX_IN(to_integer(unsigned(SEL)));
    end process MUX_EVAL;
	 	
 end architecture combinatory;
