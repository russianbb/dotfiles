#!/usr/bin/bash

############################
# This script will:
# - [x] install `keepassxc` via apt if not installed
############################

PROGRAM_NAME="keepassxc"
URL="ppa:phoerious/keepassxc"

if command -v "$PROGRAM_NAME" &>/dev/null; then
	echo "[DOTFILES: ${0}] ${PROGRAM_NAME} already installed. Skipping..."
else
	echo "[DOTFILES: ${0}] $PROGRAM_NAME not found. Installing..."
	sudo add-apt-repository "$URL" -y
	sudo apt update
	sudo apt install "$PROGRAM_NAME" -y
fi
