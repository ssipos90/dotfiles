#!/bin/sh

# 1:  
# 2:  
# 3:  
# 4:  
# 5:  

i3-msg "\
        workspace 1:  ; \
        append_layout ~/.i3/layouts/inv/1.json; \
        exec firefox -P work --class=\"firefox-work\" https://www.uvision.local http://42.mongo.local \
        "

i3-msg "\
        workspace 2:  ; \
        append_layout ~/.i3/layouts/inv/2.json; \
        exec pstorm; \
        "

i3-msg "\
        workspace 3:  ; \
        append_layout ~/.i3/layouts/inv/3.json; \
        exec alacritty --title=\"Right - Alacritty\" --working-directory ~/work/uvision; \
        exec alacritty --title=\"TopLeft - Alacritty\" --working-directory ~/work/uvision/docker/dev; \
        exec alacritty --title=\"BottomLeft - Alacritty\" --working-directory ~/work/uvision; \
        "

