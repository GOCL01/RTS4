library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GRIPPER_CMP is
    port(
        clk            : in   std_logic;
        rst            : in   std_logic;
        command        : in   std_logic_vector(17 downto 0);
        pressure       : in   std_logic_vector(15 downto 0);  
        dutyCycle      : out  std_logic_vector(15 downto 0)     
    );
end entity GRIPPER_CMP;

architecture Behavioral of GRIPPER_CMP is
begin

    -- Add your design here

end architecture Behavioral;
