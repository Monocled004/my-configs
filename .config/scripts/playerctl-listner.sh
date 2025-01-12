#!/usr/bin/env sh

CACHE_FILE="/tmp/playerctl_status"

dbus-monitor "interface='org.freedesktop.DBus.Properties',member='PropertiesChanged'" | \
    while read -r line; do
        if echo "$line" | grep -q "playerctl"; then
            playerctl metadata --player=spotify # > "$CACHE_FILE"
        fi
    done
