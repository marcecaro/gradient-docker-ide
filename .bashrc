# Set some default aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Set some default environment variables
export PATH="/root/.local/bin:$PATH"
export EDITOR=vim
export TERM=xterm-256color
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

source /usr/share/bash-completion/completions/git

## Start pyenv
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
## End pyenv

unset VSCODE_GIT_IPC_HANDLE
unset VSCODE_GIT_ASKPASS_MAIN
unset GIT_ASKPASS
