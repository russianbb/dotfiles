#!/usr/bin/bash

############################
# This script will:
# - [x] remove legacy packages if existent
# - [x] install `docker` packages via apt if not installed
#
# More details in: https://docs.docker.com/engine/install/ubuntu/
############################

remove_legacy() {
    legacy_packages=(
        docker.io
        docker-compose
        docker-compose-v2
        docker-doc
        podman-docker
        containerd
        runc
    )

    echo "[DOTFILES: ${0}] Removing legacy packages"

    for package in "${legacy_packages[@]}"; do

        if command -v "$package" &>/dev/null; then
            echo "[DOTFILES: ${0}] - ${package} installed. Removing..."
            sudo apt remove "${package}" -y
        else
            echo "[DOTFILES: ${0}] - ${package} not found. Skipping..."
        fi

    done
    echo "[DOTFILES: ${0}] Legacy packages check finished"
}

PROGRAM_NAME="docker"

# Checks for existing program and install if necessary
if command -v "$PROGRAM_NAME" &>/dev/null; then
    echo "[DOTFILES: ${0}] ${PROGRAM_NAME} already installed. Skipping..."
else
    echo "[DOTFILES: ${0}] ${PROGRAM_NAME} not found. Installing..."

    # Remove legacy packages
    remove_legacy

    echo "[DOTFILES: ${0}] Add Docker's official GPG key"
    sudo apt install ca-certificates curl -y
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    echo "[DOTFILES: ${0}] Add the repository to Apt sources"
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] \
    https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |
        sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
    sudo apt update

    echo "[DOTFILES: ${0}] Installing docker packages"
    sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

fi

echo "[DOTFILES: ${0}] docker post-install: handling docker group"
if getent group | grep "${PROGRAM_NAME}" &>/dev/null; then
    echo "[DOTFILES: ${0}] docker group found. Skipping..."
else
    echo "[DOTFILES: ${0}] - docker group not found. Creating..."
    sudo groupadd docker
    newgrp docker
fi

sudo usermod -aG docker $USER

echo "[DOTFILES: ${0}] Checking docker installation"
docker run -d hello-world

# If failed to run hello-world, stop script
if [ $? -ne 0 ]; then
    echo "[DOTFILES: ${0}] - Failed to check docker installation"
    exit 1
fi

# Stop and remove hello-world image
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)

echo "[DOTFILES: ${0}] Enabling docker services to start on boot"
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

echo "[DOTFILES: ${0}] docker packages installed"
