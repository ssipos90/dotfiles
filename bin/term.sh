#!/bin/bash
MAIN=$HOME/.config/alacritty/alacritty.yml
SCROLLING=$HOME/.config/alacritty/scrolling.yml

exec alacritty --config-file <( cat $MAIN $SCROLLING ) $@

