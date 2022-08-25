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
  ["jlearn"]="https://www.jlearn.net/search/"
  ["github"]="https://github.com/search?q="
  ["osu"]="https://osu.ppy.sh/beatmapsets?q="
  ["youtube"]="https://www.youtube.com/results?search_query="
  ["reverso"]="https://context.reverso.net/translation/english-japanese/"
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
      qutebrowser "$url"
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
