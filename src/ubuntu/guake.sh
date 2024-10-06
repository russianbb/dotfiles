#!/usr/bin/bash

############################
# This script will:
# - [x] install `guake` via apt if not installed
############################

PROGRAM_NAME="guake"
URL="ppa:linuxuprising/guake"

if command -v "$PROGRAM_NAME" &>/dev/null; then
	echo "[DOTFILES: ${0}] ${PROGRAM_NAME} already installed. Skipping..."
else
	echo "[DOTFILES: ${0}] $PROGRAM_NAME not found. Installing..."
	sudo add-apt-repository "$URL"
	sudo apt update
	sudo apt install "$PROGRAM_NAME" -y
fi
