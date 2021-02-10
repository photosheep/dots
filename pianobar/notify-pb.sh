#!/bin/bash

# MIT license.
# Author : Joshua Smith

# Usage : place anywhere, reference full path with event_command = /home/$USER/.config/pianobar/notify-pb.sh
# inside of the pianobar config.

pbdir="${XDG_CONFIG_HOME:-$HOME/.config}/pianobar"
tmpart="/tmp/pianobar_coverart.jpg"
tmpstations="/tmp/pianobar_stations"
tmpsonginfo="/tmp/pianobar_info"

notify () {
    if [[ -n $tmpart ]]; then
        notify-send -i $tmpart "pianobar | $1" "$2"
    else
        notify-send -i /usr/share/icons/Luv/devices/16/multimedia-player.svg "pianobar | $1" "$2"
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
            convert $tmpart -resize 100x100 $tmpart
        else
            [[ -n $tmpart ]] && rm $tmpart
        fi
        notify "Station : $stationName" "$title - $artist on $album $ratestr"
        rm -f $tmpstations
        for stnum in $(seq 0 $(($stationCount-1))); do
             echo "$stnum) "$(eval "echo \$station$stnum") >> "$tmpstations"
        done
        echo -e "$title\n$artist\n$album" > $tmpsonginfo
        ;;

esac
