# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install

eval "$(starship init zsh)"

export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"
export PGHOST="/var/run/postgresql"

HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=50000

setopt inc_append_history

# Amélioration de la complétion
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case insensitive completion

# Options de navigation améliorées
setopt AUTO_CD              # Taper un dossier = cd vers ce dossier
setopt AUTO_PUSHD          # cd push l'ancien dossier sur la stack
setopt PUSHD_IGNORE_DUPS   # Ignore les doublons dans la stack
setopt PUSHD_MINUS         # Inverse le signe +/- quand on navigue dans la stack

fpath=(${ASDF_DIR}/completions $fpath)
# autoload -Uz compinit && compinit

alias g='git'
alias v='nvim'
alias neovim="nvim"
alias dev="cd ~/projects"
alias py="source ~/virtualenvs/nvim-venv/bin/activate"
alias digidoc="cd ~/work/digidoc/devdigidoc/"

# Alias utiles supplémentaires
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
