# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/nlamprok/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git zsh-syntax-highlighting ripgrep)

source $ZSH/oh-my-zsh.sh

# Agnoster Overrides
prompt_context() {
  if [[ "$USERNAME" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)%n"
  fi
}

prompt_dir() {
  prompt_segment blue $CURRENT_FG '%2~'
}

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# FZF Bindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias ll="ls -lha"

alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias svi="sudo nvim"
alias edit="nvim"
alias e="nvim"

alias sp="tmux splitw -v"
alias vs="tmux splitw -h"
alias tks="tmux kill-session -t"
alias tksa="tmux kill-session -a"
alias tls="tmux list-sessions"
alias tma="tmux a -t"
alias tsw="tmux switch -t"

# Git commands
alias gs='git status'
alias gc='git commit'
alias gp='git push origin HEAD'
alias gl='git log --oneline'
alias gb='git checkout -b'
alias ga='git add .'
alias gd='git diff'
alias gdc='git diff --staged'
alias gcb='git checkout .'
alias gw='git add . && git commit -m "wip" --no-verify && git push'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias dc="docker-compose"
alias sail="vendor/bin/sail"

export TERM=xterm-256color
export LC_ALL="en_US.UTF-8"

