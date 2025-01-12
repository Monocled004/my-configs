#!/bin/sh

# Creating variable for storing previous wallpaper, Which can be used for avoiding same wallpaper
prev=0
prev1=0

# Creating Random number
number=$((1 + $RANDOM % 10))

# Loop for repeating change of wallpaper
while true
do
    # If-Elif-Else loop for Displaying new wallpaper
    if [ "$number" -eq 1 ]; then
        swaybg -i ~/Pictures/wallpaper/glass-bottle.jpg -m fit &
        pkill waybar
        waybar --config ~/.config/waybar/config --style ~/.config/waybar/style-catppuccin.css &
        prev1=$prev
        prev=1

    elif [ "$number" -eq 2 ]; then
        swaybg -i ~/Pictures/wallpaper/abstract.png -m fit &
        pkill waybar
        waybar --config ~/.config/waybar/config --style ~/.config/waybar/style-grey.css &
        prev1=$prev
        prev=2

    elif [ "$number" -eq 3 ]; then
        swaybg -i ~/Pictures/wallpaper/live-city.jpg -m fit &
        pkill waybar
        waybar --config ~/.config/waybar/config --style ~/.config/waybar/style-grey.css &
        prev1=$prev
        prev=3

    elif [ "$number" -eq 4 ]; then
        swaybg -i ~/Pictures/wallpaper/minecraft.jpg -m fit &
        pkill waybar
        waybar --config ~/.config/waybar/config --style ~/.config/waybar/style-grey.css &
        prev1=$prev
        prev=4

    elif [ "$number" -eq 5 ]; then
        swaybg -i ~/Pictures/wallpaper/rain-girl.jpg -m fit &
        pkill waybar
        waybar --config ~/.config/waybar/config --style ~/.config/waybar/style-grey.css &
        prev1=$prev
        prev=5

    elif [ "$number" -eq 6 ]; then
        swaybg -i ~/Pictures/wallpaper/sky-city.jpg -m fit &
        pkill waybar
        waybar --config ~/.config/waybar/config --style ~/.config/waybar/style-catppuccin.css &
        prev1=$prev
        prev=6

    elif [ "$number" -eq 7 ]; then
        swaybg -i ~/Pictures/wallpaper/night-sky.png -m fit &
        pkill waybar
        waybar --config ~/.config/waybar/config --style ~/.config/waybar/style-grey.css &
        prev1=$prev
        prev=7

    elif [ "$number" -eq 8 ]; then
        swaybg -i ~/Pictures/wallpaper/cyberpunk.png -m fit &
        pkill waybar
        waybar --config ~/.config/waybar/config --style ~/.config/waybar/style-catppuccin.css &
        prev1=$prev
        prev=8

    elif [ "$number" -eq 9 ]; then
        swaybg -i ~/Pictures/wallpaper/night-store.png -m fit &
        pkill waybar
        waybar --config ~/.config/waybar/config --style ~/.config/waybar/style-catppuccin.css &
        prev1=$prev
        prev=9

    elif [ "$number" -eq 10 ]; then
        swaybg -i ~/Pictures/wallpaper/night-city.png -m fit &
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
