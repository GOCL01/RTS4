----------------------------------------------------------------------------------
-- Company: University of Applied Sciences Fontys
-- 
-- 
-- Create Date: 21.09.26
-- Design Name: mux_8_to_1.vhd
-- Module Name: mux_8_to_1 - Behavioral
-- Project Name: mux_8_to_1
-- Target Devices: Altera boards
-- Description: 8-to-1 MUX using both : hardware priority and non-priority
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
  
    MUX_EVAL:process(SEL, MUX_IN)is
    begin
           if SEL = "000" then
              MUX_OUT <= MUX_IN(0);
           elsif  SEL = "001" then
					MUX_OUT <= MUX_IN(1);
           elsif  SEL = "010" then
					MUX_OUT <= MUX_IN(2);
			  elsif  SEL = "011" then
					MUX_OUT <= MUX_IN(3);
			  elsif  SEL = "100" then    
					MUX_OUT <= MUX_IN(4);
			  elsif  SEL = "101" then
					MUX_OUT <= MUX_IN(5);
			  elsif  SEL = "110" then
					MUX_OUT <= MUX_IN(6);
			  elsif  SEL = "111" then
					MUX_OUT <= MUX_IN(7);
			  else
					MUX_OUT <= '0';
			   end if;

		 
    end process MUX_EVAL;
	 
--MUX_EVAL:process(SEL, MUX_IN)is    
-- begin
--       case(SEL) is
--	   when "000" =>
--	      MUX_OUT <= MUX_IN(0);
--           when "001" =>
--	      MUX_OUT <= MUX_IN(1);
--           when "010" =>
--	      MUX_OUT <= MUX_IN(2);
--           when "011" =>
--	      MUX_OUT <= MUX_IN(3);
--           when "100" =>
--	      MUX_OUT <= MUX_IN(4);
--	    when "101" =>
--	      MUX_OUT <= MUX_IN(5);
--	    when "110" =>
--	      MUX_OUT <= MUX_IN(6);
--	    when "111" =>
--	      MUX_OUT <= MUX_IN(7);
--	    when others =>
--	      MUX_OUT <= '0';
--	 end case;		    
--   end process MUX_EVAL; 

	 	
 end architecture combinatory;
