#!/bin/bash
MAIN=$HOME/.config/alacritty/alacritty.yml
SCROLLING=$HOME/.config/alacritty/scrolling.yml

exec alacritty --config-file $MAIN $@ # <( cat $MAIN $SCROLLING ) $@

