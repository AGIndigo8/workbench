#!/bin/bash

reckon_dest_dir() {
    if [ -z "$1" ]; then
        # check for the existence of a ".stash" file
        if [ -f ".stash" ]; then
            # use the directory saved in the ".stash" file as the new directory name
            dst_dir="./.drawers/$(cat .stash)"
        else
            echo "Error: No destination directory specified"
            exit 1
        fi
    elif [ -d "$1" ]; then
        echo "Error: destination directory already exist"
        exit 1
    else
        dst_dir="./.drawers/$1"
    fi
}

update_stash_file() {
    # check for the existence of a ".stash" file
    if [ ! -f ".stash" ]; then
        touch ".stash"
    fi
    # update the contents of the ".stash" file with the name of the new directory
    echo "$(basename "$dst_dir")" > ".stash"
}

stash(){
    reckon_dest_dir "$1"
    update_stash_file
    mkdir -p "$dst_dir"
    mv ".stash" "$dst_dir"
    find "$PWD" -mindepth 1 -maxdepth 1 ! -name '.*' -exec mv -t "$dst_dir" {} +
}

swap(){
    if [ -z "$1" ]; then
        echo "Error: Please provide the destination directory name"
        exit 1
    fi
    if [ ! -d "./.drawers/$1" ]; then
        echo "Error: $1 is not a valid directory in ./.drawers/"
        exit 1
    fi
    files_to_move=$(find "$PWD" -mindepth 1 -maxdepth 1 ! -name '.*' ! -name ".stash" | wc -l)
    if [ "$files_to_move" -gt 0 ]; then
        stash
    fi
    source_dir="./.drawers/$1"
    find "$source_dir" -mindepth 1 -maxdepth 1 -exec mv -t "$PWD" {} +
    rmdir "$source_dir"
}

if [ "$1" = "stash" ]; then
    stash "$2"
elif [ "$1" = "swap" ]; then
    swap $2
else
    echo "Usage: script.sh stash [dirname] or script.sh swap"
    exit 1
fi
