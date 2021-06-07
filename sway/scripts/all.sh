#!/bin/bash

# Made by photosheep (github.com/photosheep)

# This autoexec is paired with a regular i3 env.
# Included would be system-agnostic configs, e.g.
# starting fcitx, dunst, picom, lxpolkit and setting xss-lock
# The config should also run the script "host.sh"
# that runs individual commands by checking $HOSTNAME.

function kill_then_run {
	if ! pgrep -f $1 > /dev/null;
	then
        for x in $(pgrep -f $1)
        do
            kill $x
        done

		$@ & disown
	fi
}

function run {
	if ! pgrep -f $1 > /dev/null;
	then
		$@ & disown
	fi
}

#xss-lock $locker & disown
#run ibus-daemon -drx
run lxpolkit
run dunst
run pcmanfm -d
kill_then_run oguri
run foot --server
