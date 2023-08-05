#!/usr/bin/env bash

current_wid=$(xdo id)
selection=$(rofi -i -dmenu -p "kao" $@ < $(dirname $0)/.extra/doggy.txt )
kaomoji=$(echo $selection | sed "s|$(echo -e "\ufeff").*||")
echo -n "$kaomoji" | xclip -selection clipboard
xdotool key --window $current_wid --clearmodifiers ctrl+v
