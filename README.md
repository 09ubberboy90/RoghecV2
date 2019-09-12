# RoghecV2
A remake of a previous robot called Roghec made during my internship in Polytech

May need to have a recompiled version of snowboy found at for the rasperry code: https://github.com/Makerspot/snowboy

List of commands : 

- M or m : manual mode

- A or a : auto mode

- D or d for motor control (DXZZ with X a letter and ZZ a number from 00 to 99):
    - F or f for forward
    - B or b for backward
    - L or l for left
    - R or r for right

- R or r : Servo control (RXXZZZ with XX the number of the servo and ZZZ the angle from 0 to 180)

- S or s : Servo related control :
    - E or e enable the servos
    - D or d disable the servos
    - S or s disable return message (needed when controlling the servo at high speed otherwise progam crash)
    - V or v enable return message

- G or g : Print the data read from the accelerometer/gysroscope

