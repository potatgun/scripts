#! /usr/bin/bash
cd /home/cookie/Music &&

link=$(rofi -dmenu -p "Youtube-Dl" -no-custom-location 0)
if [[ -n "$link" ]]; then
    youtube-dl --yes-playlist -x --audio-quality 1 $link
    notify-send "youtube-dl is done"
    mpc update
else
    exit
fi
