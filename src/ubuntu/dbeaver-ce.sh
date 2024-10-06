#!/usr/bin/bash

############################
# This script will:
# - [x] install `dbeaver` via apt if not installed
############################

PROGRAM_NAME="dbeaver-ce"
URL="ppa:serge-rider/dbeaver-ce"

if command -v "$PROGRAM_NAME" &>/dev/null; then
    echo "[DOTFILES: ${0}] ${PROGRAM_NAME} already installed. Skipping..."
else
    echo "[DOTFILES: ${0}] $PROGRAM_NAME not found. Installing..."
    sudo add-apt-repository "$URL" -y
    sudo apt update
    sudo apt install "$PROGRAM_NAME" -y
fi
