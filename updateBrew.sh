while true; do
  read -p "This is going to override existing Brewfile. Are you sure? (y/N) " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

brew bundle dump -f
