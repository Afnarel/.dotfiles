#!/usr/bin/env bash

ignore=("deploy.sh" ".git" ".gitignore" ".gitmodules" "README.md" "DOCUMENTATION.md")
shouldCopy() {
  for f in ${ignore[*]}; do
    [[ "$1" == "$f" ]] && return 0
  done
  return 1
}

echo "Update repository..."
git pull

echo "Getting Pathogen..."
curl -Sso .vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

echo "Init/update submodules..."
git submodule update --init --recursive

cd

for i in $(ls -A $OLDPWD)
do
    shouldCopy $i
    if [ $? -ne 0 ]
    then
        echo "Symlinking $i..."
        rm -rf $i && ln -s "$OLDPWD/$i"
    fi
done

echo "Sourcing .bashrc..."
. .bashrc

echo "Restoring location..."
cd $OLDPWD
