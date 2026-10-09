# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# FZF Bindings (Ctrl-R history, Ctrl-T files, Alt-C cd)
command -v fzf >/dev/null && source <(fzf --zsh)

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

# Claude Code
alias cc="claude"

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
alias dc="docker compose"
alias sail="vendor/bin/sail"
alias r="source ~/.zshrc"

# btop persists a fully-resolved absolute color_theme path on exit, which breaks
# the shared dotfiles config across machines/OSes. Reset it to the portable
# name-only form before each launch so it always resolves via btop's own
# $HOME/.config/btop/themes search path.
btop() {
  sed -i.bak -E 's|^color_theme = ".*"|color_theme = "tokyo-night"|' ~/.config/btop/btop.conf 2>/dev/null
  rm -f ~/.config/btop/btop.conf.bak
  command btop "$@"
}

export VISUAL="$EDITOR"
export GIT_EDITOR="$EDITOR"

export TERM=xterm-256color
export LC_ALL="en_US.UTF-8"

# Homebrew itself is set up in ~/.zprofile (brew shellenv).
# Prepend user bin dirs; (N) skips the ones that don't exist.
typeset -U path
path=(
  ~/.local/bin(N)
  ~/.cargo/bin(N)
  ~/.composer/vendor/bin(N)
  $HOMEBREW_PREFIX/opt/openjdk@17/bin(N)
  $path
)

# Start starship
eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Completions (brew shellenv already adds Homebrew's site-functions to fpath)
autoload -Uz compinit
compinit

# Syntax highlighting (must be sourced last)
[ -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] &&
  source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
