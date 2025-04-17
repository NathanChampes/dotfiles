#!/bin/bash
# Copie de mes .dotfiles
packages=("nvim" "tmux" "sway" "kitty" "waybar" "wofi")
for string in "${packages[@]}"; do 
    if [ -d "./$string" ]; then
        rm -rf "./$string"
    fi
    cp -r ~/.config/"$string" "./$string"
    git add .
done
read -p "Entrez le commit : " commit
git commit -m "$commit"
git push
