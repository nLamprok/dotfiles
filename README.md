# Dotfiles  

My config files for macOS.  

**This is primararely used to backup personal dotfiles. Don't use it unless you know what you're doing.**  

Clone repo
```sh
git clone https://github.com/nLamprok/dotfiles.git
```

## Initial Steps

macOS settings
```sh
sh macos/macos
# Then log user out and back in for all changes to apply
```

Install Homebrew:
```sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install brew apps (using `Brewfile` from this repo). Just run (in this directory):
```sh
brew bundle
```

Install oh-my-zsh:
```sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## Symlinking

Symlink all the things you need:

1. `config/` folder contains configuration of most of the things (symlink contents to `~/.config`)
2. `git/` folder has some useful git configuration (symlink to `~/.gitconfig` & `~/.gitignore_global`)
3. `ssh/` has a simple config file to make sure macOS uses KeyChain for passphrases
4. `zsh/` has my `.zshrc` which you need to symlink to your home directory `~/`
5. Don't forget to also symlink your `~/.config/nvim/init.vim` to `~/.vimrc`

There's a useful (and dangerous) `symlink.sh` command which you can run to setup symlinks.

## Post-Symlinking

Install neovim plugins (uses VimPlug so just open nvim and type: `:PlugInstall`):
```sh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Install [TPM](https://github.com/tmux-plugins/tpm) for tmux:
```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# after that, just open tmux and hit Prefix + I to install plugins
```

## Fonts

To download them just visit [NerdFonts](https://www.nerdfonts.com/font-downloads):

JetBrainsMono, CaskaydiaCove, Operator Mono (can't be found on NerdFonts).
