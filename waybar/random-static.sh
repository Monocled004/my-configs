#!/bin/sh

# Initializing swww-daemon
swww init

# Creating variable for storing previous wallpaper, Which can be used for avoiding same wallpaper
prev=0
prev1=0

# Creating Random number
number=$((1 + $RANDOM % 10))

# Loop for repeating change of wallpaper
while true
do
    # Gradient Screen before displaying new wallpaper with a delay of 3sec for smooth transition
    swww img ~/Pictures/wallpapers/black-grad.png --transition-type outer
    sleep 3

    # If-Elif-Else loop for Displaying new wallpaper
    if [ "$number" -eq 1 ]; then
        swww img ~/Pictures/wallpapers/glass-bottle.jpg --transition-type center
        pkill waybar
        waybar --config ~/.config/waybar/config --style ~/.config/waybar/style-catppuccin.css &
        prev1=$prev
        prev=1

    elif [ "$number" -eq 2 ]; then
        swww img ~/Pictures/wallpapers/abstract.png --transition-type center
        pkill waybar
        waybar --config ~/.config/waybar/config --style ~/.config/waybar/style-grey.css &
        prev1=$prev
        prev=2

    elif [ "$number" -eq 3 ]; then
        swww img ~/Pictures/wallpapers/live-city.jpg --transition-type center
        pkill waybar
        waybar --config ~/.config/waybar/config --style ~/.config/waybar/style-grey.css &
        prev1=$prev
        prev=3

    elif [ "$number" -eq 4 ]; then
        swww img ~/Pictures/wallpapers/minecraft.jpg --transition-type center
        pkill waybar
        waybar --config ~/.config/waybar/config --style ~/.config/waybar/style-grey.css &
        prev1=$prev
        prev=4

    elif [ "$number" -eq 5 ]; then
        swww img ~/Pictures/wallpapers/rain-girl.jpg --transition-type center
        pkill waybar
        waybar --config ~/.config/waybar/config --style ~/.config/waybar/style-grey.css &
        prev1=$prev
        prev=5

    elif [ "$number" -eq 6 ]; then
        swww img ~/Pictures/wallpapers/sky-city.jpg --transition-type center
        pkill waybar
        waybar --config ~/.config/waybar/config --style ~/.config/waybar/style-catppuccin.css &
        prev1=$prev
        prev=6

    elif [ "$number" -eq 7 ]; then
        swww img ~/Pictures/wallpapers/night-sky.png --transition-type center
        pkill waybar
        waybar --config ~/.config/waybar/config --style ~/.config/waybar/style-grey.css &
        prev1=$prev
        prev=7

    elif [ "$number" -eq 8 ]; then
        swww img ~/Pictures/wallpapers/cyberpunk.png --transition-type center
        pkill waybar
        waybar --config ~/.config/waybar/config --style ~/.config/waybar/style-catppuccin.css &
        prev1=$prev
        prev=8

    elif [ "$number" -eq 9 ]; then
        swww img ~/Pictures/wallpapers/night-store.png --transition-type center
        pkill waybar
        waybar --config ~/.config/waybar/config --style ~/.config/waybar/style-catppuccin.css &
        prev1=$prev
        prev=9

    elif [ "$number" -eq 10 ]; then
        swww img ~/Pictures/wallpapers/night-city.png --transition-type center
        pkill waybar
        waybar --config ~/.config/waybar/config --style ~/.config/waybar/style-catppuccin.css &
        prev1=$prev
        prev=10

    fi

    # generating new number for next iteration
    number=$((1 + $RANDOM % 10))

    # For checking whether new number is different with previous one, If it is then generate new one
    while true
    do
        if [ $number -eq $prev1 ] &&
            [ $number -eq $prev ]; then
                    number=$((1 + $RANDOM % 10))
                else
                    break
        fi
    done

    # Adding Delay for next Iteration (in Seconds)
    sleep 120
done
