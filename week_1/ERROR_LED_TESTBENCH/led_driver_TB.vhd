library IEEE;
use IEEE.Std_logic_1164.all;

entity error_led_driver_TB is
end error_led_driver_TB;

architecture BENCH of error_led_driver_TB is

signal PWM_ERR     : Std_logic;
signal SP_ERR      : Std_logic;
signal ENCODER_ERR : Std_logic;
signal ERR_LED_OUT : Std_logic;

begin

  process
  begin
    PWM_ERR <= '0'; SP_ERR <= '0'; ENCODER_ERR <= '0'; wait for 10 NS;
	PWM_ERR <= '0'; SP_ERR <= '0'; ENCODER_ERR <= '1'; wait for 10 NS;
	PWM_ERR <= '0'; SP_ERR <= '1'; ENCODER_ERR <= '0'; wait for 10 NS;
	PWM_ERR <= '0'; SP_ERR <= '1'; ENCODER_ERR <= '1'; wait for 10 NS;
	PWM_ERR <= '1'; SP_ERR <= '0'; ENCODER_ERR <= '0'; wait for 10 NS;
	PWM_ERR <= '1'; SP_ERR <= '0'; ENCODER_ERR <= '1'; wait for 10 NS;
	PWM_ERR <= '1'; SP_ERR <= '1'; ENCODER_ERR <= '0'; wait for 10 NS;
	PWM_ERR <= '1'; SP_ERR <= '1'; ENCODER_ERR <= '1'; wait for 10 NS;
    wait;
  end process;

  M: entity work.error_led_driver
  port map (
    PWM_ERR     => PWM_ERR,
    SP_ERR      => SP_ERR,
    ENCODER_ERR => ENCODER_ERR,
    ERR_LED_OUT => ERR_LED_OUT
  );

end architecture BENCH;
