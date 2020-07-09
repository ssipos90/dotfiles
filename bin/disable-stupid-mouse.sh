#!/bin/sh

set -eu
MOUSE_NAME="GXT 107 Gaming Mouse"

MOUSE_ID=$(xinput list --id-only "$MOUSE_NAME" 2>/dev/null)

if [ -n "$MOUSE_ID" ]; then
    xinput set-button-map $MOUSE_ID 1 2 3 4 5 6 7 0 0 
fi

