#!/usr/bin/env bash
#
# Symlink dotfiles into $HOME.
#
# Each link is tied to the app/command that uses it and is only created when
# that requirement is installed. Configs for apps that aren't installed stay in
# the repo; re-run this script after installing the app to link them.
#
# Safe to re-run:
#   - correct links are left alone
#   - anything else at the target is moved to ~/.dotfiles-backup/<timestamp>/
#   - stale links into this repo (requirement no longer installed) are removed
#
# Usage: ./symlink.sh [-n]   (-n = dry run, print what would happen)

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
DRY_RUN=0
[[ "${1:-}" == "-n" ]] && DRY_RUN=1

# source (relative to repo) | target | requirement
#   requirement: empty = always, "cmd:<name>" = command on PATH, "app:<Name>" = <Name>.app installed
LINKS=(
  "zsh/.zshrc|$HOME/.zshrc|"
  "git/gitconfig|$HOME/.gitconfig|"
  "git/gitignore_global|$HOME/.gitignore_global|"
  "config/nvim|$HOME/.config/nvim|cmd:nvim"
  "config/tmux|$HOME/.config/tmux|cmd:tmux"
  "config/btop|$HOME/.config/btop|cmd:btop"
  "config/starship.toml|$HOME/.config/starship.toml|cmd:starship"
  "config/lazygit/config.yml|$HOME/Library/Application Support/lazygit/config.yml|cmd:lazygit"
  "config/zellij|$HOME/.config/zellij|cmd:zellij"
  "config/ghostty|$HOME/.config/ghostty|app:Ghostty"
  "config/kitty|$HOME/.config/kitty|app:kitty"
  "config/alacritty|$HOME/.config/alacritty|app:Alacritty"
  "config/wezterm|$HOME/.config/wezterm|app:WezTerm"
  "config/zed/settings.json|$HOME/.config/zed/settings.json|app:Zed"
  "config/zed/keymap.json|$HOME/.config/zed/keymap.json|app:Zed"
)

run() {
  if ((DRY_RUN)); then echo "    (dry run) $*"; else "$@"; fi
}

has_requirement() {
  local req="$1"
  case "$req" in
    "") return 0 ;;
    cmd:*) command -v "${req#cmd:}" >/dev/null 2>&1 ;;
    app:*) [[ -d "/Applications/${req#app:}.app" || -d "$HOME/Applications/${req#app:}.app" ]] ;;
    *) echo "Unknown requirement: $req" >&2; return 1 ;;
  esac
}

for entry in "${LINKS[@]}"; do
  IFS='|' read -r src target req <<<"$entry"
  src="$DOTFILES/$src"
  current="$(readlink "$target" 2>/dev/null || true)"

  if ! has_requirement "$req"; then
    # Clean up links left behind from when the requirement was installed
    if [[ -L "$target" && "$current" == "$DOTFILES"/* ]]; then
      echo "--  $target (${req#*:} not installed, removing stale link)"
      run rm "$target"
    else
      echo "--  $target (${req#*:} not installed, skipped)"
    fi
    continue
  fi

  if [[ "$current" == "$src" ]]; then
    echo "ok  $target"
    continue
  fi

  if [[ -e "$target" || -L "$target" ]]; then
    echo "bak $target -> $BACKUP_DIR"
    run mkdir -p "$BACKUP_DIR"
    run mv "$target" "$BACKUP_DIR/"
  fi

  echo "new $target -> $src"
  run mkdir -p "$(dirname "$target")"
  run ln -sn "$src" "$target"
done
