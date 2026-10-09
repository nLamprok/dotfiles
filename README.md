# nLamprok's Dotfiles

![](https://i.imgur.com/pi5d9RY.png)

**This repo is primarily used as a backup to my personal dotfiles.
Don't use it unless you know what you're doing.**

## Setup

Clone into `~/dotfiles` (the `dots` alias in `.zshrc` expects it there):

```sh
git clone https://github.com/nLamprok/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Install [Homebrew](https://brew.sh):

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install everything in the `Brewfile` (CLI tools, apps, fonts, and App Store apps via `mas`; sign in to the App Store first):

```sh
brew bundle
```

Symlink the configs into place:

```sh
./symlink.sh -n   # dry run: show what would change
./symlink.sh
```

Apply macOS preferences, then log out and back in:

```sh
./macos/macos
```

### Post-setup

Install [TPM](https://github.com/tmux-plugins/tpm) for tmux, then open tmux and press `Prefix + I` to install the plugins:

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Open `nvim`. It uses [LazyVim](https://www.lazyvim.org), so plugins install automatically.

If `compinit` warns about insecure directories when you open a shell, run `chmod go-w "$(brew --prefix)/share"`.

## What's in here

| Path                  | What                                                                  |
| --------------------- | --------------------------------------------------------------------- |
| `Brewfile`            | Formulae, casks, fonts and App Store apps (curated by hand)           |
| `symlink.sh`          | Links configs into `$HOME`, only for apps that are installed           |
| `brew-check.sh`       | Reports drift between this Mac and the `Brewfile`                     |
| `macos/macos`         | macOS `defaults` (keyboard, trackpad, Dock, Finder, shortcuts)        |
| `zsh/.zshrc`          | Shell config, aliases, PATH                                           |
| `git/`                | `~/.gitconfig` (with [delta](https://github.com/dandavison/delta)) and `~/.gitignore_global` |
| `config/nvim`         | Neovim (LazyVim)                                                      |
| `config/tmux`         | tmux (prefix `C-a`)                                                   |
| `config/ghostty`      | Ghostty terminal                                                      |
| `config/starship.toml`| Starship prompt                                                       |
| `config/lazygit`      | lazygit, linked to `~/Library/Application Support/lazygit`            |
| `config/btop`         | btop + Tokyo Night theme                                              |

Configs for apps I don't currently use are kept around in case I come back to them:
`config/kitty`, `config/zed`, `config/alacritty`, `config/wezterm` and `config/zellij`.
`symlink.sh` links them automatically once the app is installed.

These need a manual import instead of a symlink:

- `iterm/`: iTerm2 profile and color schemes (Settings → Profiles → Import)
- `config/rectangle/RectangleConfig.json`: Rectangle (Settings → Import)

## Fonts

[CaskaydiaCove Nerd Font](https://www.nerdfonts.com/font-downloads) is installed from the `Brewfile` and used by Ghostty.

## Maintaining

Symlinks are in place, so editing a config is just a commit & push.

The `Brewfile` is curated by hand. Check for drift with:

```sh
./brew-check.sh
```

Then add or remove lines manually. Things to avoid:

- `brew bundle dump -f` regenerates the file and wipes manual curation.
- `brew bundle cleanup --force` uninstalls everything not in the `Brewfile`, including work apps (Teams, Outlook, Windows App) that are left out on purpose.

After installing or removing an app that has a config here, re-run `./symlink.sh`. It's safe to run any number of times: correct links are left alone, anything else at the target gets backed up to `~/.dotfiles-backup/<timestamp>/`, and stale links for uninstalled apps are removed.
