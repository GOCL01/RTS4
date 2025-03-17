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
-------------------- ArmAppl COMPONENT -------------------------------
 
 component ArmAppl is 
     port (
        clk         : in  std_logic;
        rst         : in  std_logic;
        command     : in  std_logic_vector(7 downto 0);
        pressure    : in  std_logic_vector(15 downto 0);
        sensorVls   : in  std_logic_vector(31 downto 0);
        sixDOFs     : in  std_logic_vector(47 downto 0);
        gripperData : in  std_logic_vector(7 downto 0)
    );
 end component ArmAppl; 
 
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
-------------------- SPI SLAVE COMPONENT ----------------------------

component SPI_SLAVE_HANDLER is
port(

       clk:                in   std_logic;
       rst:                in   std_logic;
       spiClk:          in   std_logic;
       ss:                 in   std_logic;
       mosi:            in   std_logic;
       sensorVals:  in   std_logic_vector(55 downto 0);
       miso:            out std_logic;
       cmd:             out std_logic_vector(55 downto 0));
       
end component SPI_SLAVE_HANDLER;

---------------------------------------------------------------------
-------------------- GRIPPER CMD COMPONENT --------------------------

component GRIPPER_CMP is
    port(
        clk            : in   std_logic;
        rst            : in   std_logic;
        command        : in   std_logic_vector(17 downto 0);
        pressure       : in   std_logic_vector(15 downto 0);  
        dutyCycle      : out  std_logic_vector(15 downto 0)     
    );
end component GRIPPER_CMP;


---------------------------------------------------------------------
-------------------- Signal Declaration -----------------------------

signal sigGripperDutyCycle: std_logic_vector(15 downto 0);
signal sigWristDutyCycle: std_logic_vector(15 downto 0);
signal sigShoulderDutyCycle: std_logic_vector(15 downto 0);
signal sigBaseDutyCycle: std_logic_vector(15 downto 0);
signal sigElbowDutyCycle: std_logic_vector(15 downto 0);
signal sigSixDofPosition:  std_logic_vector(47 downto 0);
signal sigGripperCmd: std_logic_vector(17 downto 0);
signal sigSpiCommand: std_logic_vector(55 downto 0);
signal sigSensorValsToSpi: std_logic_vector(55 downto 0);
signal sigsensorVls   : std_logic_vector(31 downto 0);
signal siggripperData : std_logic_vector(7 downto 0);
signal sigCommand : std_logic_vector(7 downto 0);



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

PWM_WRIST: SERVO_PWM
generic map(MSB => MSB)
port map(
   clk => sysClk,
   rst => rst,
   dutyCycle => sigGripperDutyCycle,
   pwmOut => pwmWrist);

	
---------------------------------------------------------------------
-------------------- SERVO_PWM INSTANCE 3 ----------------------------

PWM_SHOULDER: SERVO_PWM
generic map(MSB => MSB)
port map(
   clk => sysClk,
   rst => rst,
   dutyCycle => sigGripperDutyCycle,
   pwmOut => pwmShoulder);


---------------------------------------------------------------------
-------------------- SERVO_PWM INSTANCE 4 ----------------------------

PWM_BASE: SERVO_PWM
generic map(MSB => MSB)
port map(
   clk => sysClk,
   rst => rst,
   dutyCycle => sigGripperDutyCycle,
   pwmOut => pwmBase);


---------------------------------------------------------------------
-------------------- SERVO_PWM INSTANCE 5 ----------------------------

PWM_ELBOW: SERVO_PWM
generic map(MSB => MSB)
port map(
   clk => sysClk,
   rst => rst,
   dutyCycle => sigGripperDutyCycle,
   pwmOut => pwmElbow);

	
	
---------------------------------------------------------------------
-------------------- ARM APPLICATION INSTANCE  ----------------------	

ARM_APP : ArmAppl
port map(
       clk => sysClk,
       rst => rst,
       command => sigCommand,
       pressure => pressureData,
       sensorVls => sigsensorVls,
       sixDOFs => sigSixDofPosition,
       gripperData => siggripperData );

---------------------------------------------------------------------
-------------------- INV KINEMATICS INSTANCE  -----------------------
	
INVERSE_KIN: INV_KIN
port map(
     clk => sysClk,
     sixDOF => sigSixDofPosition,
     rst => rst,
     dutyCycle(63 downto 48) => sigBaseDutyCycle,         
     dutyCycle(47 downto 32) => sigShoulderDutyCycle,
     dutyCycle(31 downto 16) => sigWristDutyCycle,
     dutyCycle(15 downto  0) => sigElbowDutyCycle);
	  
---------------------------------------------------------------------
-------------------- SPI SLAVE INSTANCE  ----------------------------
	  
SPI_SLAVE_HANDLER_CMP: SPI_SLAVE_HANDLER 
port map(
       clk => sysClk,
       rst => rst,
       spiClk => spiClk,
       ss => ss,
       mosi => mosi,
       miso => miso,
       sensorVals => sigSensorValsToSpi,
       cmd => sigSpiCommand);
	  
---------------------------------------------------------------------
-------------------- GRIPPER INSTANCE  ------------------------------
	  
GRIPPER: GRIPPER_CMP 
port map(
       clk => sysClk,
       rst => rst,
       command => sigGripperCmd,
       pressure => pressureData,
       dutyCycle => sigGripperDutyCycle);


end architecture topHierarcy;
