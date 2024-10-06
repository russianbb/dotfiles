#!/usr/bin/bash

############################
# This script will:
# - [x] install oh-my-zsh plugins for the current vscode settings
# - [x] symlink zsh config to dotfiles
############################

ZSH_CUSTOM_PLUGINS="${HOME}/.oh-my-zsh/custom/plugins"
ZSHRC_FILE="${HOME}/.zshrc"

# Check: if `zsh-syntax-highlighting` directory exists
# Then: download `zsh-syntax-highlighting`
if [ -d "${ZSH_CUSTOM_PLUGINS}/zsh-syntax-highlighting" ]; then
	echo "[DOTFILES: ${0}] oh-my-zsh plugin zsh-syntax-highlighting found. Skipping..."
else
	echo "[DOTFILES: ${0}] Cloning oh-my-zsh plugin: zsh-syntax-highlighting"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM_PLUGINS}/zsh-syntax-highlighting
fi

# Check: if `zsh-autosuggestions` directory exists
# Then: download `zsh-autosuggestions`
if [ -d "${ZSH_CUSTOM_PLUGINS}/zsh-autosuggestions" ]; then
	echo "[DOTFILES: ${0}] oh-my-zsh plugin zsh-autosuggestions found. Skipping..."
else
	echo "[DOTFILES: ${0}] Cloning oh-my-zsh plugin: zsh-syntax-highlighting"
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM_PLUGINS}/zsh-autosuggestions
fi

#  Check: if symlink already exitst (not first time running)
# Then: do nothing
if [ -h ${ZSHRC_FILE} ]; then
	echo "[DOTFILES: ${0}] Symlink found at: ${ZSHRC_FILE}"
	echo "[DOTFILES: ${0}] Updating symlink..."

# Check: if file exists and its not a symlink (first time running this script)
# Then: create backup and create symlink
elif [ -f ${ZSHRC_FILE} ]; then
	echo "[DOTFILES: ${0}] Settings file found at: ${ZSHRC_FILE}"
	echo "[DOTFILES: ${0}] Creating backup file..."

	# Create a timestamped backup of the original file
	mv ${ZSHRC_FILE} ${ZSHRC_FILE}.backup.$(date +%s)

# Check: if not symlink nor file
# Then: do nothing
else
	echo "[DOTFILES: ${0}] No settings file or symlink found at: ${ZSHRC_FILE}"
	echo "[DOTFILES: ${0}] Creating symlink..."
fi

ln -sf "${HOME}/dotfiles/src/settings/zshrc" "${ZSHRC_FILE}"
echo "[DOTFILES: ${0}] Symlink sync finished successfully"
