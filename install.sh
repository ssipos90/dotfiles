#!/bin/bash

set -u
SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

declare -a dependencies=("xdotool" "git" "zsh" "tmux" "vim")
echo "checking dependencies"
for dep in "${!dependencies[@]}"; do
  dependency=${dependencies[$dep]}
  command -v ${dependency} > /dev/null
  if [[ $? -ne 0 ]]; then
    echo "Dependency missing: ${dependency}" >&2
    exit 1
  fi
done

cd $SCRIPTPATH

set -e
echo "loading git submodules"
git submodule update --init --recursive

echo "adding paths to path"
grep -Fxq "source $SCRIPTPATH/paths" $HOME/.profile || echo -e "source $SCRIPTPATH/paths\n\n$(cat $HOME/.profile)" > $HOME/.profile

declare -A symlinks=(
  ["zshrc"]=".zshrc"
  ["gitconfig"]=".gitconfig"
  ["tmux"]=".tmux"
  ["vim"]=".vim"
  ["npmrc"]=".npmrc"
  ["oh-my-zsh"]=".oh-my-zsh"
  ["Xmodmap"]=".Xmodmap"
  ["/usr/share/themes/Adwaita/gtk-2.0/"]="gtkrc-2.0"
)
echo "creating dotfile symlinks"
for rpath in "${!symlinks[@]}"; do
    SYMLINK=$HOME/${symlinks[$rpath]}
    if [[ -e $SYMLINK ]]; then
        echo "Symlink already exists: $SYMLINK" >&2
    else if [[ $rpath == /* ]]; then
        ln -s $rpath $symlink
    else
        ln -s $SCRIPTPATH/$rpath $SYMLINK
    fi
done

declare -a installers=("vim" "tmux")
echo "running sub installers"
for installer in "${installers[@]}"; do
    echo "running installer for $installer"
    $installer/install.sh | sed -e 's/^/ > /;'
done

