
# --- Completion Styling ---
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' group-name ''
# zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'
# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
# Enable interactive menu with arrow keys
zmodload zsh/complist
# bindkey -M menuselect '^[[Z' reverse-menu-complete  # Shift+Tab to go backwards
#show desctiprions for options
zstyle ':completion:*' verbose yes
#sort by mtime desc
zstyle ':completion:*' file-sort modification
# only show dirs when cd
zstyle ':completion:*:cd:*' tag-order local-directories path-directories

# Fuzzy matching (allows typos)
# zstyle ':completion:*' completer _complete _match _approximate
# zstyle ':completion:*:match:*' original only
# zstyle ':completion:*:approximate:*' max-errors 1 numeric
