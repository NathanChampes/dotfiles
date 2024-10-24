# Neovim Configuration

This repository contains my personal Neovim configuration files. It is designed for optimal performance and usability, with a focus on coding efficiency and a smooth workflow.

## Features
- **Plugin Management**: Managed using `lazy.nvim` for easy installation and updating of plugins.
- **Terminal Setup**: Terminal integrated at the bottom for convenience.
- **Markdown Preview**: Integrated with the `markdown-preview.nvim` plugin (requires manual installation of `tslib`).
- **Language Support**: Configured for JavaScript, Python, PHP, and other languages.
- **Customization**: Keybindings and settings are optimized for development on Arch Linux with KDE Plasma.
- **LSP Support**: Language Server Protocol configuration for better code assistance and autocompletion.
- **Themes**: A custom color scheme is included for a personalized look.

## Requirements
- Neovim (>= 0.8)
- `git`
- Node.js (for `markdown-preview.nvim`)
- `tslib` (install manually)

## Installation
1. Clone this repository into your Neovim config folder:
    ```bash
    git clone https://github.com/yourusername/nvim-config.git ~/.config/nvim
    ```

2. Install the required plugins:
    Open Neovim and run:
    ```vim
    :Lazy install
    ```

3. For markdown preview, install `tslib`:
    ```bash
    npm install -g tslib
    ```

## Usage
Launch Neovim as usual:
```bash
nvim
