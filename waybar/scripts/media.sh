#!/usr/bin/env bash

players=$(playerctl -l 2>/dev/null)

escape_markup() {
    sed -e 's/&/\&amp;/g' \
        -e 's/</\&lt;/g' \
        -e 's/>/\&gt;/g' \
        -e 's/"/\&quot;/g' \
        -e "s/'/\&apos;/g"
}

for player in $players; do
    status=$(playerctl -p "$player" status 2>/dev/null)
    if [ "$status" = "Playing" ]; then
        playerctl -p "$player" metadata --format '{{artist}} - {{title}}' 2>/dev/null | escape_markup | awk '{ print "⏸ " $0 }'
        exit 0
    fi
done

for player in $players; do
    status=$(playerctl -p "$player" status 2>/dev/null)
    if [ "$status" = "Paused" ]; then
        playerctl -p "$player" metadata --format '{{artist}} - {{title}}' 2>/dev/null | escape_markup | awk '{ print "▶ " $0 }'
        exit 0
    fi
done

echo ""
