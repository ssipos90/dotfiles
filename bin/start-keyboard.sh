#!/bin/bash

# set capslock off
if xset q | grep "Caps Lock:   on"; then
  xdotool key Caps_Lock
fi

# load custom xkb symbols
xkbuserdir=$HOME/.dotfiles/confs/xkb
if [[ -d $xkbuserdir ]]; then
    xkbcomp -synch -w3 -I$xkbuserdir $xkbuserdir/keymap/custom.xkb $DISPLAY > /dev/null
fi

# restart xcape
systemctl --user restart xcape.service

# load Logitech keyboard LED profie
if lsusb -d 046d:c336 > /dev/null ; then
    g810-led -r 1 00ff00 &
    g810-led -r 2 00ff00 &
    g810-led -r 3 00ff00 &
    g810-led -r 4 ff0000 &
    g810-led -r 5 ff0000 &
fi

