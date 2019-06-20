#!/bin/bash

set -eu
SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

cd $SCRIPTPATH

git submodule update --init --recursive

grep -Fxq "source $SCRIPTPATH/paths" $HOME/.profile || echo -e "source $SCRIPTPATH/paths\n\n$(cat $HOME/.profile)" > $HOME/.profile

declare -A symlinks=(
  ["zshrc"]=".zshrc"
  ["gitconfig"]=".gitconfig"
  ["tmux"]=".tmux"
  ["vim"]=".vim"
  ["npmrc"]=".npmrc"
)

for symlink in "${!symlinks[@]}"; do
    SYMLINK=$HOME/${symlinks[$symlink]}
    if [[ -e $SYMLINK ]]; then
        echo "Symlink already exists: $SYMLINK"
    else
        ln -s $SCRIPTPATH/$symlink $SYMLINK 
    fi
done

declare -a installers=("vim" "tmux")

for installer in "${installers[@]}"; do
    $installer/install.sh
done

