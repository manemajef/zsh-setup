# Silence OMZ git.zsh zstyle output (must be set BEFORE loading plugins)
# zstyle ':omz:alpha:lib:git' async-prompt no
# Antidote handles loading plugins and completions
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh

# Auto-regenerate plugins if .zsh_plugins.txt is newer than .zsh_plugins.zsh
zsh_plugins_txt="$HOME/.zsh/antidote/plugins.txt"
zsh_plugins_zsh="$HOME/.zsh/antidote/plugins.zsh"

if [[ ! -e "$zsh_plugins_zsh" || "$zsh_plugins_txt" -nt "$zsh_plugins_zsh" ]]; then
  echo "Regenerating antidote plugins..."
  antidote bundle <"$zsh_plugins_txt" >"$zsh_plugins_zsh"
fi

# Load plugins (static mode for speed)
source "$zsh_plugins_zsh"

# --- Optimized compinit with daily caching ---
# Only rebuild completion cache once per day for faster startup
export DIRHISTORY_ALT_BINDINGS=true
export DIRHISTORY_BIND_ARROW_KEYS=false
# clear the arrow keys
# bindkey -r '^[[A'
# bindkey -r '^[[B'
# --- History Substring Search Key Bindings ---
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
