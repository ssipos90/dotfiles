#!/bin/sh

# if your LAN does not connect after waking pc from sleep, then
# copy this file to /usr/lib/systemd/system-sleep/lan-fix.sh
# chmod +x ;)

case $1/$2 in
        pre/*)
                ;;
        post/*)
                modprobe -r r8169
                sleep 3
                modprobe r8169
                ;;

esac

