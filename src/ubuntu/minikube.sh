#!/usr/bin/bash

############################
# This script will:
# - [x] download and install minikube if not installed
############################

PROGRAM_NAME="minikube"
URL="https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64"

if command -v "$PROGRAM_NAME" &>/dev/null; then
    echo "[DOTFILES: ${0}] ${PROGRAM_NAME} already installed. Skipping..."
else
    echo "[DOTFILES: ${0}] $PROGRAM_NAME not found. Installing..."
    wget "$URL"
    if [ $? -eq 0 ]; then
        echo "[DOTFILES: ${0}] Download completed from: $URL"
        sudo install minikube-linux-amd64 /usr/local/bin/minikube
        rm minikube-linux-amd64
    else
        echo "[DOTFILES: ${0}] Download failed from: $URL"
    fi
fi
