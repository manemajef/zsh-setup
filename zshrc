# PLUGIN FRAMEWORK

# printf '\e[5 q'

zstyle ':antidote:bundle' use-friendly-names 'yes'

source ~/.zsh/antidote/antidote.zsh

# Set cursor to bar (insert mode) immediately before anything else loads

autoload -Uz promptinit
promptinit
prompt pure

[[ -o INTERACTIVE ]] && printf '\e[5 q'

# fpath=("$HOME/.local/share/zsh/completions" $fpath)
autoload -Uz compinit

# prompt_newline=$(echo -n "\u200B")

# if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
#   compinit
# else
#   compinit -C
# fi
# starship
# eval "$(starship init zsh)"
# LOAD CUSTOM CONFIGS
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/secret.zsh ]] && source ~/.zsh/secret.zsh
[[ -f ~/.zsh/eval.zsh ]] && zsh-defer source ~/.zsh/eval.zsh
# Plugin-specific configs (auto-loaded)
export KEYTIMEOUT=1

for file in ~/.zsh/plugins/*.zsh; do
  [[ -f "$file" ]] && zsh-defer source "$file"
done
