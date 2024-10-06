#!/usr/bin/bash

echo "[DOTFILES: ${0}] Starting the install process..."

# Define environment variables used by the next files
export DOTFILES_SRC="${HOME}/dotfiles/src"

# change to the dotfiles directory
echo "[DOTFILES: ${0}] Changing to the ${DOTFILES_SRC} directory"
cd "${DOTFILES_SRC}" || exit

files=(
    ubuntu/git.sh
    ubuntu/vscode.sh
    common/vscode-extensions.sh
    common/vscode-config.sh
    ubuntu/google-chrome.sh
    ubuntu/keepassxc.sh
    ubuntu/guake.sh
    ubuntu/zsh.sh
    common/oh-my-zsh.sh
    common/oh-my-zsh-config.sh
    ubuntu/font.sh
)

for file in "${files[@]}"; do
    echo "[DOTFILES: ${0}] Running script: ${file}"
    bash ./${file}
done
