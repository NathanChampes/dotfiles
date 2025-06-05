#!/usr/bin/env bash

current=$(nix profile list | grep -c '^0')

updates=$(nix profile upgrade --dry-run 2>/dev/null | grep -c 'would upgrade')

echo "{\"text\": \"󰚰 $updates\", \"tooltip\": \"$updates mises à jour disponibles\"}"
