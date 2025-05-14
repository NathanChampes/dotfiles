#!/bin/bash
updates=$(checkupdates | wc -l)
echo "{\"text\": \"󰚰 $updates\", \"tooltip\": \"$updates mises à jour disponibles\"}"
