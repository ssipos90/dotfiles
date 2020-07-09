#!/bin/sh

set -eu

WORKSPACES_DIR="$HOME/work/.workspaces"

ls -1 "$WORKSPACES_DIR" | sed -e 's/\.code-workspace$//' | rofi -dmenu | xargs -I '{}' code "$WORKSPACES_DIR/{}.code-workspace"

