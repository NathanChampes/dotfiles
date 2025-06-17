typeset -U path cdpath fpath manpath
for profile in ${(z)NIX_PROFILES}; do
  fpath+=($profile/share/zsh/site-functions $profile/share/zsh/$ZSH_VERSION/functions $profile/share/zsh/vendor-completions)
done

HELPDIR="/nix/store/4kaqyfdyq0mj70r3q8ms2zyahdz7zggp-zsh-5.9/share/zsh/$ZSH_VERSION/help"

# Use viins keymap as the default.
bindkey -v

path+="$HOME/.zsh/plugins/zsh-history-substring-search"
fpath+="$HOME/.zsh/plugins/zsh-history-substring-search"


autoload -U compinit && compinit
source /nix/store/81s1mpv0x9r9p18xsp68h2083aipkmvq-zsh-autosuggestions-0.7.1/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history)


if [[ -f "$HOME/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh" ]]; then
  source "$HOME/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh"
fi
# History options should be set in .zshrc and after oh-my-zsh sourcing.
# See https://github.com/nix-community/home-manager/issues/177.
HISTSIZE="10000"
SAVEHIST="50000"

HISTFILE="$HOME/.history"
mkdir -p "$(dirname "$HISTFILE")"

setopt HIST_FCNTL_LOCK
unsetopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
unsetopt HIST_IGNORE_ALL_DUPS
unsetopt HIST_SAVE_NO_DUPS
unsetopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY


if [[ $options[zle] = on ]]; then
  source <(/nix/store/z3ayhjslz72ldiwrv3mn5n7rs96p2g8a-fzf-0.62.0/bin/fzf --zsh)
fi

# Lance automatiquement sway on load
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec sway
fi

# Configuration des options Zsh
setopt HIST_IGNORE_ALL_DUPS
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
setopt inc_append_history
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_MINUS

# Configuration des mots (pour la navigation par mots)
WORDCHARS=${WORDCHARS//[\/]}

# Complétion avancée
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Keybindings pour history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Fonctions personnalisées
py() {
  source ~/virtualenvs/nvim-venv/bin/activate
}

vz() {
  dir=$(zoxide query "$1") || return
  cd "$dir" && nvim
}

zv() {
  dir=$(zoxide query "$1") || return
  cd "$dir" && nvim .
}

dotfiles() {
  local config_dir="$HOME/.config"

  case "$1" in
    nvim|vim)
      nvim "$config_dir/nvim"
      ;;
    kitty)
      nvim "$config_dir/kitty"
      ;;
    sway)
      nvim "$config_dir/sway"
      ;;
    tmux)
      nvim "$config_dir/tmux"
      ;;
    waybar)
      nvim "$config_dir/waybar"
      ;;
    wofi)
      nvim "$config_dir/wofi"
      ;;
    home)
      nvim "$config_dir/home-manager/home.nix"
      ;;
    list)
      echo "Configurations disponibles:"
      echo "  nvim, kitty, sway, tmux, waybar, wofi, home"
      ;;
    *)
      echo "Usage: dotfiles [config_name]"
      echo "Exécutez 'dotfiles list' pour voir les configurations disponibles"
      ;;
  esac
}

gitdotfiles() {
  cd ~/projects/dotfiles/ && ./getAndCommit.sh
}

envDigidoc() {
  ~/projects/scripts/sync_env.sh
}

# Complétion Docker si disponible
if type docker > /dev/null 2>&1; then
  zstyle ':completion:*:*:docker:*' option-stacking yes
  zstyle ':completion:*:*:docker-*:*' option-stacking yes
fi

# Complétion Kubernetes si disponible
if type kubectl > /dev/null 2>&1; then
  source <(kubectl completion zsh)
fi

# Configuration des PATH
export PATH="$HOME/.console-ninja/.bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/.local/share/pnpm:$PATH"
export PATH="$HOME/.local/share/mise/shims:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
export NIX_PATH=nixpkgs=channel:nixos-unstable

# Initialisation pyenv si disponible
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if [[ $TERM != "dumb" ]]; then
  eval "$(/nix/store/sa6y5dghbdj04i4dwz7lxglfk1iafdci-starship-1.23.0/bin/starship init zsh)"
fi

alias -- ..='cd ..'
alias -- ...='cd ../..'
alias -- ....='cd ../../..'
alias -- boosteroid-install=install-boosteroid
alias -- boosteroid-logs='journalctl --user -f | grep -i boosteroid'
alias -- boosteroid-remove=uninstall-boosteroid
alias -- dev='cd ~/projects/Digidoc && vim .'
alias -- doom='$HOME/.emacs.d/bin/doom'
alias -- ec='emacsclient -c -a emacs'
alias -- emacs-daemon='emacs --daemon'
alias -- emacs-debug='emacs --debug-init'
alias -- et='emacsclient -t -a emacs'
alias -- g=git
alias -- k=kubectl
alias -- ll='ls -lah'
alias -- logs='sudo tail -f /var/log/httpd/error-localhost.log'
alias -- neovim=nvim
alias -- reload='home-manager switch'
alias -- sudonvim='sudo -E nvim'
alias -- v=nvim
alias -- vim=nvim
alias -- zshconfig='$EDITOR ~/.config/home-manager/home.nix'
source /nix/store/rjrc4zzpjn9viahdjikggpqa6436jnwq-zsh-syntax-highlighting-0.8.0/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS+=()



eval "$(/nix/store/lgq3wvj0rnds3nmisx0x4s622sgj42vg-zoxide-0.9.8/bin/zoxide init zsh )"
