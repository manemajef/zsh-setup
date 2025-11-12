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

# fix cursor for vi mode
# function zvm_after_init() {
#   ZVM_CURSOR_STYLE_ENABLED=true
#   ZVM_VI_INSERT_CURSOR="\e[5 q"
#   ZVM_VI_COMMAND_CURSOR="\e[1 q"
# }
# zsh-defer zvm_after_init
