#!/bin/sh

ls ~/.i3/layouts/ | rofi -dmenu | xargs -I '{}' sh ~/.i3/layouts/{}/start.sh

