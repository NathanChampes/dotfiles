#!/usr/bin/env bash
PLUGIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main() {
  get-tmux-option() {
    local option value default
    option="$1"
    default="$2"
    value="$(tmux show-option -gqv "$option")"

    if [ -n "$value" ]; then
      echo "$value"
    else
      echo "$default"
    fi
  }

  set() {
    local option=$1
    local value=$2
    tmux set-option -gq "$option" "$value"
  }

  setw() {
    local option=$1
    local value=$2
    tmux set-window-option -gq "$option" "$value"
  }

  local theme
  theme="$(get-tmux-option "@everforest_theme" "dark-medium")"

  # NOTE: Pulling in the selected theme by the theme that's being set as local
  # variables.
  sed -E 's/^(.+=)/local \1/' \
      > "${PLUGIN_DIR}/everforest-selected-theme.tmuxtheme" \
      < "${PLUGIN_DIR}/everforest-${theme}.tmuxtheme"

  source "${PLUGIN_DIR}/everforest-selected-theme.tmuxtheme"

  # status
  set status "on"
  set status-bg "default"
  set status-justify "left"
  set status-left-length "100"
  set status-right-length "100"

  # messages
  set message-style "fg=${thm_aqua},bg=default,align=centre"
  set message-command-style "fg=${thm_aqua},bg=default,align=centre"

  # panes
  set pane-border-style "fg=${thm_bg2}"
  set pane-active-border-style "fg=${thm_blue}"

  # windows
  setw window-status-activity-style "fg=${thm_fg},bg=default,none"
  setw window-status-separator ""
  setw window-status-style "fg=${thm_fg},bg=default,none"

  # --------=== Statusline

  # NOTE: Checking for the value of @everforest_window_tabs_enabled
  wt_enabled="$(get-tmux-option "@everforest_window_tabs_enabled" "off")"
  readonly wt_enabled

  # These variables are the defaults so that the setw and set calls are easier to parse.
  readonly show_directory="#[fg=$thm_purple,bg=$thm_bg0,nobold,nounderscore,noitalics]#[fg=$thm_bg0,bg=$thm_purple,nobold,nounderscore,noitalics]  #[fg=$thm_fg,bg=$thm_bg2] #{b:pane_current_path} #{?client_prefix,#[fg=$thm_red]"
  readonly show_window="#[fg=$thm_purple,bg=$thm_bg0,nobold,nounderscore,noitalics]#[fg=$thm_bg0,bg=$thm_purple,nobold,nounderscore,noitalics] #[fg=$thm_fg,bg=$thm_bg2] #W #{?client_prefix,#[fg=$thm_red]"
  readonly show_session="#[fg=$thm_green]}#[bg=$thm_bg2]#{?client_prefix,#[bg=$thm_red],#[bg=$thm_green]}#[fg=$thm_bg0] #[fg=$thm_fg,bg=$thm_bg2] #S "
  readonly show_directory_in_window_status="#[fg=$thm_bg0,bg=$thm_blue] #I #[fg=$thm_fg,bg=$thm_bg2] #{b:pane_current_path} "
  readonly show_directory_in_window_status_current="#[fg=$thm_bg0,bg=$thm_orange] #I #[fg=$thm_fg,bg=$thm_bg0] #{b:pane_current_path} "
  readonly show_window_in_window_status="#[fg=$thm_fg,bg=$thm_bg0] #W #[fg=$thm_bg0,bg=$thm_blue] #I#[fg=$thm_blue,bg=$thm_bg0]#[fg=$thm_fg,bg=$thm_bg0,nobold,nounderscore,noitalics] "
  readonly show_window_in_window_status_current="#[fg=$thm_fg,bg=$thm_bg2] #W #[fg=$thm_bg0,bg=$thm_orange] #I#[fg=$thm_orange,bg=$thm_bg0]#[fg=$thm_fg,bg=$thm_bg0,nobold,nounderscore,noitalics] "

  # Right column 1 by default shows the Window name.
  local right_column1=$show_window

  # Right column 2 by default shows the current Session name.
  local right_column2=$show_session

  # Window status by default shows the current directory basename.
  local window_status_format=$show_directory_in_window_status
  local window_status_current_format=$show_directory_in_window_status_current

  # NOTE: With the @everforest_window_tabs_enabled set to on, we're going to
  # update the right_column1 and the window_status_* variables.
  if [[ "${wt_enabled}" == "on" ]]
  then
    right_column1=$show_directory
    window_status_format=$show_window_in_window_status
    window_status_current_format=$show_window_in_window_status_current
  fi

  set status-left ""

  set status-right "${right_column1},${right_column2}"

  setw window-status-format "${window_status_format}"
  setw window-status-current-format "${window_status_current_format}"

  # --------=== Modes
  #
  setw clock-mode-colour "${thm_blue}"
  setw mode-style "fg=${thm_purple} bg=${thm_bg3} bold"
}

main "$@"
