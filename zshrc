# PLUGIN FRAMEWORK
# fpath+=("/opt/homebrew/share/zsh/site-functions")
zstyle ':antidote:bundle' use-friendly-names 'yes'
source ~/.zsh/antidote/antidote.zsh
# if [[ $- == *i* ]]; then
#   autoload -Uz promptinit
#   promptinit
#   prompt pure
# fi
# Load Pure when running inside a real terminal (includes LazyVim)
# if [[ -t 1 ]]; then
#   autoload -Uz promptinit
#   promptinit
#   prompt pure
# fi
autoload -Uz promptinit
promptinit
prompt pure

# autoload -U promptinit; promptinit
# prompt pure

# fpath=("$HOME/.local/share/zsh/completions" $fpath)
autoload -Uz compinit
# source "$HOME/.zsh/plugins/vi-mode.zsh"

# ======= comment out for safer compoinit========
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  zsh-defer compinit
else
  zsh-defer compinit -C
fi

if [[ $- == *i* ]]; then
  printf "\e[5 q"  # force insert-mode bar until plugin loads
fi
# use vim mode
# bindkey -v
# export KEYTIMEOUT=1
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
export KEYTIMEOUT=1

for file in ~/.zsh/plugins/*.zsh; do
  [[ -f "$file" ]] && zsh-defer source "$file"
done
