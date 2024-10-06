#!/usr/bin/bash

############################
# This script will:
# - [x] download and install Oh-My-Zsh if not installed
############################

PROGRAM_NAME="ohmyzsh"
PROGRAM_DIR=~/.oh-my-zsh
URL="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"

if [ -d ${PROGRAM_DIR} ]; then
    echo "[DOTFILES: ${0}] ${PROGRAM_NAME} already installed. Skipping..."
else
    echo "[DOTFILES: ${0}] ${PROGRAM_NAME} not found. Installing..."
    sh -c "$(wget -O- ${URL})"
fi
