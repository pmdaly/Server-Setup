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

# check if node exists, used for coc
if ! command -v node &> /dev/null
then
    curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
    source ~/.bashrc && nvm install node
else
    echo 'node already installed'
fi
