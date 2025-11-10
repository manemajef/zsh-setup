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


# HISTORY_SUBSTRING_SEARCH_PREFIXED=1
# HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='none'
# HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='none'
# bindkey '^[[A' history-substring-search-up      # Up arrow
# bindkey '^[[B' history-substring-search-down    # Down arrow
# bindkey '^[OA' history-substring-search-up      # Up arrow (application mode)
# bindkey '^[OB' history-substring-search-down    # Down arrow (application mode)

ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BEAM
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_STEADY_BLOCK
