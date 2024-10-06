#!/usr/bin/bash

############################
# This script will:
# - [x] create a backup for the current vscode settings
# - [x] symlink VSCode settings to dotfiles
############################

VSCODE_USER_SETTINGS_DIR="${HOME}/.config/Code/User"
VSCODE_USER_SETTINGS_FILE="${VSCODE_USER_SETTINGS_DIR}/settings.json"

# Check if VSCode settings directory exists
if [ -d "$VSCODE_USER_SETTINGS_DIR" ]; then

    # Check: if symlink already exitst (not first time running)
    # Then: do nothing
    if [ -h ${VSCODE_USER_SETTINGS_FILE} ]; then
        echo "[DOTFILES: ${0}] Symlink found at: ${VSCODE_USER_SETTINGS_FILE}"
        echo "[DOTFILES: ${0}] Updating symlink..."

    # Check: if file exists and its not a symlink (first time running this script)
    # Then: create backup and create symlink
    elif [ -f ${VSCODE_USER_SETTINGS_FILE} ]; then
        echo "[DOTFILES: ${0}] Settings file found at: ${VSCODE_USER_SETTINGS_FILE}"
        echo "[DOTFILES: ${0}] Creating backup file..."

        # Create a timestamped backup of the original file
        mv ${VSCODE_USER_SETTINGS_FILE} ${VSCODE_USER_SETTINGS_FILE}.backup.$(date +%s)

    # Check: if not symlink nor file
    # Then: do nothing
    else
        echo "[DOTFILES: ${0}] No settings file or symlink found at: ${VSCODE_USER_SETTINGS_FILE}"
        echo "[DOTFILES: ${0}] Creating symlink..."
    fi

    ln -sf "${HOME}/dotfiles/src/settings/vscode-user-settings.json" "${VSCODE_USER_SETTINGS_FILE}"
    echo "[DOTFILES: ${0}] Symlink sync finished successfully"

else
    echo "[DOTFILES: ${0}] VSCode user settings directory does not exist. Please ensure VS Code is installed."
fi
