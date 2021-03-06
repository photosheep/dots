#!/bin/bash

# MIT license.
# Author : photosheep (github.com/photosheep)

# Usage : place anywhere, reference full path with event_command = /home/$USER/.config/pianobar/notify-pb.sh
# inside of the pianobar config.

pbdir="${XDG_CONFIG_HOME:-$HOME/.config}/pianobar"
tmpart="/tmp/pianobar_coverart.jpg"
tmpstations="/tmp/pianobar_stations"
tmpsonginfo="/tmp/pianobar_info"

notify () {
    if [[ -n $tmpart ]]; then
        dunstify -h string:x-dunst-stack-tag:pianobar -i $tmpart "$1" "$2"
    else
        dunstify -h string:x-dunst-stack-tag:pianobar -i /usr/share/icons/Luv/devices/16/multimedia-player.svg "$1" "$2"
    fi
}

while read L; do
    k="`echo "$L" | cut -d '=' -f 1`"
    v="`echo "$L" | cut -d '=' -f 2`"
    export "$k=$v"
done < <(grep -e '^\(title\|artist\|album\|stationName\|songStationName\|pRet\|pRetStr\|wRet\|wRetStr\|songDuration\|songPlayed\|rating\|coverArt\|stationCount\|station[0-9]\+\)=' /dev/stdin) # don't overwrite $1...

case "$1" in
    songstart)
        [[ $rating == "1" ]] && ratestr="" || ratestr=""
        if [[ -n "$coverArt" ]]; then
            wget -q -O "$tmpart" "$coverArt"
#            convert $tmpart -resize 100x100 $tmpart
        else
            [[ -n $tmpart ]] && rm $tmpart
        fi
        notify "$stationName" "\n<b>$title</b> $ratestr\nby..\n<b>$artist</b>\n<i>$album</i>"
        rm -f $tmpstations
        for stnum in $(seq 0 $(($stationCount-1))); do
             echo "$stnum) "$(eval "echo \$station$stnum") >> "$tmpstations"
        done
        echo -e "$title\n$artist\n$album" > $tmpsonginfo
        ;;

esac
