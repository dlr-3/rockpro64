# this script controls the system fan on a rockpro64 board.
# accepts integer input, scaling fan speed from 0-100 percent.
# integers below 0 are forced to zero (fan stop) 
# integers above 100 are forced to 100 (max speed)
# written by David Ross
#
# USAGE (requires sudo):    $ sudo ./fanspeed.sh 100
#
#!/bin/bash

declare -i SPEED_INPUT
declare -i FAN_SPEED
SPEED_INPUT=$1

if [ $SPEED_INPUT -lt 0 ]; then
    SPEED_INPUT=0
fi

if [ $SPEED_INPUT -gt 100 ]; then
    SPEED_INPUT=100
fi

let "FAN_SPEED = (255*$SPEED_INPUT)/100"
sudo echo $FAN_SPEED > /sys/class/hwmon/hwmon0/pwm1
