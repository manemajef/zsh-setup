# set antidote
source ~/.zsh/antidote/antidote.zsh

# Set cursor to bar (insert mode) immediately before anything else loads
[[ -o INTERACTIVE ]] && printf '\e[5 q'

ZFUNCDIR=~/.zsh/functions
# general settings

# autoload -Uz compinit
export KEYTIMEOUT=1
export EDITOR="nvim"
export VISUAL="nvim"

# starship
# eval "$(starship init zsh)"

# LOAD CUSTOM CONFIGS
files=(
  "$HOME/.zsh/path.zsh"
  "$HOME/.zsh/aliases.zsh"
  "$HOME/.zsh/secret.zsh"
)

for f in "${files[@]}"; do
  [[ -f "$f" ]] && source "$f"
done
# [[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
# [[ -f ~/.zsh/secret.zsh ]] && source ~/.zsh/secret.zsh
[[ -f ~/.zsh/eval.zsh ]] && zsh-defer source ~/.zsh/eval.zsh
# Plugin-specific configs (auto-loaded)

for file in ~/.zsh/plugins/*.zsh; do
  [[ -f "$file" ]] && zsh-defer source "$file"
done
