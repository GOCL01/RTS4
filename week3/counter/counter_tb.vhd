library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_COUNTER_WITH_ENABLE is
end TB_COUNTER_WITH_ENABLE;

architecture behavior of TB_COUNTER_WITH_ENABLE is

    -- Component Declaration for the Unit Under Test (UUT)
    component COUNTER_WITH_ENABLE
    port (
        CLK     : in  std_logic;
        EN      : in  std_logic;
        RST     : in  std_logic;
        CNT_OUT : out std_logic_vector(7 downto 0)
    );
    end component;

    -- Signals for simulation
    signal CLK     : std_logic := '0';
    signal EN      : std_logic := '0';
    signal RST     : std_logic := '0';
    signal CNT_OUT : std_logic_vector(7 downto 0);
    
    -- Clock period definition
    constant CLK_PERIOD : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: COUNTER_WITH_ENABLE port map (
        CLK     => CLK,
        EN      => EN,
        RST     => RST,
        CNT_OUT => CNT_OUT
    );

    -- Clock process definitions
    CLK_process: process
    begin
        while now < 3 ms loop  -- Run simulation for3ms
            CLK <= '0';
            wait for CLK_PERIOD / 2;
            CLK <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;
    
    -- Stimulus process
    stim_proc: process
    begin
        -- Reset the counter
        RST <= '0';
        wait for 20 ns;
        RST <= '1';
        wait for 20 ns;
        RST <= '0';
		
        -- Enable the counter
        EN <= '1';
        wait for 100 ns;
        
        
        -- Stop simulation
        wait;
    end process;

end behavior;
