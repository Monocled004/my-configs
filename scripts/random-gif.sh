#!/bin/sh

number=$((1 + $RANDOM % 5))

if [ "$number" -eq 1 ]; then
    mpvpaper -o "no-audio loop" eDP-1 ~/Pictures/gifs/cozy-bedroom.gif --fork
    waybar --config ~/.config/waybar/config --style ~/.config/waybar/style-my-blue.css

elif [ "$number" -eq 2 ]; then
    mpvpaper -o "no-audio loop" eDP-1 ~/Pictures/gifs/ferrari-testarossa.gif --fork
    waybar --config ~/.config/waybar/config --style ~/.config/waybar/style-catpuccin.css

elif [ "$number" -eq 3 ]; then
    mpvpaper -o "no-audio loop" eDP-1 ~/Pictures/gifs/cyberpunk-apartment.gif --fork
    waybar --config ~/.config/waybar/config --style ~/.config/waybar/style-apartment.css

elif [ "$number" -eq 4 ]; then
    mpvpaper -o "no-audio loop" eDP-1 ~/Pictures/gifs/neon-cityscape.gif --fork
    waybar --config ~/.config/waybar/config --style ~/.config/waybar/style-catpuccin.css

elif [ "$number" -eq 5 ]; then
    mpvpaper -o "no-audio loop" eDP-1 ~/Pictures/gifs/sombra-hideout.gif --fork
    waybar --config ~/.config/waybar/config --style ~/.config/waybar/style-sombra.css
fi
