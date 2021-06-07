#!/bin/bash

file=~/Captures/$(date '+%F_%H%M%S').png
if $(grim -t png $file);
then
    notify-send -i $file "Screenshot taken!" "File is $file"
fi
