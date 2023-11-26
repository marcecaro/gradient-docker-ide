# Set some default aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Set some default environment variables
export PATH="/root/.local/bin:$PATH"
export EDITOR=vim
export LANG=en_US.UTF-8
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.local/bin:$PYENV_ROOT/bin:$HOME/.poetry/bin:$PATH"

source /usr/share/bash-completion/completions/git


unset VSCODE_GIT_IPC_HANDLE
unset VSCODE_GIT_ASKPASS_MAIN
unset GIT_ASKPASS

git config --global user.name "Marcelo Caro"
git config --global user.email "marcecaro@gmail.com"

export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export COLOR_NC='\e[0m' # No Color
export COLOR_BLACK='\e[0;30m'
export COLOR_GRAY='\e[1;30m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_LIGHT_GRAY='\e[0;37m'
export COLOR_WHITE='\e[1;37m'

case $TERM in
    xterm*|rxvt*)
        local TITLEBAR='\[\033]0;\u ${NEW_PWD}\007\]'
        ;;
    *)
        local TITLEBAR=""
        ;;
    esac

local UC=$COLOR_WHITE               # user's color
[ $UID -eq "0" ] && UC=$COLOR_RED   # root's color

## Start pyenv
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
## End pyenv

PS1="$TITLEBAR\n\[${UC}\]\u \[${COLOR_LIGHT_BLUE}\]\${PWD} \[${COLOR_BLACK}\]\$(vcprompt) \n\[${COLOR_LIGHT_GREEN}\]→\[${COLOR_NC}\] "  