library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FOUR_BIT_DESERIALIZER is
port (   
   CLK               :in  std_logic;
   RST               :in  std_logic;
   DATA_IN       :in  std_logic;
   VALID_IN     :in  std_logic;
   DATA_OUT   :out std_logic_vector(3 downto 0);
   VALID_OUT  :out std_logic);
end entity FOUR_BIT_DESERIALIZER;

architecture behavior of FOUR_BIT_DESERIALIZER is
type stateMachine is (IDLE, READ_1, READ_2,       
                                        READ_3, READ_4);
signal currentState: stateMachine;
signal sigData: std_logic_vector(3 downto 0);
begin

process (clk, rst) is
begin
if(rising_edge(clk)) then
   if(rst = '1') then
      currentState <= IDLE;
      DATA_OUT <= (others => '0');
   else
      case (currentState) is
      when IDLE =>			
         if (valid_in = '1') then
            currentState <= READ_1;
            sigData(0) <= DATA_IN;
         end if;	
         DATA_OUT <= (others => '0');
         VALID_OUT <= '0';
 
      when READ_1 =>
         if (valid_in = '1') then
            currentState <= READ_2;
            sigData(1) <= DATA_IN;
         else				         
            currentState <= IDLE;
            sigData <= (others => '0');
        end if;
        DATA_OUT <= (others => '0');
        VALID_OUT <= '0';
		  
		when READ_2 =>
         if (valid_in = '1') then
            currentState <= READ_3;
            sigData(2) <= DATA_IN;
         else				         
            currentState <= IDLE;
            sigData <= (others => '0');
        end if;
        DATA_OUT <= (others => '0');
        VALID_OUT <= '0';
  
      when READ_3 =>
         if (valid_in = '1') then
            currentState <= READ_4;
            sigData(3) <= DATA_IN;
         else				         
            currentState <= IDLE;
            sigData <= (others => '0');
        end if;
        DATA_OUT <= (others => '0');
        VALID_OUT <= '0';
 
      when READ_4 =>
			         
        currentState <= IDLE;	
        sigData <= (others => '0');
        DATA_OUT <= sigData;
        VALID_OUT <= '1';
		  
		  end case;
   end if;
end if;
end process;
end architecture behavior;


