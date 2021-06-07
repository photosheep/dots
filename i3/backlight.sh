#!/bin/bash

# Joshua Smith (github.com/photosheep)
# A useful backlight script for i3. Quick toggling of two backlight values.
# Use is './backlight.sh 100 60' to toggle between 100 and 60 brightness.

delay=500
bl=$(xbacklight -get)

# Jank rounding due to xbacklight over-accuracy.
# xbacklight sets 19 but returns 19.98, breaking the case matching.
blr=$(echo "($bl+0.5)/1" | bc)

case $blr in
    $1)
        xbacklight -time $delay -set $2
        ;;
    $2)
        xbacklight -time $delay -set $1
        ;;
    *)
        xbacklight -time $delay -set $1
        ;;
esac

