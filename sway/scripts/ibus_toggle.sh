#!/bin/bash

eng="xkb:us::eng"
yue="rime"

case "$1" in
    "print")
        ibus engine | sed 's/.*eng.*/英文/;s/rime/廣東話/;'
        ;;
    *)
        case "$(ibus engine)" in
           "$eng")
               ibus engine $yue
               ;;
           "$yue")
               ibus engine $eng
               ;;
        esac
        #polybar-msg hook ibus 1 > /dev/null
        ;;
esac
