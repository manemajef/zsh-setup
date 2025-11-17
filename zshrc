# PLUGIN FRAMEWORK

# printf '\e[5 q'
# .zshrc
# fpath+=($HOME/.zsh/pure)
# autoload -Uz promptinit
# promptinit
# prompt pure
zstyle ':antidote:bundle' use-friendly-names 'yes'

source ~/.zsh/antidote/antidote.zsh

# Set cursor to bar (insert mode) immediately before anything else loads

[[ -o INTERACTIVE ]] && printf '\e[5 q'

# fpath=("$HOME/.local/share/zsh/completions" $fpath)
autoload -Uz compinit
export KEYTIMEOUT=1
# starship
# eval "$(starship init zsh)"

# LOAD CUSTOM CONFIGS
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/secret.zsh ]] && source ~/.zsh/secret.zsh
[[ -f ~/.zsh/eval.zsh ]] && zsh-defer source ~/.zsh/eval.zsh
# Plugin-specific configs (auto-loaded)

for file in ~/.zsh/plugins/*.zsh; do
  [[ -f "$file" ]] && zsh-defer source "$file"
done
