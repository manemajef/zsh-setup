# PLUGIN FRAMEWORK
source ~/.zsh/antidote/antidote.zsh

# fpath=("$HOME/.local/share/zsh/completions" $fpath)
autoload -Uz compinit

# ======= comment out for safer compoinit========
# if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
#   zsh-defer compinit
# else
#   zsh-defer compinit -C
# fi

# ========= uncomment for safer cominitn =========

if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
# starship
eval "$(starship init zsh)"
zsh-defer eval "$(zoxide init zsh)"
# LOAD CUSTOM CONFIGS
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/secret.zsh ]] && source ~/.zsh/secret.zsh

# Plugin-specific configs (auto-loaded)

for file in ~/.zsh/plugins/*.zsh; do
  [[ -f "$file" ]] && source "$file"
done
