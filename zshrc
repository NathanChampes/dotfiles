setopt HIST_IGNORE_ALL_DUPS

bindkey -v

WORDCHARS=${WORDCHARS//[\/]}

ZSH_AUTOSUGGEST_MANUAL_REBIND=1

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)


ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init
fi
source ${ZIM_HOME}/init.zsh

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key

eval "$(starship init zsh)"

export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"
export PGHOST="/var/run/postgresql"

HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=50000

setopt inc_append_history

autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case insensitive completion

setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_MINUS

fpath=(${ASDF_DIR}/completions $fpath)

alias g='git'
alias v='nvim'
alias neovim="nvim"
alias dev="cd ~/projects"
alias py="source ~/virtualenvs/nvim-venv/bin/activate"
alias digidoc="cd ~/work/digidoc/devdigidoc/"

alias ll='ls -lah'
alias zshconfig='$EDITOR ~/.zshrc'
alias reload='source ~/.zshrc'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

PATH=~/.console-ninja/.bin:$PATHexport PATH="$HOME/.npm-global/bin:$PATH"
export PATH=$PATH:/usr/bin

# pnpm
export PNPM_HOME="/home/manchoy/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH="$HOME/.local/share/mise/shims:$PATH"

# ça c'est pour golang 
export GO111MODULE=on; 

# pour symfony 
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# je sais pas trop pourquoi faire

export QT_SCREEN_SCALE_FACTORS=1
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_QPA_PLATFORMTHEME=kde

DISCORD_USE_WAYLAND=1 

export PATH="$HOME/.emacs.d/bin:$PATH"
# ça c'est pour zoxide qui sert a faire une recherche en gros
eval "$(zoxide init zsh)"

# Pour emacs
alias emacs="emacsclient -t -a 'emacs'"

# Utilise zoxide pour se déplacer et ouvrir Vim
vz() {
    dir=$(zoxide query "$1") || return
    cd "$dir" && nvim
}

# Utilise zoxide pour se déplacer et ouvrir un fichier spécifique dans Vim
zv() {
    dir=$(zoxide query "$1") || return
    cd "$dir" && nvim .
}

# Amélioration de l'historique
setopt EXTENDED_HISTORY          # Ajoute le timestamp à l'historique
setopt HIST_EXPIRE_DUPS_FIRST   # Supprime les doublons en premier quand HISTFILE est plein
setopt SHARE_HISTORY            # Partage l'historique entre les sessions

# Complétion pour Docker si installé
if type docker > /dev/null; then
    zstyle ':completion:*:*:docker:*' option-stacking yes
    zstyle ':completion:*:*:docker-*:*' option-stacking yes
fi

# Complétion pour Kubernetes si installé
if type kubectl > /dev/null; then
    source <(kubectl completion zsh)
    alias k=kubectl
    complete -F __start_kubectl k
fi

alias sudonvim='sudo -E nvim'

alias servdev='sshfs -o password_stdin siteweb@193.70.90.72:/home/siteweb ~/projects/mnt/digidoc < ~/.sshfs_pass'

export PATH="$HOME/.cargo/bin:$PATH"

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
        list)
            echo "Configurations disponibles:"
            echo "  nvim, kitty, sway, tmux, waybar, wofi"
            ;;
        *)
            echo "Usage: dotfiles [config_name]"
            echo "Exécutez 'dotfiles list' pour voir les configurations disponibles"
            ;;
    esac
}

alias gitdotfiles='cd ~/projects/dotfiles/ && ./getAndCommit.sh'

alias tmx='~/script/tmux_session.sh'

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PATH="$HOME/.pyenv/bin:$PATH"

alias vim="nvim"
alias envDigidoc="~/script/sync_env.sh"
