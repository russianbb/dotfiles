#!/bin/bash

PROGRAM_NAME="google-chrome"
URL="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

if command -v "$PROGRAM_NAME"; then
    program_path=$(command -v "$PROGRAM_NAME")
    echo "--> $PROGRAM_NAME already installed at: $program_path"

else
    echo "--> $PROGRAM_NAME not found. Installing..."
    wget -O "$PROGRAM_NAME".deb "$URL"
    if [ $? -eq 0 ]; then
	echo "--> Download completed from: $URL"
	sudo apt install ./"$PROGRAM_NAME".de
        rm "$PROGRAM_NAME".deb
    else 
        echo "--> Download failed from: $URL"
    fi
fi
