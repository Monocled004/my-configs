#!/bin/sh

# Creating variable for storing previous wallpaper, Which can be used for avoiding same wallpaper
prev=0
prev1=0
prev2=0

# Creating Random number
number=$((1 + $RANDOM % 11))

# Loop for repeating change of wallpaper
while true
do

    # If-Elif-Else loop for Displaying new wallpaper
    if [ "$number" -eq 1 ]; then
        feh --bg-scale ~/Pictures/wallpapers/glass-bottle.jpg
        prev2=$prev1
        prev1=$prev
        prev=1

    elif [ "$number" -eq 2 ]; then
        feh --bg-scale ~/Pictures/wallpapers/abstract.png
        prev2=$prev1
        prev1=$prev
        prev=2

    elif [ "$number" -eq 3 ]; then
        feh --bg-scale ~/Pictures/wallpapers/live-city.jpg
        prev2=$prev1
        prev1=$prev
        prev=3

    elif [ "$number" -eq 4 ]; then
        feh --bg-scale ~/Pictures/wallpapers/minecraft.jpg
        prev2=$prev1
        prev1=$prev
        prev=4

    elif [ "$number" -eq 5 ]; then
        feh --bg-scale ~/Pictures/wallpapers/rain-girl.jpg
        prev2=$prev1
        prev1=$prev
        prev=5

    elif [ "$number" -eq 6 ]; then
        feh --bg-scale ~/Pictures/wallpapers/sky-city.jpg
        prev2=$prev1
        prev1=$prev
        prev=6

    elif [ "$number" -eq 7 ]; then
        feh --bg-scale ~/Pictures/wallpapers/night-sky.png
        prev2=$prev1
        prev1=$prev
        prev=7

    elif [ "$number" -eq 8 ]; then
        feh --bg-scale ~/Pictures/wallpapers/cyberpunk.png
        prev2=$prev1
        prev1=$prev
        prev=8

    elif [ "$number" -eq 9 ]; then
        feh --bg-scale ~/Pictures/wallpapers/night-store.png
        prev2=$prev1
        prev1=$prev
        prev=9

    elif [ "$number" -eq 10 ]; then
        feh --bg-scale ~/Pictures/wallpapers/night-city.png
        prev2=$prev1
        prev1=$prev
        prev=10

    elif [ "$number" -eq 11 ]; then
        feh --bg-scale ~/Pictures/wallpapers/evening-forest.png
        prev2=$prev1
        prev1=$prev
        prev=11
    fi

    # generating new number for next iteration
    number=$((1 + $RANDOM % 11))

    # For checking whether new number is different with previous one, If it is then generate new one
    while true
    do
        if [ $number -eq $prev1 ] && [ $number -eq $prev ] && [ $number -eq $prev2 ]; then
            number=$((1 + $RANDOM % 11))
        else
            break
        fi
    done

    # Adding Delay for next Iteration (in Seconds)
    sleep 120
done
