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

echo "$DOTFILES/tmux/.tmux.conf => $HOME/.tmux.conf";
ln -s -f $DOTFILES/tmux/.tmux.conf $HOME/.tmux.conf

echo "$DOTFILES/config/nvim => $HOME/.config/nvim";
ln -s -F $DOTFILES/config/nvim $HOME/.config

echo "\nDone :)"
