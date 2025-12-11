# Set cursor to bar (insert mode) for interactive shells
[[ -o INTERACTIVE ]] && printf '\e[5 q'

local lib_dir="$HOME/.zsh/lib"


for f in "$lib_dir"/*.zsh; do
  [[ -f "$f" ]] && source "$f"
done

for f in "$HOME/.zsh/utils/"*.zsh; do
  source "$f"
done


local DEFAULT_FRAMEWORK="antidote"
local FRAMEWORK_NAME="${FRAMEWORK:-$DEFAULT_FRAMEWORK}"
local f_script="$HOME/.zsh/frameworks/${FRAMEWORK_NAME}/${FRAMEWORK_NAME}.zsh"

if [[ -f "$f_script" ]]; then
  source "$f_script"
else
  source "$HOME/.zsh/frameworks/${DEFAULT_FRAMEWORK}/${DEFAULT_FRAMEWORK}.zsh"
fi
unset DEFAULT_FRAMEWORK FRAMEWORK_NAME f_script

