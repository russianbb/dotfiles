#!/usr/bin/bash

############################
# This script will:
# - [x] install `zsh` via apt if not installed
# - [x] define `zsh` as default terminal
############################

PROGRAM_NAME="zsh"

# Checks for existing program and install if necessary
if command -v "$PROGRAM_NAME" &>/dev/null; then
	echo "[DOTFILES: ${0}] ${PROGRAM_NAME} already installed. Skipping..."
else
	echo "[DOTFILES: ${0}] ${PROGRAM_NAME} not found. Installing..."
	sudo apt update
	sudo apt install "${PROGRAM_NAME}" -y
	chsh -s $(which zsh)
fi
