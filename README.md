## dotfiles of Devon Blandin

## setup

    # clone dotfiles
    git clone git@github.com:dblandin/dotfiles.git ~/dotfiles && cd ~/dotfiles

    # clone oh-my-zsh
    git submodule init
    git submodule update

    # symlink magic
    ./install.sh
