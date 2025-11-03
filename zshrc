
source ~/.zsh/frameworks/antidote.zsh

# ================
# load auto complete
# =================
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# eval "$(starship init zsh)"

# load .zsh
for file in ~/.zsh/*.zsh; do
  source "$file"
done
for file in ~/.zsh/plugins/*.zsh; do
  source "$file"



