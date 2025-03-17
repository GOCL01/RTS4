library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SERVO_PWM is
generic (MSB: natural := 15);
port(
       clk:               in  std_logic;
       rst:               in  std_logic;
       dutyCycle:  in  std_logic_vector(MSB downto 0);
       pwmOut:    out std_logic);
 end entity SERVO_PWM;
 
 architecture Behavioral of SERVO_PWM  is
 
 begin
 
 -- ADD FUNCTIONALITY PWM
 
 end architecture Behavioral;
