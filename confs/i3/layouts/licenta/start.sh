#!/bin/sh

set -eu

# 1:  "
# 2:  "
# 3:  "
# 4:  "
# 5:  "
# 6:  "

function ws1 () {
  i3-msg "\
        workspace 1:  ; \
        append_layout ~/.i3/layouts/licenta/1.json; \
        exec firefox -P work --class=\"firefox-work\" https://www.licenta.local http://42.mongo.local \
        "
}

function ws2 () {
  i3-msg "\
        workspace 2:  ; \
        append_layout ~/.i3/layouts/licenta/2.json; \
        exec code-oss -n ~/work/.workspaces/vue.code-workspace; \
        exec code-oss -n ~/work/.workspaces/node.code-workspace; \
        "
}

function ws3 () {
  i3-msg "\
        workspace 3:  ; \
        append_layout ~/.i3/layouts/licenta/3.json; \
        exec alacritty --title=\"BottomLeft - Alacritty\" --working-directory ~/work/licenta; \
        exec alacritty --title=\"TopRight - Alacritty\" --working-directory ~/work/licenta; \
        exec alacritty --title=\"BottomRight - Alacritty\" --working-directory ~/work/licenta; \
        exec alacritty --title=\"TopLeft - Alacritty\" --working-directory ~/work/licenta/docker; \
        "
}

if [ $# -eq 0 ]; then
    ws1
    ws2
    ws3
fi

while test $# -gt 0
do
    case "$1" in
        1) ws1
            ;;
        2) ws2
            ;;
        3) ws3
            ;;
        *) echo "argument $1 is unknown"
            ;;
    esac
    shift
done

exit 0

