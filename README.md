# nLamprok's Dotfiles

![](https://i.imgur.com/pi5d9RY.png)

**This repo is primarily used as a backup to my personal dotfiles.
Don't use it unless you know what you're doing.**

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

## Symlinking

Symlink all the things you need:

1. `config/` folder contains configuration of most of the things (symlink contents to `~/.config`)
2. `git/` folder has some useful git configuration (symlink to `~/.gitconfig` & `~/.gitignore_global`)
3. `ssh/` has a simple config file to make sure macOS uses KeyChain for passphrases
4. `zsh/` has my `.zshrc` which you need to symlink to your home directory `~/`
5. Don't forget to also symlink your `~/.config/nvim/init.vim` to `~/.vimrc`

There's a useful (and dangerous) `symlink.sh` command which you can run to setup symlinks.

## Post-Symlinking

Install [TPM](https://github.com/tmux-plugins/tpm) for tmux:

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# after that, just open tmux and hit Prefix + I to install plugins
```

Open nvim (uses LazyVim under the hood, everything should be installed automatically).

## Fonts

To download fonts just visit [NerdFonts](https://www.nerdfonts.com/font-downloads):

JetBrainsMono, CaskaydiaCove, Operator Mono (can't be found on NerdFonts).

## Maintaining

Since symlinks are in-place, maintenance is just a simple commit & push to this repo. The only downside
to the current structure is the `Brewfile`. To update the currently installed brew formulaes and casks
simply run the `./updateBrew.sh` executable (assumes that you have brew in your system) and will generate
a brand new `Brewfile` which then can be commited and pushed.
