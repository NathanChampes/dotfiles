#!/bin/bash

# On défini les packages 
packages=("nvim" "tmux" "sway" "kitty" "waybar" "wofi" "wallpaper")

# On vérifie que le dossier soit bien un dossier git 
if [ ! -d ".git" ]; then
    echo "Ce script doit être exécuté à la racine de votre dépôt git de dotfiles."
    exit 1
fi

# On fait un petit git pull avant d'appliquer les dotfiles
echo "Mise à jour du dépôt git..."
git pull
if [ $? -ne 0 ]; then
    echo "Impossible de mettre à jour le dépôt git."
    exit 1
fi

# Si le répertoire ~/.config n'existe pas mais ça ne devrait jamais arriver
if [ ! -d ~/.config ]; then
    echo "Création du répertoire ~/.config"
    mkdir -p ~/.config
fi

echo "Application des dotfiles..."

for package in "${packages[@]}"; do
    if [ -d "./$package" ]; then
        # Si les dossier de mes packages sont déjà présent, on crée un backup pour ne rien risquer de perdre 
        if [ -d ~/.config/"$package" ]; then
            backup_dir=~/.config/"$package"_backup_$(date +%Y%m%d_%H%M%S)
            echo "Sauvegarde de la configuration existante de $package vers $backup_dir"
            mv ~/.config/"$package" "$backup_dir"
        fi
        
        echo "Application des dotfiles pour $package"
        cp -r "./$package" ~/.config/
        
        if [ $? -eq 0 ]; then
            echo "Configuration de $package appliquée avec succès."
        else
            echo "Erreur lors de l'application de la configuration de $package."
        fi
    else
        echo "Le répertoire ./$package n'existe pas dans le dépôt."
    fi
done

echo Tous les dotfiles ont été appliqués. Vous devrez peut-être redémarrer certaines applications pour voir les changements."
