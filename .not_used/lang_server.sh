#! /usr/bin/bash
cd ~/../Documents/python_serv/ &&
notify-send "$(ip addr)" &&
python -m http.server 8012

