#!/bin/bash
set -eu

RESOLUTION=$(xrandr -q | sed -n 's/.*current[ ]\([0-9]*\) x \([0-9]*\),.*/\1x\2/p')

# lock the screen
import -window root jpeg:- \
    | convert - -scale 20% -blur 0x2 -resize 500% RGB:- \
    | exec i3lock -n --raw $RESOLUTION:rgb -i /dev/stdin -e $@
