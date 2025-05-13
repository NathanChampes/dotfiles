# Mes Dotfiles

Ce dépôt GitHub contient tous mes fichiers de configuration (dotfiles), accompagnés d’explications.  

## Objectif

L’objectif de ce dépôt est de documenter l’évolution de mes outils ainsi que de leurs configurations au fil du temps.  
Chaque fichier reflète mes préférences du moment, mes besoins techniques et parfois simplement mon humeur.

## Contenu

Le dépôt inclut les configurations pour :

- **Neovim** (`nvim`) — Éditeur de texte
- **Tmux** (`tmux`) — Multiplexeur de terminal
- **Sway** (`sway`) — Gestionnaire de fenêtres Wayland
- **Kitty** (`kitty`) — Émulateur de terminal
- **Ghostty** (`ghostty`) — Émulateur de terminal que j'ai voulu test
- **Waybar** (`waybar`) — Barre de statut pour Wayland
- **Wofi** (`wofi`) — Lanceur d'applications pour Wayland
- **Wallpaper** (`wallpaper`) — Mes fonds d'écran personnels 
- **Zsh** (`zshrc`) — Ma configuration de z shell  

---

### 📝 Neovim (`nvim`)

Neovim est mon IDE principal depuis un moment.  
J’ai utilisé le framework [AstroNvim](https://astronvim.com/) pendant un temps, mais j’ai souhaité aller encore plus loin en partant d'une configuration minimaliste basée sur [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).  
Ma configuration Neovim est en constante évolution, en fonction de mon utilisation actuelle, de mon humeur et de mes envies.

---

### 🔀 Tmux (`tmux`)

Tmux est un outil qui permet d’avoir plusieurs instances de terminal dans une seule fenêtre.  
Ce n’est pas un indispensable lorsqu’on utilise un *window manager*, mais j’ai pris l’habitude de travailler avec plusieurs terminaux regroupés, ce qui le rend difficile à abandonner aujourd’hui.  
Ma configuration Tmux change rarement. La plus grande "innovation" est la modification du thème *Everforest* pour rendre la barre de statut transparente.

---

### 🧩 Sway (`sway`)

Sway est un *window manager*, souvent perçu comme un environnement de bureau minimaliste.  
Son principal avantage est qu’il est entièrement personnalisable, offrant une grande flexibilité. Cependant, cela peut rebuter certaines personnes, car l’ajout de fonctionnalités comme des raccourcis clavier nécessite de modifier manuellement les fichiers de configuration.

Depuis mon passage sous Linux, j’ai testé plusieurs environnements de bureau.  
J’ai commencé par KDE, que j’ai trouvé très complet, mais j’étais souvent frustré par sa gestion des fenêtres.  
J’ai alors décidé d’explorer les *window managers* : j’ai testé Hyprland, sans accrocher, puis découvert i3wm — un vrai coup de cœur.  
Cependant, avec l’évolution vers Wayland pour remplacer X11, Sway (compatible i3, mais basé sur Wayland) s’est imposé comme la solution idéale.

Ma configuration Sway change très régulièrement, au gré de mes besoins et expérimentations.

---

### 🐱 Kitty (`kitty`)

Kitty est un émulateur de terminal. Honnêtement, je l’ai choisi uniquement pour son icône de petit chat 🐱.  
Cela dit, c’est un terminal très complet : je n’ai jamais rencontré de problème ni ressenti le besoin d’en changer.  
Ma configuration Kitty évolue très peu, car il me convient parfaitement tel qu’il est.

---

### 👻 Ghostty (`ghostty`)

Ghostty est un émulateur de terminal que j'ai voulu test. 

---

### 📊 Waybar (`waybar`)

Waybar est une barre d’outils spécialement conçue pour les environnements basés sur Wayland.  
À l’image de SwayWM, elle est entièrement personnalisable, ce qui permet de l’adapter parfaitement à ses goûts et à son setup.

Ma configuration Waybar reflète mes préférences personnelles — comme vous pouvez vous en douter.  
Et comme tout ce qui est personnel, elle ne conviendra peut-être pas à tout le monde, mais c’est justement ce qui en fait tout l’intérêt.

---

### 🚀 Wofi (`wofi`)

Wofi est un lanceur d’applications.  
J’ai également utilisé son grand frère, Rofi, mais je dois dire que pour un système basé sur Wayland, Wofi est bien plus adapté : plus complet et plus simple à utiliser.

Je l’ai configuré pour qu’il s’intègre parfaitement à mes thèmes de couleurs et à mon fond d’écran, afin de garder une cohérence visuelle dans mon environnement.

---

### 🖼️ Wallpaper (`wallpaper`)

Cette section contient mes fonds d’écran personnels.  
J’ai une préférence marquée pour les peintures impressionnistes, en particulier celles de **Camille Pissarro**, dont plusieurs œuvres ornent régulièrement mon bureau.

Ces fonds d’écran contribuent à créer une ambiance visuelle cohérente avec mes thèmes de couleurs et renforcent l’atmosphère calme et élégante de mon environnement de travail.

## Installation

Pour installer ces dotfiles sur un nouveau système :

```bash
git clone https://github.com/NathanChampes/dotfiles.git
cd dotfiles
# Option 1: Copier manuellement les configurations souhaitées
cp -r nvim ~/.config/
cp -r kitty ~/.config/
cp -r sway ~/.config/
cp -r tmux ~/.config/
cp -r waybar ~/.config/
cp -r wofi ~/.config/
cp -r wallpaper ~/.config/
# Option 2: Utiliser un script d'installation (Je pense le créer quand j'aurais la motivation)
```

## Script d'automatisation

Le dépôt inclut un script bash pour faciliter la mise à jour des dotfiles :

```bash
./automatisation.sh
```

## Captures d'écran

### 📝 Neovim (`nvim`)
![Image](https://private-user-images.githubusercontent.com/119850289/437367543-eb1c0b7c-0559-4a4c-9a56-4962261ab4b7.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDU1NzIwNzQsIm5iZiI6MTc0NTU3MTc3NCwicGF0aCI6Ii8xMTk4NTAyODkvNDM3MzY3NTQzLWViMWMwYjdjLTA1NTktNGE0Yy05YTU2LTQ5NjIyNjFhYjRiNy5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUwNDI1JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MDQyNVQwOTAyNTRaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1mMDY5ZThkMGU0NzEzYTdhMTgzYjMwNDZhOTI3OTk1OGFmNjhiZTMxOTlmZmVkNzEwMTNhOGJmMzkwN2NhMzM1JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.A_MgqsuDLgjYegb9rLIDJBs66pawZgHG1JIlEJX1fbU)
![Image](https://private-user-images.githubusercontent.com/119850289/437367728-b9185b62-12c4-4e12-b9c0-7356c8fd1537.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDU1NzIwNzQsIm5iZiI6MTc0NTU3MTc3NCwicGF0aCI6Ii8xMTk4NTAyODkvNDM3MzY3NzI4LWI5MTg1YjYyLTEyYzQtNGUxMi1iOWMwLTczNTZjOGZkMTUzNy5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUwNDI1JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MDQyNVQwOTAyNTRaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1kMDk1NDZlMDQyMjZjMzJkNDNiZDZiOGJhYmQ0NTU0NGJkMWY0MmJkODQxNzZhY2M4MTBiY2EzMmY4YjQxYzkxJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.TRc9Jld7xTGB5bstraPZr2DldvVkQryOK2RHKAjpr9I)

### 🔀 Tmux (`tmux`)
![Image](https://private-user-images.githubusercontent.com/119850289/437368612-d0f51f23-7e76-497a-a428-b10b29f02190.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDU1NzIwNzQsIm5iZiI6MTc0NTU3MTc3NCwicGF0aCI6Ii8xMTk4NTAyODkvNDM3MzY4NjEyLWQwZjUxZjIzLTdlNzYtNDk3YS1hNDI4LWIxMGIyOWYwMjE5MC5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUwNDI1JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MDQyNVQwOTAyNTRaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT04MjI3NWZhNjJhZjYwZGRmMDk2Zjg3NzcxZGIxZjBiODI0ZDU2N2VmZGEwOGFkZTMyZGYzYWE2Zjg0MDVjNGFkJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.3vsu_7fgyuzMr9I80L45GS-XC-x8jDlLdduWIjhl0uY)

### 🧩 Sway (`sway`)
![Image](https://private-user-images.githubusercontent.com/119850289/437368886-8e6f7ea5-6d8a-4f25-a3fa-0f28da087005.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDU1NzIwNzQsIm5iZiI6MTc0NTU3MTc3NCwicGF0aCI6Ii8xMTk4NTAyODkvNDM3MzY4ODg2LThlNmY3ZWE1LTZkOGEtNGYyNS1hM2ZhLTBmMjhkYTA4NzAwNS5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUwNDI1JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MDQyNVQwOTAyNTRaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1mYTUzOWZlMWY1N2QxZDQxMDM5OTczMTdkOTc4MTFiODAxMWE2MmYyOTI1NjBhNDZkODBiMjFlODIzMGFmZDlmJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.B0RL57FMtcOZ-6t8AdrT2Fo_4LapBnwW-XfFT-_e790)

### 📊 Waybar (`waybar`)
![Image](https://private-user-images.githubusercontent.com/119850289/437370503-60d2ad1f-63da-4234-85d5-6277ea20d24b.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDU1NzIwNzQsIm5iZiI6MTc0NTU3MTc3NCwicGF0aCI6Ii8xMTk4NTAyODkvNDM3MzcwNTAzLTYwZDJhZDFmLTYzZGEtNDIzNC04NWQ1LTYyNzdlYTIwZDI0Yi5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUwNDI1JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MDQyNVQwOTAyNTRaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1mZTU2M2M2YjgxNGRjMzUyZWQ4YmY1ODk5OTEwOWNmYWQ5ZGJlYTE4ZjY0ZWQyY2I4YmQ1NmJiNjNkMDY3MWQ3JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.jLNVemE-hTowkC60qx7pQfNT1-hdSWjGcFHUfPKhg-g)

### 🚀 Wofi (`wofi`)
![Image](https://private-user-images.githubusercontent.com/119850289/437370643-5cc6311b-601f-408c-8a91-3ee61b0554b8.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDU1NzIwNzQsIm5iZiI6MTc0NTU3MTc3NCwicGF0aCI6Ii8xMTk4NTAyODkvNDM3MzcwNjQzLTVjYzYzMTFiLTYwMWYtNDA4Yy04YTkxLTNlZTYxYjA1NTRiOC5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUwNDI1JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MDQyNVQwOTAyNTRaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT05MzhjMjc4NjVhNDg5MTMzZWJkOWRhZTMyNTg5YjA2NzIwNjg2YjQ0NTFmODA5NTQ4NzAzNmI3ZmNkYzc1MjE4JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.lBQbHjU5wfqdcHn0E0uFNK-odKDHPeorHnc8-RIrHn4)
