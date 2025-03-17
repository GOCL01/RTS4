library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROBOT_ARM is
generic (MSB: natural := 15);
port(
       sysClk:            in  std_logic;
       rst:                   in  std_logic;
       spiClk:             in  std_logic;
       ss:                    in  std_logic;
       mosi:               in  std_logic;
       pressureData: in   std_logic_vector(15 downto 0);
       miso:                out std_logic;
       pwmGripper:  out std_logic;
       pwmBase:       out std_logic;
       pwmWrist:      out std_logic;
       pwmShoulder: out std_logic;
       pwmElbow:      out std_logic);
end entity ROBOT_ARM;

architecture topHierarcy of ROBOT_ARM is

---------------------------------------------------------------------
-------------------- SERVO_PWM COMPONENT ----------------------------

component SERVO_PWM is
generic (MSB: natural := 15);
port(
       clk:               in  std_logic;
       rst:               in  std_logic;
       dutyCycle:  in  std_logic_vector(MSB downto 0);
       pwmOut:    out std_logic);
 end component SERVO_PWM;
 
 
 
---------------------------------------------------------------------
-------------------- Inverse Kinematic COMPONENT --------------------
 
 component INV_KIN is
    port (
        clk        : in std_logic;
        sixDOF     : in std_logic_vector; -- Specify the width of this signal
        rst        : in std_logic;
        dutyCycle  : out std_logic_vector(63 downto 0)
    );
end component;

---------------------------------------------------------------------
-------------------- Signal Declaration -----------------------------

signal sigGripperDutyCycle: std_logic_vector(15 downto 0);
signal sigWristDutyCycle: std_logic_vector(15 downto 0);
signal sigShoulderDutyCycle: std_logic_vector(15 downto 0);
signal sigBaseDutyCycle: std_logic_vector(15 downto 0);
signal sigElbowDutyCycle: std_logic_vector(15 downto 0);



begin

---------------------------------------------------------------------
-------------------- SERVO_PWM INSTANCE 1 ----------------------------

PWM_GRIPPER: SERVO_PWM
generic map(MSB => MSB)
port map(
   clk => sysClk,
   rst => rst,
   dutyCycle => sigGripperDutyCycle,
   pwmOut => pwmGripper);
   

---------------------------------------------------------------------
-------------------- SERVO_PWM INSTANCE 2 ----------------------------

-- Add here PWM Wrist Instance with its port map

---------------------------------------------------------------------
-------------------- SERVO_PWM INSTANCE 3 ----------------------------

-- Add here PWM Shoulder Instance with its port map

---------------------------------------------------------------------
-------------------- SERVO_PWM INSTANCE 4 ----------------------------

-- Add here PWM Elbow Instance with its port map

---------------------------------------------------------------------
-------------------- SERVO_PWM INSTANCE 5 ----------------------------

-- Add here PWM Base Instance with its port map

---------------------------------------------------------------------
-------------------- INV KINEMATICS INSTANCE  -----------------------
	
-- add here the Inverse Kinematic Instance with its port map
	  


end architecture topHierarcy;
