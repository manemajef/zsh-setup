# --- Completion Styling ---
# Enable menu selection for tab completion
zstyle ':completion:*' menu select

# Highlight selected item in completion menu
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Group and format completion results
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# Enable interactive menu with arrow keys
zmodload zsh/complist
bindkey -M menuselect '^[[Z' reverse-menu-complete  # Shift+Tab to go backwards