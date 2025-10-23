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
# bindkey -M menuselect '^[[Z' reverse-menu-complete  # Shift+Tab to go backwards

# show dotfiles
# setopt globdots

#show desctiprions for options
zstyle ':completion:*' verbose yes

#sort by mtime desc
zstyle ':completion:*' file-sort modification

# only show dirs when cd
zstyle ':completion:*:cd:*' tag-order local-directories path-directories

# Fuzzy matching (allows typos)
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Accept highlighted dir and immediately dive into its children
# Right arrow: accept highlighted dir and dive into it
function _menu-select-accept-dir() {
  emulate -L zsh
  setopt localoptions noshwordsplit

  zle .accept-and-hold || return    # insert current selection

  local -a words=(${(z)LBUFFER})
  local raw=${words[-1]-}
  local target=${(Q)raw}

  [[ -d $target ]] || { zle redisplay; return }

  [[ $LBUFFER[-1] == "/" ]] || LBUFFER+="/"
  zle -K main                       # leave menuselect so we can call completion
  zle complete-word                 # immediately offer children
}
zle -N _menu-select-accept-dir
# bindkey -M menuselect '^[[C' _menu-select-accept-dir
