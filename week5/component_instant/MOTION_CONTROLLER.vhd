-------------------------------------------------------------------------
-- Component         : MOTION_CONTROLLER
-- Short Description : structural motion controller
-- Remarks           : RTS4
-- Author            : VERM93, Fontys FHENG
-------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.Numeric_std.all;

ENTITY MOTION_CONTROLLER IS
    PORT 
    (
    CLK:           IN  STD_LOGIC;                     -- 50MHz 
    RST:           IN  STD_LOGIC;                     -- reset (active high) 
    SEL:           IN  STD_LOGIC_VECTOR(1 downto 0);  -- control the MUX for PID update processing speed
    KP:            IN  STD_LOGIC_VECTOR(15 downto 0); -- PID KP factor (signed)
    KI:            IN  STD_LOGIC_VECTOR(15 downto 0); -- PID KI factor (signed)
    KD:            IN  STD_LOGIC_VECTOR(15 downto 0); -- PID KD factor (signed)
    LD:            IN  STD_LOGIC;                     -- LD will load new values of KP, KI, KD in the PID loop
    PWMsig:        OUT STD_LOGIC;                     -- PWM driver signal
    PWMdir:        OUT STD_LOGIC;                     -- PWM direction
    encoder_A:     IN  STD_LOGIC;                     -- encoderA signal from incremental position encoder
    encoder_B:     IN  STD_LOGIC;                     -- encoderB signal from incremental position encoder
    setpoint:      IN  STD_LOGIC_VECTOR(9 downto 0);  -- setpoint in mm
    scalingFactor: IN  STD_LOGIC_VECTOR(2 downto 0);  -- scale factor
    ERROR:         OUT STD_LOGIC;                     -- ERROR OUT when motion controller is in bad state
    mon_position:  OUT STD_LOGIC_VECTOR(15 downto 0); -- monitor position (encoder units)
    mon_setpoint:  OUT STD_LOGIC_VECTOR(15 downto 0); -- monitor setpoint (encoder units)
    mon_power:     OUT STD_LOGIC_VECTOR(15 downto 0)  -- monitor power range -20000..+20000
    );
END ENTITY MOTION_CONTROLLER;

ARCHITECTURE STRUCTURAL of MOTION_CONTROLLER is

------------------------------
-- component declarations
------------------------------



-------------------------------
-- signal declarations 
-------------------------------

signal PWM_ERR         : Std_logic;
signal SP_ERR          : Std_logic;
signal ENCODER_ERR     : Std_logic;
signal ERR_LED_OUT     : Std_logic;
signal CLK_OUT_DIV_01  : STD_LOGIC;
signal CLK_OUT_DIV_02  : STD_LOGIC;
signal CLK_OUT_DIV_03  : STD_LOGIC;
signal CLK_OUT_DIV_04  : STD_LOGIC; 
signal trigger         : STD_LOGIC;
signal position        : STD_LOGIC_VECTOR(15 downto 0);
signal setpoint_encoder_units  : STD_LOGIC_VECTOR(15 downto 0);
signal position_encoder_units  : STD_LOGIC_VECTOR(15 downto 0);
signal power                   : STD_LOGIC_VECTOR(15 downto 0);

signal power_safe                   : STD_LOGIC_VECTOR(15 downto 0);
signal position_encoder_units_safe  : STD_LOGIC_VECTOR(15 downto 0);
signal kp_safe                      : STD_LOGIC_VECTOR(15 downto 0);
signal ki_safe                      : STD_LOGIC_VECTOR(15 downto 0);
signal kd_safe                      : STD_LOGIC_VECTOR(15 downto 0);

BEGIN

ERROR <= ERR_LED_OUT;


mon_position <= position_encoder_units;
mon_setpoint <= setpoint_encoder_units;
mon_power    <= power;

power_safe    <= to_StdLogicVector(To_BitVector(power));
position_encoder_units_safe <= to_StdLogicVector(To_BitVector(position_encoder_units));
kp_safe       <= to_StdLogicVector(To_BitVector(KP));
ki_safe       <= to_StdLogicVector(To_BitVector(KI));
kd_safe       <= to_StdLogicVector(To_BitVector(KD));




END ARCHITECTURE STRUCTURAL;
