#!/bin/bash
# File  : install-brew.sh
# Author: Nasos Lamprokostopoulos <nlamprok@gmail.com>

if ! brew ls --versions $1 >/dev/null; then
    echo "[+] installing $1"
    brew install $1
else
    echo "[.] $1 already installed"
fi
