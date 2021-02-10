#!/bin/bash

cal(){
	xcalib -s $1 "$2"
}

bar(){
	polybar -qr "$1" & disown
}

xin(){
	xinput disable "$1"
}

xbl(){
	xbacklight -set $1
}

fbg(){
	feh --no-fehbg --bg-scale "$1"
}

case $HOSTNAME in
	"Gwydion")
		xin "Synaptics TM3053-003"
		xbl 40
		fbg /home/josh/Backgrounds/wallhaven-735k2e.png
		bar top
		;;
	"Blodeuwedd")
		;;
	"Hephaestus")
		;;
esac
