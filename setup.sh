
VIMRC=~/.vimrc
VIMRC_BAK=~/.vimrc.bak
VIMRC_MY=./vimrc
BASHRC=~/.bashrc
BASHRC_BAK=~/.bashrc.bak
BASHRC_MY=./bashrc

# Install neccessary packages and useful tools
sudo yum -y install gcc git ncurses-devel cmake gcc-c++ python3-devel
sudo yum -y install tmux lnav

# Install xsos
curl -Lo /usr/local/bin/xsos bit.ly/xsos-direct
chmod +x /usr/local/bin/xsos

## uncomment if you need to install vim 8 or newer
## #echo -n "do you need to install vim 8?[y/N]"
## #read install_vim=${install_vim:-N}
## #if [ install_vim != "N" ] || [ install_vim != "n" ];then
## vim_version=$(vim --version | grep "^VIM" | awk {'print $5'})
## if [ ${vim_version%%.*} -lt 8 ] ; then
##     git clone https://github.com/vim/vim.git
##     cd $PWD/vim/src/
##     ./configure --with-features=huge                                     \
##                 --enable-multibyte                                       \
##                 --enable-rubyinterp=yes                                  \
##                 --enable-pythoninterp=yes                                \
##                 --with-python-config-dir=/usr/lib64/python2.7/config     \
##                 --enable-perlinterp=yes                                  \
##                 --enable-luainterp=yes                                   \
##                 --prefix=/usr/local/ \
##                 --enable-fail-if-missing \
##                 --enable-gui=no \
##                 --enable-tclinterp=yes \
##                 --enable-cscope=yes \
##                 --enable-gpm \
##                 --enable-cscope \
##                 --enable-fontset \
##                 --with-x \
##                 --with-compiledby=koturn
##     make -j5
##     sudo make install
##     cd ../../
##     rm -rf ./vim
## fi

# install bash-it
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh

# add new config to .bashrc
echo "Add setting to .bashrc"
cat $PWD/$BASHRC_MY >> $BASHRC

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
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# bakup old vimrc and install new one 
echo "Setup VIM setting"
mv $VIMRC $VIMRC_BAK
ln -s $PWD/$VIMRC_MY $VIMRC
vim +PlugInstall +qall

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install 

# complie YCM
~/.vim/plugged/YouCompleteMe/install.py 

# makeup CLI
echo "Setup dircolors to solarized dark"
wget --no-check-certificate https://raw.github.com/seebi/dircolors-solarized/master/dircolors.ansi-dark
mv dircolors.ansi-dark ~/.dircolors

source $BASHRC

echo DONE!!
