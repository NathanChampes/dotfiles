#!/bin/bash
# Copie de mes .dotfiles
packages=("nvim" "tmux" "sway" "kitty" "waybar" "wofi" "wallpaper")
for string in "${packages[@]}"; do 
    if [ -d "./$string" ]; then
        rm -rf "./$string"
    fi
    cp -r ~/.config/"$string" "./$string"
    git add .
done
# Pour zshrc la logique est chiante
if [ -f "./zshrc" ]; then
    rm -f "./zshrc"
fi
cp ~/.zshrc "./zshrc"
git add "./zshrc"

read -p "Entrez le commit : " commit
git commit -m "$commit"
git push
