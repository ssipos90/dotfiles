#!/bin/bash
set -eu

SCREENSHOT=$(mktemp --suffix=.png)

import -window root jpeg:- | convert - -scale 20% -blur 0x2.5 -resize 500% $SCREENSHOT

# lock the screen
exec i3lock -n -i $SCREENSHOT -e $@

