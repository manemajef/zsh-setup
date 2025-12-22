# blinkon cursor on interactive shells
[[ -o INTERACTIVE ]] && printf '\e[5 q'

# general settings
export KEYTIMEOUT=1
export EDITOR="nvim"
export VISUAL="nvim"

# Autoload functions
fpath=($HOME/.zsh/functions $fpath)
autoload -Uz $HOME/.zsh/functions/*(:t)

# source files
files=(
  "$HOME/.zsh/path.zsh"
  "$HOME/.zsh/aliases.zsh"
  "$HOME/.zsh/secret.zsh"
  "$HOME/.zsh/eval.zsh"
)

for f in "${files[@]}"; do
  [[ -f "$f" ]] && source "$f"
done

for f in "$HOME/.zsh/plugins"/*.zsh; do
  [[ -f "$f" ]] && source "$f"
done 

# Dynamic Framework picker
local DEFAULT_FRAMEWORK="antidote"
local FRAMEWORK_NAME="${FRAMEWORK:-$DEFAULT_FRAMEWORK}"
local f_script="$HOME/.zsh/${FRAMEWORK_NAME}/${FRAMEWORK_NAME}.zsh"

if [[ -f "$f_script" ]]; then
  source "$f_script"
else
  source "$HOME/.zsh/${DEFAULT_FRAMEWORK}/${DEFAULT_FRAMEWORK}.zsh"
fi
unset DEFAULT_FRAMEWORK FRAMEWORK_NAME f_script

## Add more stuff here

setopt extendedglob
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ENV_HINTS=1


