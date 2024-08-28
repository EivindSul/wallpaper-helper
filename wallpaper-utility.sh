#!/usr/bin/env bash

WALLPAPERS_DIR=$HOME/Pictures/wallpapers/

WALLPAPERS=$(find $WALLPAPERS_DIR -type f \( -iname "*.jpg" -o -iname "*.png" \) )

ACTIVE=$( hyprctl hyprpaper listactive )
CURRENT_WALLPAPER=$( echo $ACTIVE | awk '{print $NF}')
MONITOR=$( echo $ACTIVE | awk '{print $1}')

NEXT_WALLPAPER=$( echo "$WALLPAPERS" | grep -A 1 $CURRENT_WALLPAPER | tail --lines 1 )

if [ ! -n "$NEXT_WALLPAPER" ] ; then
    ERR="NEXT_WALLPAPER is empty"
    echo "$ERR"
    notify-send "$ERR"
    exit 1
fi

if [ ! -f "$NEXT_WALLPAPER" ]; then
    ERR="Could not find next_wallpaper at $NEXT_WALLPAPER"
    echo "$ERR"
    notify-send "$ERR"
    exit 1
fi

if [ "$NEXT_WALLPAPER" == "$CURRENT_WALLPAPER" ]; then
    echo "Trying to set wallpaper to itself. Assuming current wallpaper is the last in the list."
    echo "Changing NEXT_WALLPAPER to the first in the directory!"
    NEXT_WALLPAPER=$(echo "$WALLPAPERS" | head --lines 1)
fi

echo "setting wallpaper..."
hyprctl hyprpaper preload "$NEXT_WALLPAPER"
hyprctl hyprpaper wallpaper "$MONITOR,$NEXT_WALLPAPER"

hyprctl hyprpaper unload unused

echo "$NEXT_WALLPAPER" > $HOME/.config/hypr/wallpaper

exit 0

