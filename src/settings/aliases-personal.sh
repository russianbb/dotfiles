alias use-dotfiles="cd ${HOME}/dotfiles"
alias zsh-config="code ~/.zshrc"
alias zsh-reset="source ~/.zshrc"
alias clean-docker="docker stop \$(docker ps -aq) && docker rm \$(docker ps -aq)"
alias itsmine="sudo chwn -R $USER:$USER ."

alias lsg="ls -al | grep ${1}"
