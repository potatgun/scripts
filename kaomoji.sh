#!/usr/bin/env bash

current_wid=$(xdo id)
selection=$(rofi -i -dmenu -p "Kao" $@ < $(dirname $0)/.extra/kaomoji.txt )
kaomoji=$(echo $selection | sed "s|$(echo -e "\ufeff").*||")
echo -n "$kaomoji" | xclip -selection clipboard
xdotool key --window $current_wid --clearmodifiers ctrl+v
