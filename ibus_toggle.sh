#!/bin/bash

eng="xkb:us::eng"
yue="rime"

case "$(ibus engine)" in
	"$eng")
		ibus engine $yue
		;;
	"$yue")
		ibus engine $eng
		;;
esac

