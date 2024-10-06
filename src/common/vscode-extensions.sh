#!/usr/bin/bash

############################
# This script will:
# - [x] install vscode extensions
# - [x] create a backup for the current vscode settings
# - copy common vscode settings in place
############################

extensions=(
	dracula-theme.theme-dracula
	eamodio.gitlens
	ms-python.debugpy
	ms-python.python
	ms-python.vscode-pylance
	mhutchie.git-graph
	ms-azuretools.vscode-docker
	ms-vscode-remote.remote-containers
	ms-python.isort
	oderwat.indent-rainbow
	pkief.material-icon-theme
	redhat.vscode-yaml
	tamasfe.even-better-toml
	pkief.material-icon-theme
	esbenp.prettier-vscode
	foxundermoon.shell-format
)

installed_extensions=$(code --list-extensions)

for extension in "${extensions[@]}"; do
    if echo "$installed_extensions" | grep -qi "^$extension$"; then
        echo "[DOTFILES: ${0}] $extension is already installed. Skipping..."
    else
        echo "[DOTFILES: ${0}] $extension not found. Installing..."
        code --install-extension "$extension"
    fi
done

echo "[DOTFILES: ${0}] VSCode extensions have been installed."

VSCODE_USER_SETTINGS_DIR="${HOME}/.config/Code/User"

echo ${VSCODE_USER_SETTINGS_DIR}