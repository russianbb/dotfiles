#!/usr/bin/bash

############################
# This script will:
# - [x] download and install hack font if not installed
############################

FONT_NAME=HackNerdFont
FONTS_DIR="${HOME}/.local/share/fonts/"
URL=https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip

if fc-list | grep "${FONT_NAME}" &>/dev/null; then
    echo "[DOTFILES: ${0}] ${FONT_NAME} already installed. Skipping..."
else
    echo "[DOTFILES: ${0}] ${FONT_NAME} not found. Installing..."
    wget -O "${FONT_NAME}.zip" "$URL"
    unzip "${FONT_NAME}.zip" -d "${FONTS_DIR}"
    rm "${FONT_NAME}.zip"
fi

echo "[DOTFILES: ${0}] ${FONT_NAME} available. Finish setting the font as defaul manually"
