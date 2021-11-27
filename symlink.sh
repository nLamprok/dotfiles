DOTFILES=$(pwd)

while true; do
  read -p "Symlinking will override existing files. Are you sure? (y/N) " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo "\n--> Starting root symlinks: \n";
echo "$DOTFILES/zsh/.zshrc => $HOME/.zshrc";
ln -s -f $DOTFILES/zsh/.zshrc $HOME/.zshrc

echo "$DOTFILES/git/gitconfig => $HOME/.gitconfig";
ln -s -f $DOTFILES/git/gitconfig $HOME/.gitconfig

echo "$DOTFILES/git/gitignore_global => $HOME/.gitignore_global";
ln -s -f $DOTFILES/git/gitignore_global $HOME/.gitignore_global

echo "$DOTFILES/ssh/config => $HOME/.ssh/config";
ln -s -f $DOTFILES/ssh/config $HOME/.ssh/config

echo "$DOTFILES/tmux/.tmux.conf => $HOME/.tmux.conf";
ln -s -f $DOTFILES/tmux/.tmux.conf $HOME/.tmux.conf

echo "\n--> Starting to symlink $DOTFILES/config directories to $HOME/.config [...]\n";
echo "$DOTFILES/config/kitty => $HOME/.config/kitty";
ln -s -F $DOTFILES/config/kitty $HOME/.config

echo "$DOTFILES/config/nvim => $HOME/.config/nvim";
ln -s -F $DOTFILES/config/nvim $HOME/.config

echo "$DOTFILES/config/alacritty => $HOME/.config/alacritty";
ln -s -F $DOTFILES/config/alacritty $HOME/.config

echo "$DOTFILES/config/raycast => $HOME/.config/raycast";
ln -s -F $DOTFILES/config/raycast $HOME/.config

echo "\nDone :)"
