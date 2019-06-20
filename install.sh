#!/bin/bash

set -eu
SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
declare -A items=(
  ["zshrc"]=".zshrc"
  ["gitconfig"]=".gitconfig"
  ["tmux"]=".tmux"
  ["vim"]=".vim"
  ["npmrc"]=".npmrc"
)

grep -Fxq "source $SCRIPTPATH/paths" $HOME/.profile || echo -e "source $SCRIPTPATH/paths\n\n$(cat $HOME/.profile)" > $HOME/.profile

for item in "${!items[@]}"; do
    SYMLINK=$HOME/${items[$item]}
    if [[ -e $SYMLINK ]]; then
        echo "Symlink already exists: $SYMLINK"
    else
        ln -s $SCRIPTPATH/$item $SYMLINK 
    fi
done

