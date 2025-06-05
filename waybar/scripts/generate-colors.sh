#!/usr/bin/env bash

wal -i ~/.config/wallpaper/bear.jpg --saturate 0.1 -n -s -t -e

pkill waybar && waybar &

echo '{"text": "🎨", "tooltip": "Couleurs mises à jour"}'
