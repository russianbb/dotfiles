#!/usr/bin/bash

############################
# This script will:
# - [x] download and install google-chrome if not installed
############################

PROGRAM_NAME="google-chrome"
URL="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"


if command -v "$PROGRAM_NAME" &>/dev/null; then
	echo "[DOTFILES: ${0}] ${PROGRAM_NAME} already installed. Skipping..."
else
    echo "[DOTFILES: ${0}] $PROGRAM_NAME not found. Installing..."
    wget -O "$PROGRAM_NAME".deb "$URL"
    if [ $? -eq 0 ]; then
	echo "[DOTFILES: ${0}] Download completed from: $URL"
	sudo apt install ./"$PROGRAM_NAME".de
        rm "$PROGRAM_NAME".deb
    else 
        echo "[DOTFILES: ${0}] Download failed from: $URL"
    fi
fi
