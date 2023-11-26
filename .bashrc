# Set some default aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Set some default environment variables
export PATH="/root/.local/bin:$PATH"
export EDITOR=vim

function __git_ps1 () {
    local branch_name="$(git symbolic-ref --short HEAD 2>/dev/null)"
    if [ -n "$branch_name" ]; then
        printf " (%s)" "$branch_name"
    fi
}

source /usr/share/bash-completion/completions/git

# Set the prompt to show the current directory and Git branch
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (\[\033[01;31m\]%s\[\033[00m\])")$ '
## Start pyenv
export PATH="/root/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
## End pyenv

unset VSCODE_GIT_IPC_HANDLE
unset VSCODE_GIT_ASKPASS_MAIN
unset GIT_ASKPASS
unset AWS_PROFILE

if git rev-parse --git-dir >/dev/null 2>&1; then
    if ! git config --get --local user.name > /dev/null 2>&1; then
        echo "What is your proofpoint username? (e.g. jsmith)"
        read CUSER
        echo "Setting ${CUSER} as git user.name"
        git config --set --local user.name $CUSER  > /dev/null 2>&1
        echo "Setting ${CUSER}@proofpoint.com as git user.email"
        git config --set --local user.email $CUSER@google.com  >/dev/null 2>&1
    fi
fi