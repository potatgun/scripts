#! /usr/bin/bash
notify-send "$(kill $(pgrep --full "python -m http.server 8012"))"
