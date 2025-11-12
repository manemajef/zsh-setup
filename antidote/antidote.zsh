# Antidote handles loading plugins and completions
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh

# Auto-regenerate plugins if .zsh_plugins.txt is newer than .zsh_plugins.zsh
zsh_plugins_txt="$HOME/.zsh/antidote/plugins.txt"
zsh_plugins_zsh="$HOME/.zsh/antidote/plugins.zsh"
# fpath=(/opt/homebrew/share/antidote/functions $fpath)
# autoload -Uz antidote

if [[ ! -e "$zsh_plugins_zsh" || "$zsh_plugins_txt" -nt "$zsh_plugins_zsh" ]]; then
  echo "Regenerating antidote plugins..."
  antidote bundle <"$zsh_plugins_txt" >"$zsh_plugins_zsh"
fi

zstyle ':antidote:bundle' use-friendly-names 'yes'
# Load plugins (static mode for speed)
source "$zsh_plugins_zsh"


# zsh-defer source "$HOME/.zsh/plugins/keybinds.zsh"

# ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BEAM
# ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_STEADY_BLOCK
# for cmd in glow rich bat; do
#   zstyle ":completion:*:*:${cmd}:*" tag-order files directories
#   zstyle ":completion:*:*:${cmd}:*" file-patterns '*(-/):directories' '*:all-files'
# done
