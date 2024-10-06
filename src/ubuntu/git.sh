#!/bin/bash

# Install git


PROGRAM_NAME="git"
SSH_KEY_FILE_PATH="/home/$USERNAME/.ssh/id_ed25519"

# Checks for existing program and install if necessary
if command -v "$PROGRAM_NAME"; then
	program_path=$(command -v "$PROGRAM_NAME")
	echo "--> $PROGRAM_NAME already installed at: $program_path"

else
	echo "--> $PROGRAM_NAME not found. Installing..."   
	sudo apt update
	sudo apt install "$PROGRAM_NAME" -y
fi

# Checks for existing SSH KEY and generates one if necessary
if [ -f "$SSH_KEY_FILE_PATH" ]; then
	echo  "--> SSH KEY already exists."

else
	echo "--> SSH KEY not found. Creating new one..."
	ssh-keygen -t ed25519 -f $SSH_KEY_FILE_PATH -N ""
fi