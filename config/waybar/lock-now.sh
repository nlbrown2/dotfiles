#!/bin/sh
LOCKER="/home/nathan/.config/swaylock/lock.sh --grace-no-mouse"
swayidle timeout 3 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' &
$LOCKER
kill %%
