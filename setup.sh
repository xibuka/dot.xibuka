
VIMRC=~/.vimrc
VIMRC_BAK=~/.vimrc.bak
VIMRC_MY=./vimrc

# Install neccessary packages
# sudo yum -y install gcc git ncurses-devel

#install vim 8 or newer
#echo -n "do you need to install vim 8?[y/N]"
#read install_vim=${install_vim:-N}
#if [ install_vim != "N" ] || [ install_vim != "n" ];then
#    git clone https://github.com/vim/vim.git
#    cd vim/src/
#    sudo make
#    sudo make install
#    cd ../../
#fi

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# bakup old vimrc and cp new 
mv $VIMRC $VIMRC_BAK
ln -s $PWD/$VIMRC_MY $VIMRC

vim +PlugInstall +qall

echo DONE!!
