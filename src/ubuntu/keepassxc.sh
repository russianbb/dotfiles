#!/bin/bash

# Install KeePassXC


PROGRAM_NAME="keepassxc"
URL="ppa:phoerious/keepassxc "


if command -v "$PROGRAM_NAME"; then
	program_path=$(command -v "$PROGRAM_NAME")
	echo "--> $PROGRAM_NAME already installed at: $program_path"

else
	echo "--> $PROGRAM_NAME not found. Installing..."
	sudo add-apt-repository "$URL"   
	sudo apt update
	sudo apt install "$PROGRAM_NAME" -y
fi
