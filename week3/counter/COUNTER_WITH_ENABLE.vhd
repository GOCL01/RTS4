library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity COUNTER_WITH_ENABLE is
port (
      CLK     :in  std_logic;
      EN      :in  std_logic;
      RST     :in  std_logic;
      CNT_OUT :out std_logic_vector(7 downto 0));
end entity COUNTER_WITH_ENABLE;


architecture behavior of COUNTER_WITH_ENABLE is
-- EXCERCISE 3 MODEL SIM: INSTEAD OF unsigned, DECLARE sigCnt as INTEGER with these scenarios:
-- 							a. Constrained integer 0 to 255
--							b. Constrained integer 0 to 128
-- 							HINT DO NOT FORGET ALSO TO CHANGE LINE 27 and 42 to match the use of the new data type

	
signal sigCnt: unsigned(7 downto 0);
begin 
   -- EXCERCISE 2 MODEL SIM: RUN SIMULATION AND FIND THE PITFALL OF THIS DESIGN
   CNT_EVAL: process(CLK) is
   begin
      if RST = '1' then
         sigCnt <= (others => '0');
      else
        if (rising_edge(CLK))then
          if (EN = '1') then
             sigCnt <= sigCnt + 1;
			else
             null;
			end if;
        end if;
      end if;
   end process CNT_EVAL;
	
   -- EXCERCISE 1 QUARTUS : PLACE "CNT_OUT <= std_logic_vector(sigCnt);" INSIDE PROCESS
   -- What the difference is in the generated RTL?	

	CNT_OUT <= std_logic_vector(sigCnt);	 
end architecture behavior;


