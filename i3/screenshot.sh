#!/bin/bash

if [ -z ${1} ]; then flags='u'; else flags=$1;fi
file=~/Captures/$(date '+%F_%H%M%S').jpg
if $(maim -$flags $file);
then
    notify-send -i $file "Screenshot taken!" "File is $file"
fi
