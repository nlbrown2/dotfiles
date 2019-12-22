#!/bin/bash
# Changes the brightness based upon the first argument +/-. Maintains brightness.txt at the current brigthness value. If such a file does not exist, it will create it and set the brightness (and value in file) to 0.5
set -e
BRIGHTNESS_FILE=brightness.txt
if [ ! -f "$BRIGHTNESS_FILE" ]; then
    xrandr --output eDP --brightness 0.5;
    echo "0.5" > $BRIGHTNESS_FILE;
    exit 0;
fi
BRIGHTNESS=$(cat $BRIGHTNESS_FILE) # get current brightness
echo "Current brightness: $BRIGHTNESS";
if [ $# -lt 1 ]; then
    echo "Error! Did not detect + or -. Usage: $0 +/- [value]";
    exit 1
fi

DIRECTION=$1
DIFFERENCE=${2:-"0.1"}
NEW_BRIGHTNESS=$(echo "$BRIGHTNESS $DIRECTION $DIFFERENCE" | bc)
echo "Setting brightness from $BRIGHTNESS to $NEW_BRIGHTNESS";
echo $NEW_BRIGHTNESS > $BRIGHTNESS_FILE;
xrandr --output eDP --brightness $NEW_BRIGHTNESS;
