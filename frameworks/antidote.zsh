
# --- ANTIDOTE (plugin manager) ------------------------------------------------

# Antidote handles loading plugins and completions
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
# Silence OMZ git.zsh zstyle output
zstyle ':omz:alpha:lib:git' async-prompt no

# Auto-regenerate plugins if .zsh_plugins.txt is newer than .zsh_plugins.zsh
zsh_plugins_txt="${ZDOTDIR:-$HOME}/.zsh_plugins.txt"
zsh_plugins_zsh="${ZDOTDIR:-$HOME}/.zsh_plugins.zsh"

if [[ ! -e "$zsh_plugins_zsh" || "$zsh_plugins_txt" -nt "$zsh_plugins_zsh" ]]; then
  echo "Regenerating antidote plugins..."
  antidote bundle <"$zsh_plugins_txt" >"$zsh_plugins_zsh"
fi

# Load plugins (static mode for speed)
source "$zsh_plugins_zsh"

# --- Optimized compinit with daily caching ---
# Only rebuild completion cache once per day for faster startup
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
