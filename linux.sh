#!/bin/bash

# set github
if [ $# -eq 2 ]; then
    git config --global user.name $1
    git config --global user.email $2
else
    echo 'Skipping github setup, remember to set name and email!'
fi

# pulling dotfiles from personal repo
cd ~
if [ -d .git ]; then
    echo 'Dotfiles previously installed or another repo exists at ~';
else
    mv .bashrc .bashrc_old
    git init . && git remote add origin https://github.com/pmdaly/dotfiles.git
    git pull origin master
fi;

# check if node exists, used for coc
if ! command -v node &> /dev/null
then
    curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
    source ~/.bashrc && nvm install node
else
    echo 'node already installed'
fi
