#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='eza -1 --icons --sort=type'
alias vi='nvim'
alias vim='nvim'
alias grep='rg'
alias cat='bat -p'
alias dev='cd ~/Development; nvim .'


# This is my custom prompt
get_git_branch() {
    local branch
    if git rev-parse --git-dir > /dev/null 2>&1; then
        branch=$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --always 2>/dev/null)
        if [ -n "$branch" ]; then
            echo " on git:$branch"
        fi
    fi
}

# Color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RESET='\033[0m'

# Set the custom prompt
PS1="\[\033[0;32m\]\u\[\033[0m\] on \[\033[0;32m\]\h\[\033[0m\] at \[\033[0;34m\]\w\[\033[0m\]\$(get_git_branch)\n\\$ "

source /usr/share/nvm/init-nvm.sh
