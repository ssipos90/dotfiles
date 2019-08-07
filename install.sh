#!/bin/bash

mkdir .tmp
cd .tmp

if [[ -d plugins ]]; then
    echo "TPM already installed"
else
    wget https://github.com/tmux-plugins/tpm/archive/master.zip -o tpm.zip
    unzip tpm.zip -d ../plugins/tmp
fi

