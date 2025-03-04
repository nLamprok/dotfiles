# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# FZF Bindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases
TREE_IGNORE="cache|log|logs|node_modules|vendor"

alias ls='eza --group-directories-first'
alias la='ls -a'
alias ll='ls --git -lha'
alias l='ll'
alias lt='ls --tree -D -L 2 -I ${TREE_IGNORE}'
alias ltt='ls --tree -D -L 3 -I ${TREE_IGNORE}'
alias lttt='ls --tree -D -L 4 -I ${TREE_IGNORE}'
alias ltttt='ls --tree -D -L 5 -I ${TREE_IGNORE}'

alias clr='clear'

# Kube
alias k='kubectl'

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
alias tns="tmux new-session -s"
alias tma="tmux a -t"
alias tsw="tmux switch -t"

# zellij
alias zj="zellij"

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

# Lazy Git
alias lg='lazygit'

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

# Include Homebrew to PATH
export PATH="/opt/homebrew/bin:$PATH"

# Include .local/bin
export PATH=~/.local/bin:$PATH

# Include sbin to $PATH
export PATH="/usr/local/sbin:$PATH"

# Include composer binaries
export PATH=~/.composer/vendor/bin:$PATH

# Include cargo packages
export PATH=/Users/nlamprok/.cargo/bin:$PATH

# Start starship
eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/Users/nlamprok/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add Completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Add Syntax Highlighting
if type brew &>/dev/null; then
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
