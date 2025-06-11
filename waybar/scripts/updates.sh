#!/usr/bin/env bash

cd ~/projects/nixcfg || exit 1

cp flake.lock flake.lock.bak

nix flake update 2>/dev/null

if git diff --no-index --quiet flake.lock.bak flake.lock; then
    updates=0
else
    updates=1
fi

mv flake.lock.bak flake.lock

echo "{\"text\": \"󰚰 $updates\", \"tooltip\": \"$updates mise(s) à jour disponible(s) dans le flake système\"}"
