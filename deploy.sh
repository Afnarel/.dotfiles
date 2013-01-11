#!/usr/bin/env bash

echo "Getting Pathogen..."
curl -Sso .vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

echo "Init/update submodules..."
git submodule update --init

cd

for i in $(ls -A $OLDPWD)
do
    if [ "$i" != "deploy.sh" -a "$i" != ".git" ]
    then
        echo "Symlinking $i..."
        rm -rf $i && ln -s "$OLDPWD/$i"
    fi
done
