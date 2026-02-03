zstyle ':antidote:bundle' use-friendly-names 'yes'
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
# Antidote handles loading plugins and completions
# source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh

alias cd='z'

# Auto-regenerate plugins if .zsh_plugins.txt is newer than .zsh_plugins.zsh
zsh_plugins_txt="$HOME/.zsh/antidote/plugins.txt"
zsh_plugins_zsh="$HOME/.zsh/antidote/plugins.zsh"


if [[ ! -e "$zsh_plugins_zsh" || "$zsh_plugins_txt" -nt "$zsh_plugins_zsh" ]]; then
  echo "Regenerating antidote plugins..."
  antidote bundle <"$zsh_plugins_txt" >"$zsh_plugins_zsh"
fi

zstyle ':antidote:bundle' use-friendly-names 'yes'
ANTIDOTE_TIMING=1
# eval "$(starship init zsh)"
source "$zsh_plugins_zsh"

# [[ -f ~/.zsh/eval.zsh ]] && zsh-defer source ~/.zsh/eval.zsh
# Plugin-specific configs (auto-loaded)

# zsh-defer eval "$(_MARIMO_COMPLETE=zsh_source marimo)"
# for file in ~/.zsh/antidote/config/*.zsh; do
#   [[ -f "$file" ]] && zsh-defer source "$file"
# done
