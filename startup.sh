#!/bin/bash

env GTK2_RC_FILES=/usr/share/themes/Adwaita/gtk-2.0/gtkrc GTK_THEME=Adwaita:light firefox -P personal &
env GTK2_RC_FILES=/usr/share/themes/Adwaita/gtk-2.0/gtkrc GTK_THEME=Adwaita:light firefox -P work &

sleep 5

pid=`ps aux | grep firefox | grep "P personal" | awk '{print $2}' | head -1`
temp=`xdotool search --all --pid $pid | tail -n -1`
xdotool set_desktop_for_window $temp 3

pid=`ps aux | grep firefox | grep "P work" | awk '{print $2}' | head -1`
temp=`xdotool search --all --pid $pid | tail -n -1`
xdotool set_desktop_for_window $temp 0

