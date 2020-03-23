#!/bin/bash

xkbuserdir=$HOME/.dotfiles/confs/xkb
if [[ -d $xkbuserdir ]]; then
    xkbcomp -synch -w3 -I$xkbuserdir $xkbuserdir/keymap/custom.xkb $DISPLAY > /dev/null
fi


if lsusb -d 046d:c336 > /dev/null ; then
    g810-led -r 1 00ff00 &
    g810-led -r 2 00ff00 &
    g810-led -r 3 00ff00 &
    g810-led -r 4 ff0000 &
    g810-led -r 5 ff0000 &
fi


