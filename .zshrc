
# --- PATH SETUP
# zmodload zsh/zprof
# ---------------------------------------------------------------
export PATH="/Library/TeX/texbin:$PATH"
export PATH="$HOME/scripts:$PATH"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="$HOME/Library/Python/3.13/bin:$PATH"
export PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:$PATH"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
export PATH="$PATH:/Applications/PyCharm.app/Contents/MacOS"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:/Applications/LibreOffice.app/Contents/Macos"
# source "$HOME/.config/broot/launcher/bash/br"
export EDITOR="nvim"
export VISUAL="nvim"
# ZINIT
# source ~/.zsh/frameworks/zinit.zsh

# OMZ
# source ~/.zsh/frameworks/omz.zsh

# ANTIDOTE
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

# starship
# eval "$(starship init zsh)"

# =======================
# load .zsh
# =======================
for file in ~/.zsh/*.zsh; do
  # [[ "$file" == *"/frameworks/"* ]] && continue
  source "$file"
done


# ======================
# CLEANUP
# ======================

typeset -U path
export PATH

# zprof
export PATH="$HOME/Library/Python/3.13/bin:$PATH"
