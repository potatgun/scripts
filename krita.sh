#!/usr/bin/env bash
convert -size 1920x1080 xc:#ffffff $HOME/Media/tmp.png &&
krita $HOME/Media/tmp.png
