#!/bin/bash

case $HOSTNAME in
	"Gwydion")
		;;
	"Blodeuwedd")
        light -S 40
        ogurictl output eDP-1 --image /home/josh/Backgrounds/LB2Moriya.gif --anchor center --filter nearest --scaling-mode fill
		;;
	"Hephaestus")
		;;
esac
