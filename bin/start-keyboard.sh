#!/bin/bash

# load custom xkb symbols
xkbuserdir=$HOME/.dotfiles/confs/xkb
if [[ -d $xkbuserdir ]]; then
  notify-send "XKB config found, applying." &
  xkbcomp -synch -w3 -I$xkbuserdir $xkbuserdir/keymap/custom.xkb $DISPLAY > /dev/null
fi

sleep 1

# restart xcape
if systemctl --user list-unit-files | grep "xcape.service" | grep -q "enabled"; then
  notify-send "xcape service enabled, restarting." &
  systemctl --user restart xcape.service
fi

sleep 1

# load Logitech keyboard LED profie
if lsusb -d 046d:c336 > /dev/null ; then
  notify-send "Found Logitech g213 keyboard, applying colors." &
  g810-led -r 1 00ff00 &
  g810-led -r 2 00ff00 &
  g810-led -r 3 00ff00 &
  g810-led -r 4 ff0000 &
  g810-led -r 5 ff0000 &
fi

sleep 1

# set capslock off
if xset q | grep -q "Caps Lock:   on"; then
  notify-send "Found Caps Lock on, turning it off." &
  xdotool key Caps_Lock
fi

