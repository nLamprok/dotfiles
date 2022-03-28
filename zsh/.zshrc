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

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# FZF Bindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases
alias ll="ls -lha"

# Neovim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias svi="sudo nvim"
alias edit="nvim"
alias e="nvim"

# Tmux
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
alias gdb='git diff --diff-filter=d'
alias gcb='git checkout .'

# Directories
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias dots="cd ~/dotfiles"

# Misc
alias dc="docker-compose"
alias sail="vendor/bin/sail"
alias r="source ~/.zshrc"

# Parametrized Aliases
change_php() {
  brew unlink php && brew link --overwrite --force php@$1
}

export VISUAL=nvim
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"

export TERM=xterm-256color
export LC_ALL="en_US.UTF-8"

# Include sbin to $PATH
export PATH="/usr/local/sbin:$PATH"
