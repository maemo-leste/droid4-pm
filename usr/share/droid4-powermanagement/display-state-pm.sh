#!/bin/bash

if [ $5 == "on" ]
then
        echo 20000 >  /sys/bus/i2c/drivers/atmel_mxt_ts/1-004a/power/autosuspend_delay_ms
        printf 'U1234AT+SCRN=1\r' > /dev/gsmtty1
else
        echo 100 > /sys/bus/i2c/drivers/atmel_mxt_ts/1-004a/power/autosuspend_delay_ms
        printf 'U1234AT+SCRN=0\r' > /dev/gsmtty1
        # hack to workaround idle bug
        head -c 0 /dev/ttyUSB{3,4}
fi
