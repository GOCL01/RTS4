library IEEE;
use IEEE.std_logic_1164.all;

entity DEMUX_1_TO_4 is
port
( 
  DMUX_IN        : in    std_logic;
  SEL                    : in    std_logic_vector(1 downto 0);
  DMUX_OUT_0: out std_logic;
  DMUX_OUT_1: out std_logic;
  DMUX_OUT_2: out std_logic;
  DMUX_OUT_3: out std_logic);
end entity DEMUX_1_TO_4;

architecture dataFlow of DEMUX_1_TO_4 is
begin
   DMUX_OUT_3 <= DMUX_IN when SEL = "11" else '0';
   DMUX_OUT_1 <= DMUX_IN when SEL = "01" else '0';
   DMUX_OUT_2 <= DMUX_IN when SEL = "10" else '0';
   DMUX_OUT_0 <= DMUX_IN when SEL = "00" else '0';
end architecture dataFlow;
