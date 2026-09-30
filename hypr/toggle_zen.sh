#!/bin/bash

# A file to keep track of our current state
STATE_FILE="/tmp/zen_mode_state"
WAYBAR_DIR="$HOME/.config/waybar"

if [ -f "$STATE_FILE" ]; then
    # ZEN MODE IS ON -> TURN IT OFF (Back to Floating)
    rm "$STATE_FILE"

    # Swap Waybar to Floating
    cp "$WAYBAR_DIR/config-floating.jsonc" "$WAYBAR_DIR/config.jsonc"
    cp "$WAYBAR_DIR/style-floating.css" "$WAYBAR_DIR/style.css"

else
    # ZEN MODE IS OFF -> TURN IT ON (Solid Bar, No Gaps)
    touch "$STATE_FILE"

    # Swap Waybar to Solid
    cp "$WAYBAR_DIR/config-solid.jsonc" "$WAYBAR_DIR/config.jsonc"
    cp "$WAYBAR_DIR/style-solid.css" "$WAYBAR_DIR/style.css"
fi

# Reload Waybar instantly without killing it completely
killall -SIGUSR2 waybar
