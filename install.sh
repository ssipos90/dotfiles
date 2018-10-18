#!/bin/bash
if [ ! $(command -v git) ]; then
    echo "GIT is not installed. Bailing..."
    exit 1
fi

if [ -d ~/.vim/pack/minpac/opt/minpac ]; then
    echo "Looks like minpac is installed. Bailing..."
    exit 2
fi

mkdir -p ~/.vim/pack/minpac/opt/

git clone https://github.com/k-takata/minpac.git --depth=1 -b master ~/.vim/pack/minpac/opt/minpac

