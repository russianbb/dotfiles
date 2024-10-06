#!/usr/bin/bash

############################
# This script will:
# - [x] install `git` via apt if not installed
# - [x] create ssh key if not exists
############################

PROGRAM_NAME="git"
SSH_KEY_FILE_PATH="/home/$USERNAME/.ssh/id_ed25519"

# Checks for existing program and install if necessary
if command -v "$PROGRAM_NAME" &>/dev/null; then
	echo "[DOTFILES: ${0}] ${PROGRAM_NAME} already installed. Skipping..."
else
	echo "[DOTFILES: ${0}] ${PROGRAM_NAME} not found. Installing..."   
	sudo apt update
	sudo apt install "${PROGRAM_NAME}" -y
fi

# Checks for existing ssh key and generates one if necessary
if [ -f "$SSH_KEY_FILE_PATH" ]; then
	echo "[DOTFILES: ${0}] ssh key found at ${SSH_KEY_FILE_PATH}"
else
	echo "[DOTFILES: ${0}] ssh key not found. Creating new one at ${SSH_KEY_FILE_PATH}"
	ssh-keygen -t ed25519 -f $SSH_KEY_FILE_PATH -N ""
fi