library IEEE;
use IEEE.Std_logic_1164.all;

entity MUX_TB is
end entity MUX_TB;

architecture BENCH of MUX_TB is

  signal IN0       : Std_logic := '0';
  signal IN1       : Std_logic := '0';
  signal IN2       : Std_logic := '0';
  signal IN3       : Std_logic := '0';
  signal SEL0      : Std_logic := '0';
  signal SEL1      : Std_logic := '0';
  
  signal MUX_OUT   : Std_logic;

begin
  
  IN0 <= not IN0 after 100 NS;
  IN1 <= not IN1 after 50  NS;
  IN2 <= not IN2 after 25  NS;
  IN3 <= not IN3 after 12  NS;

  process
  begin
    SEL0 <= '0'; SEL1 <= '0'; wait for  1 US;
	-- output of mux should be IN0
	
	SEL0 <= '1'; SEL1 <= '0'; wait for  1 US;
	-- output of mux should be IN1
	
	SEL0 <= '0'; SEL1 <= '1'; wait for  1 US;
	-- output of mux should be IN2
	
	SEL0 <= '1'; SEL1 <= '1'; wait for  1 US;
    -- output of mux should be IN3
	
	wait;
  end process;

  M: entity work.MULTIPLEXER
  port map (
    IN0  => IN0,
    IN1  => IN1,
    IN2  => IN2,
    IN3  => IN3,
    SEL0 => SEL0,
    SEL1 => SEL1,
    MUX_OUT => MUX_OUT
	);

end architecture BENCH;
