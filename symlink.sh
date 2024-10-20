DOTFILES=$(pwd)

while true; do
  read -p "Symlinking will override existing files. Are you sure? (y/N) " yn
  case $yn in
  [Yy]*) break ;;
  [Nn]*) exit ;;
  *) echo "Please answer yes or no." ;;
  esac
done

echo "\n--> Starting root symlinks: \n"

echo "$DOTFILES/zsh/.zshrc => $HOME/.zshrc"
ln -s -f $DOTFILES/zsh/.zshrc $HOME/.zshrc

echo "$DOTFILES/git/gitconfig => $HOME/.gitconfig"
ln -s -f $DOTFILES/git/gitconfig $HOME/.gitconfig

echo "$DOTFILES/git/gitignore_global => $HOME/.gitignore_global"
ln -s -f $DOTFILES/git/gitignore_global $HOME/.gitignore_global

echo "$DOTFILES/config/tmux => $HOME/.config/tmux"
ln -s -F $DOTFILES/config/tmux $HOME/.config

echo "$DOTFILES/config/nvim => $HOME/.config/nvim"
ln -s -F $DOTFILES/config/nvim $HOME/.config

echo "$DOTFILES/config/kitty => $HOME/.config/kitty"
ln -s -F $DOTFILES/config/kitty $HOME/.config

echo "$DOTFILES/config/zed/keymap.json => $HOME/.config/zed/keymap.json"
ln -s -F $DOTFILES/config/zed/keymap.json $HOME/.config/zed/keymap.json

echo "$DOTFILES/config/zed/settings.json => $HOME/.config/zed/settings.json"
ln -s -F $DOTFILES/config/zed/settings.json $HOME/.config/zed/settings.json

echo "\nDone :)"
