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
declare -i PWM_VALUE
SPEED_INPUT=$1

if [ $SPEED_INPUT -lt 0 ]; then
    SPEED_INPUT=0
fi

if [ $SPEED_INPUT -gt 100 ]; then
    SPEED_INPUT=100
fi

let "PWM_VAULE = (255*$SPEED_INPUT)/100"

# optionally hardcode your /sys/class/hwmon/hwmon*/pwm* path here. This is different among operating systems
# Comment out the echo "$PWM_VALUE > `find ...`" line if you use this option.
# echo $PWM_VALUE > /sys/class/hwmon/hwmon0/pwm1

# Use linux builtin "find" to dynamically detect the pwm file beneath /sys/devices/platform/pwm-fan
# Tested on armbian/ubuntu 18, you may want to opt for the hardcode option above if this isnt working.
echo $FAN_SPEED > `find /sys/devices/platform/pwm-fan -type f -name pwm*`
