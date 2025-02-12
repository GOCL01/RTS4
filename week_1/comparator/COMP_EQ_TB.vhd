----------------------------------------------------------------------------------
-- Company: University of Applied Sciences Fontys
-- Author: GON01 
-- 
-- Create Date: 12.02.25
-- Design Name: COMP_EQ_TB.vhd
-- Module Name: COMP_EQ_TB - Testbench
-- Project Name: COMP_EQ_TB
-- Target Devices: Simulation purpose
-- Description: Testbench for COMP.vhd
----------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity COMP_EQ_TB is
end entity COMP_EQ_TB;

architecture test of COMP_EQ_TB is
    -- Component declaration
    component COMP
        port (
            A  : in  std_logic_vector(1 downto 0);
            B  : in  std_logic_vector(1 downto 0);
            EQ : out std_logic
        );
    end component;

    -- Signals to connect to the component
    signal A_tb  : std_logic_vector(1 downto 0);
    signal B_tb  : std_logic_vector(1 downto 0);
    signal EQ_tb : std_logic;

begin
    -- Instantiate the component
    UUT: COMP port map (A => A_tb, B => B_tb, EQ => EQ_tb);

    -- Test process
    process
    begin
        -- Test Case 1: A = "00", B = "00"
        A_tb <= "00"; B_tb <= "00";
        wait for 10 ns;
        
        -- Test Case 2: A = "01", B = "00"
        A_tb <= "01"; B_tb <= "00";
        wait for 10 ns;
        
        -- Test Case 3: A = "10", B = "10"
        A_tb <= "10"; B_tb <= "10";
        wait for 10 ns;
        
        -- Test Case 4: A = "11", B = "10"
        A_tb <= "11"; B_tb <= "10";
        wait for 10 ns;
        
        -- Test Case 5: A = "11", B = "11"
        A_tb <= "11"; B_tb <= "11";
        wait for 10 ns;
        
        -- End simulation
        wait;
    end process;
end architecture test;
