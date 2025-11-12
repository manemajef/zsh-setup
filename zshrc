# PLUGIN FRAMEWORK

zstyle ':antidote:bundle' use-friendly-names 'yes'

source ~/.zsh/antidote/antidote.zsh

autoload -U promptinit; promptinit
prompt pure

# fpath=("$HOME/.local/share/zsh/completions" $fpath)
autoload -Uz compinit

# ======= comment out for safer compoinit========
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  zsh-defer compinit
else
  zsh-defer compinit -C
fi


# ========= uncomment for safer cominitn =========

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

for file in ~/.zsh/plugins/*.zsh; do
  [[ -f "$file" ]] && zsh-defer source "$file"
done
