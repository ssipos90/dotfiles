#!/bin/bash
set -eux

rm -rf .temp
mkdir .temp

TPM_VERSION=3.0.0
TPM_DOWNLOAD_VERSION=v${TPM_VERSION}
TPM_ARCHIVE_DIR=tpm-${TPM_VERSION}

if [[ -d plugins ]]; then
    echo "TPM already installed"
    exit 1
fi

mkdir plugins
git clone https://github.com/tmux-plugins/tpm plugins/tpm
exec sh plugins/tpm/tpm

