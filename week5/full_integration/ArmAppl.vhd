library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ArmAppl is
    port (
        clk         : in  std_logic;
        rst         : in  std_logic;
        command     : in  std_logic_vector(7 downto 0);
        pressure    : in  std_logic_vector(15 downto 0);
        sensorVls   : in  std_logic_vector(31 downto 0);
        sixDOFs     : in  std_logic_vector(47 downto 0);
        gripperData : in  std_logic_vector(7 downto 0)
    );
end entity ArmAppl;

architecture EmptyArch of ArmAppl is
begin
    -- Empty architecture
end architecture EmptyArch;
