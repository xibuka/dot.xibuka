
VIMRC=~/.vimrc
VIMRC_BAK=~/.vimrc.bak
VIMRC_MY=~/.vimrc

# Install neccessary packages
sudo yum -y install gcc git ncurses-devel

#install vim 8 or newer
git clone https://github.com/vim/vim.git
cd vim/src/
sudo make
sudo make install
cd ../../

# clone Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# bakup old vimrc and cp new 
if [ -z $VIMRC ];then
    mv $VIMRC $VIMRC_BAK
fi
cp $VIMRC_MY $VIMRC

vim +PluginInstall +qall

echo DONE!!
