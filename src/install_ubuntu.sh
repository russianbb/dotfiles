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
    ubuntu/font.sh
    ubuntu/dbeaver-ce.sh
    ubuntu/minikube.sh
    ubuntu/kubectl.sh
    ubuntu/zsh.sh
    common/oh-my-zsh.sh
    common/oh-my-zsh-config.sh
)

for file in "${files[@]}"; do
    echo "########################################################"
    echo "[DOTFILES: ${0}] Starting script: ${file}"
    bash ./${file}
    echo "[DOTFILES: ${0}] Finished script: ${file}"
    echo "[DOTFILES: ${0}] Press any key to continue..."
    echo "########################################################"
    read

done
