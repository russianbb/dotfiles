echo "Starting the install process..."

sudo apt update
sudo apt upgrade -y

sh git.sh
sh vscode.sh
sh google-chrome.sh
sh keepassxc.sh
