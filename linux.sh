#!/bin/bash

# set github
read -p 'Github Username: ' uname
read -p 'Github Email: ' email
git config --global user.name $uname
git config --global user.email $email

# pulling dotfiles from personal repo
cd ~
if [ -d .git ]; then
    echo 'Dotfiles previously installed or another repo exists at ~';
else
    mv .bashrc .bashrc_old
    git init . && git remote add origin https://github.com/pmdaly/dotfiles.git
    git pull origin master
fi;

# vim plugins 
if [ -d .vim ]; then
    echo 'Vim directory exists, skipping...'
else
    git clone https://github.com/gmarik/Vundle.vim.git ./.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi;
