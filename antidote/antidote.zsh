# Enable fast compinit caching (only rebuild every 20 hours)
zstyle ':plugin:ez-compinit' 'use-cache' yes

# Store plugins outside cache so they survive cache cleaning
export ANTIDOTE_HOME="$HOME/.zsh/antidote/.antidote-plugins"

zstyle ':antidote:bundle' use-friendly-names 'yes'
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh

alias cd='z'

# Auto-regenerate plugins if plugins.txt is newer than plugins.zsh
zsh_plugins_txt="$HOME/.zsh/antidote/plugins.txt"
zsh_plugins_zsh="$HOME/.zsh/antidote/plugins.zsh"

if [[ ! -e "$zsh_plugins_zsh" || "$zsh_plugins_txt" -nt "$zsh_plugins_zsh" ]]; then
  echo "Regenerating antidote plugins..."
  antidote bundle <"$zsh_plugins_txt" >"$zsh_plugins_zsh"
fi

source "$zsh_plugins_zsh"
