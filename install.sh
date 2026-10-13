#!/bin/zsh
#
# Set up a Mac from this repo. Safe to re-run: every step skips what's done.
#
# Usage: ./install.sh [--macos]   (--macos also applies macos/macos defaults)

set -euo pipefail

DOTFILES="${0:A:h}"
cd "$DOTFILES"

step() { print -P "\n%F{blue}==>%f %B$1%b" }
warn() { print -P "%F{yellow}warning:%f $1" }

# 1. Command Line Tools (git, clang). The installer is a GUI dialog, so stop
#    and let it finish before continuing.
step "Command Line Tools"
if ! xcode-select -p &>/dev/null; then
  xcode-select --install
  echo "Finish the Command Line Tools install, then re-run ./install.sh"
  exit 1
fi
echo "installed"

# 2. Homebrew
step "Homebrew"
if [[ ! -x /opt/homebrew/bin/brew ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
# Same environment new shells get: brew shellenv + SDKROOT fix
source "$DOTFILES/zsh/.zprofile"
echo "$(brew --version | head -1)"

# 3. Packages. mas apps need an App Store sign-in; don't abort on those.
step "Brewfile"
brew bundle --no-upgrade --file="$DOTFILES/Brewfile" || warn "some Brewfile entries failed (App Store sign-in?), re-run later"

# 4. Symlinks
step "Symlinks"
"$DOTFILES/symlink.sh"

# 5. Neovim plugins, pinned to lazy-lock.json. Treesitter parsers and Mason
#    tools install on first launch.
step "Neovim plugins"
if nvim --headless "+Lazy! restore" +qa &>/dev/null; then
  echo "done"
else
  warn "plugin restore failed, open nvim and run :Lazy restore"
fi

# 6. tmux plugins: tmux.conf bootstraps TPM on first launch, nothing to do.

# 7. macOS defaults (opt-in: restarts Dock and Finder)
if [[ "${1:-}" == "--macos" ]]; then
  step "macOS defaults"
  "$DOTFILES/macos/macos"
fi

step "All set"
echo "Open a new terminal window to load the shell config."
[[ "${1:-}" == "--macos" ]] || echo "Run ./install.sh --macos to also apply macOS defaults."
