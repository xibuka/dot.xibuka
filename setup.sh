#!/bin/bash

VIMRC=~/.vimrc
VIMRC_BAK=~/.vimrc.bak
VIMRC_MY=./vimrc
BASHRC=~/.bashrc
BASHRC_MY=./bashrc

# Install neccessary packages and useful tools
function install_rpms {
    PACKAGE_LIST="gcc git ncurses-devel cmake gcc-c++ python3-devel tmux lnav"
    echo -n "Installing necesarry packages " $PACKAGE_LIST " ..."
    sudo yum -y install $PACKAGE_LIST               &> /dev/null
    echo "Done"
}

# Install xsos
function install_xsos {
    if [ -f /usr/local/bin/xsos  ]; then
        echo "bash-it has already installed"
    else
        echo -n "Installing xsos..."
        curl -Lo /usr/local/bin/xsos bit.ly/xsos-direct &> /dev/null
        chmod +x /usr/local/bin/xsos                    &> /dev/null
        echo "Done"
    fi
}

# if you need to install vim 8 or newer
function install_vim8_manual {

    git clone https://github.com/vim/vim.git
    cd $PWD/vim/src/
    ./configure --with-features=huge                                     \
                --enable-multibyte                                       \
                --enable-rubyinterp=yes                                  \
                --enable-pythoninterp=yes                                \
                --with-python-config-dir=/usr/lib64/python2.7/config     \
                --enable-perlinterp=yes                                  \
                --enable-luainterp=yes                                   \
                --prefix=/usr/local/ \
                --enable-fail-if-missing \
                --enable-gui=no \
                --enable-tclinterp=yes \
                --enable-cscope=yes \
                --enable-gpm \
                --enable-cscope \
                --enable-fontset \
                --with-x \
                --with-compiledby=koturn
    make -j5
    sudo make install
    cd ../../
    rm -rf ./vim
}

# install bash-it
function install_bash_it {
    if [ -d ~/.bash_it ]; then
        echo "bash-it has already installed"
    else
        echo -n "Installing and configurate bash-it..."
        git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it &> /dev/null
        ~/.bash_it/install.sh  <<EOF &> /dev/null
    
EOF
        cat $PWD/$BASHRC_MY >> $BASHRC
        echo "Done"
    fi
}

# makeup CLI
function install_solarized_dark {
    if [ ! -d ~/.dircolors ]; then
        echo -n "Setup dircolors to solarized dark ..."
        wget --no-check-certificate \
            https://raw.github.com/seebi/dircolors-solarized/master/dircolors.ansi-dark &> /dev/null
        mv dircolors.ansi-dark ~/.dircolors
        echo "Done"
    fi
}

## # install nerd-font
## git clone https://github.com/ryanoasis/nerd-fonts.git ~/.nerd-fonts
## cd ~/.nerd-fonts/
## ./install.sh 
## cd -

# # install redhat themes
# git clone https://github.com/dnoiz1/bash-it.git /tmp/bash_it_dnoizl
# cp -r  /tmp/bash_it_dnoizl/themes/redline   ~/.bash_it/custom/themes/
# cp -r  /tmp/bash_it_dnoizl/themes/powerline ~/.bash_it/custom/themes/
# rm -rf /tmp/bash_it_dnoizl

# install vim-plug
function install_vim_plug {
    if [ ! -d ~/.vim/autoload/plug.vim ]; then
        echo -n "Installing VIM plugs... "
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
          &> /dev/null

        # bakup old vimrc and install new one 
        if [ -f $VIMRC ]; then 
            mv $VIMRC $VIMRC_BAK 
        fi
        ln -s $PWD/$VIMRC_MY $VIMRC
        vim +PlugInstall +qall
        echo "Done"

        # install fzf
        echo -n "Installing and configure fzf..."
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install <<EOF &> /dev/null
        
        
EOF
        echo "Done"

        # complie YCM
        echo -n "Compiling YCM..."
        ~/.vim/plugged/YouCompleteMe/install.py &> /dev/null
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


install_rpms
install_xsos
install_bash_it
install_solarized_dark
install_vim_plug
install_tmux_conf

source $BASHRC

echo DONE!!
