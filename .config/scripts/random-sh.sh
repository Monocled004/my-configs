#!/bin/sh

# Creating Random number
number=$((1 + $RANDOM % 3))

# If-Elif-Else loop for Displaying new wallpaper
if [ "$number" -eq 1 ]; then
	sh ~/.config/scripts/pacman.sh

elif [ "$number" -eq 2 ]; then
	sh ~/.config/scripts/rally-x.sh

elif [ "$number" -eq 3 ]; then
	sh ~/.config/scripts/tanks.sh

fi
