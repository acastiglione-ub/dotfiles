#!/bin/bash
#Shamlessly stolen from https://github.com/vgod/vimrc
cd ~
ls -s dotfiles/vim .vim 
if [ -h .vimrc ]
then
  mv .vimrc .vimrc.backup
  echo "Moved existing .vimrc to .vimrc.backup"
fi

ln -s dotfiles/vim/vimrc .vimrc 
echo "Installed .vimrc!"

yes | vim +BundleInstall +qall
cd ~/.vim/bundle/command-t/ruby/command-t
rbenv local system
ruby extconf.rb
make clean
make
