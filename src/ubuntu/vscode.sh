#!/bin/bash

# Installs VSCode via APT adding Microsoft repo
# https://code.visualstudio.com/docs/setup/linux#_debian-and-ubuntu-based-distributions


PROGRAM_NAME="code"
URL="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

if command -v "$PROGRAM_NAME"; then
	program_path=$(command -v "$PROGRAM_NAME")
	echo "--> $PROGRAM_NAME already installed at: $program_path"

else
	echo "--> $PROGRAM_NAME not found. Installing..."   
	echo "code code/add-microsoft-repo boolean true" | sudo debconf-set-selections
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
	sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
	echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
	sudo apt install apt-transport-https
	sudo apt update
	sudo apt install code
fi
