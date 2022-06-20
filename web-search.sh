#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Info:
#   author:    Miroslav Vidovic
#   file:      web-search.sh
#   created:   24.02.2017.-08:59:54
#   revision:  ---
#   version:   1.0
# -----------------------------------------------------------------------------
# Requirements:
#   rofi
# Description:
#   Use rofi to search the web.
# Usage:
#   web-search.sh
# -----------------------------------------------------------------------------
# Script:

declare -A URLS

URLS=(
  ["duckduckgo"]="https://www.duckduckgo.com/?q="
  ["archwiki"]="https://wiki.archlinux.org/index.php?search="
  ["enwikipedia"]="https://en.wikipedia.org/w/index.php?search="
  ["jpwikipedia"]="https://jp.wikipedia.org/w/index.php?search="
  ["jlearn"]="https://www.jlearn.net/search/"
  ["stackoverflow"]="http://stackoverflow.com/search?q="
  ["github"]="https://github.com/search?q="
  ["osu"]="https://osu.ppy.sh/beatmapsets?q="
  ["youtube"]="https://www.youtube.com/results?search_query="
  ["google"]="https://www.google.com/search?q="
  ["gt spanish"]="https://translate.google.com/?au&sl=es&tl=en&op=translate&text="
)

# List for rofi
gen_list() {
    for i in "${!URLS[@]}"
    do
      echo "$i"
    done
}

main() {
  # Pass the list to rofi
  platform=$( (gen_list) | rofi -dmenu -matching fuzzy -no-custom -location 0 -p "Search " )

  if [[ -n "$platform" ]]; then
    query=$( (echo ) | rofi  -dmenu -matching fuzzy -location 0 -p "Query "  )

    if [[ -n "$query" ]]; then
      url=${URLS[$platform]}$query
      chromium "$url"
      # xdg-open "$url"
    else
      exit
    fi

  else
    exit
  fi
}

main

exit 0
