# source ~/.zsh/omz/omz.zsh
# FRAMEWORK="zinit"
# FRAMEWORK="omz"
FRAMEWORK="antidote"


source "$HOME/.zsh/$FRAMEWORK/$FRAMEWORK.zsh"

# source ~/.zsh/antidote/antidote.zsh

# Set cursor to bar (insert mode) immediately before anything else loads
[[ -o INTERACTIVE ]] && printf '\e[5 q'

# general settings

# autoload -Uz compinit
export KEYTIMEOUT=1
export EDITOR="nvim"
export VISUAL="nvim"
# setopt always_last_prompt
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
[[ -f ~/.zsh/eval.zsh ]] && source ~/.zsh/eval.zsh

# [[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
# [[ -f ~/.zsh/secret.zsh ]] && source ~/.zsh/secret.zsh
# Force inline ephemeral menu for all completions
# zstyle ':completion:*' menu yes select
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# setopt always_last_prompt
# eval "$(starship init zsh)"
