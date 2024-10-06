#!/usr/bin/bash

############################
# This script will:
# - [x] download and install kubectl if not installed
############################

PROGRAM_NAME="kubectl"
STABLE_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
URL="https://dl.k8s.io/release/${STABLE_VERSION}/bin/linux/amd64/kubectl"

if command -v "$PROGRAM_NAME" &>/dev/null; then
    echo "[DOTFILES: ${0}] ${PROGRAM_NAME} already installed. Skipping..."
else
    echo "[DOTFILES: ${0}] $PROGRAM_NAME not found. Installing..."
    wget "$URL"
    if [ $? -eq 0 ]; then
        echo "[DOTFILES: ${0}] Download completed from: $URL"
        sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
        rm ${PROGRAM_NAME}
    else
        echo "[DOTFILES: ${0}] Download failed from: $URL"
    fi
fi
