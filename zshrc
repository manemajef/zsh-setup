
# ============================================
# PLUGIN FRAMEWORK
# ============================================
source ~/.zsh/antidote/antidote.zsh

# ============================================
# COMPLETION SYSTEM
# ============================================
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

eval "$(starship init zsh)"
# ============================================
# LOAD CUSTOM CONFIGS
# ============================================

# Core configs (explicit - visible in root)
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/secret.zsh ]] && source ~/.zsh/secret.zsh

# Plugin-specific configs (auto-loaded)
for file in ~/.zsh/plugins/*.zsh; do
  [[ -f "$file" ]] && source "$file"
done
