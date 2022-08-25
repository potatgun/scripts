#! /usr/bin/sh

actions=(
    "pause"
    "play"
    "ncpp"
    "volume"
)
gen_list() {
    for i in "${actions[@]}"
    do
        echo "$i"
    done
}

main() {
    todo=$( (gen_list) | rofi -dmenu -matching fuzzy  -p "mpc Action " )

    if [[ -n "$todo" ]]; then
        if [ "$todo" == "ncpp" ]
        then
            alacritty -e ncmpcpp
            exit
        fi

        if [ "$todo" == "volume" ]
        then
            volume=$(rofi -dmenu)
            if [[ -n "$volume" ]]
            then
                mpc volume $volume
            fi
            exit
        fi

        mpc "$todo"
    fi
    exit
}

main
