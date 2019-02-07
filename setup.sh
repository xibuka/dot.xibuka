#!/bin/bash

VIMRC=~/.vimrc
VIMRC_BAK=~/.vimrc.bak
VIMRC_MY=./vimrc
BASHRC=~/.bashrc
BASHRC_MY=./bashrc
ZSHRC=~/.zshrc

# need run install.sh first

# install on-my-zsh
function install_ohmyzsh {
    if [ -d ~/.zshrc ]; then
        echo "oh-my-zsh has already installed"
    else
        echo -n "Installing and configurate on_my_zsh..."
        git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
        cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
        #sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"agnoster\"/' ~/.zshrc

        echo "Done"
    fi
}

# makeup CLI
function install_solarized_dark {
    if [ ! -d ~/.dircolors ]; then
        echo -n "Setup dircolors to solarized dark ..."
        wget --no-check-certificate \
            https://raw.github.com/seebi/dircolors-solarized/master/dircolors.ansi-dark
        mv dircolors.ansi-dark ~/.dircolors
        echo "Done"
    fi
}

# install font
function install_font {
    if [ ! -d ~/fonts ]; then
        git clone https://github.com/powerline/fonts.git --depth=1 
        cd fonts
        ./install.sh 
        cd ..
        rm -rf fonts
    fi
}

# install vim-plug
function install_vim_plug {
    if [ ! -d ~/.vim/autoload/plug.vim ]; then
        echo -n "Installing VIM plugs... "
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 

        # bakup old vimrc and install new one 
        if [ -f $VIMRC ]; then 
            mv $VIMRC $VIMRC_BAK 
        fi
        ln -s $PWD/$VIMRC_MY $VIMRC
        vim +PlugInstall +qall
        echo "Done"

        # install fzf
        echo -n "Installing and configure fzf..."
        git clone --depth 1 \
            https://github.com/junegunn/fzf.git ~/.fzf 
        ~/.fzf/install --key-bindings --completion --update-rc 
        echo "Done"

        # complie YCM
        echo -n "Compiling YCM..."
        ~/.vim/plugged/YouCompleteMe/install.py 
        echo "Done"
    fi
}

# bakup old vimrc and install new one 
function install_tmux_conf {
    if [ ! -f ~/.tmux.conf ]; then
        echo -n "Add personal setting to .tmux.conf ..."
        ln -s $PWD/tmux.conf ~/.tmux.conf
        echo "Done"
    fi
}

# spacevim
function install_spacevim {
    curl -sLf https://spacevim.org/install.sh | bash
}

#install_ohmyzsh
#install_solarized_dark
#install_vim_plug
#install_tmux_conf
#install_font

#source $ZSHRC

echo DONE!!
