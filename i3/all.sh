#!/bin/bash

# Made by Joshua Smith: jsmithfpv@disroot.org

# This autoexec is paired with a regular i3 env.
# Included would be system-agnostic configs, e.g.
# starting fcitx, dunst, picom, lxpolkit and setting xss-lock
# The config should also run the script "host.sh"
# that runs individual commands by checking $HOSTNAME.

locker=xsecurelock

function run {
	if ! pgrep -f $1 > /dev/null;
	then
		$@ & disown
	fi
}

numlockx on
xss-lock $locker & disown
run lxpolkit
run dunst
run picom -b
run pcmanfm -d
run ibus-daemon -drx
run greenclip daemon
