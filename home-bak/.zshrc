# zmodload zsh/zprof
# PATH SETUP (machine-specific)
# ============================================
export PATH="/Library/TeX/texbin:$PATH"
# export PATH="$HOME/scripts/bin:$PATH"
export PATH="$HOME/Library/Python/3.13/bin:$PATH"
export PNPM_HOME="${PNPM_HOME:-$HOME/.local/share/pnpm}"
export PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:$PATH"
# export PATH="$HOME/.local/bin:$PATH"
# export PATH="$HOME/.local/share/uv/python:$PATH"
# export PATH="$PATH:/Applications/PyCharm.app/Contents/MacOS"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:/Applications/LibreOffice.app/Contents/Macos"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
# LOAD ZSH CONFIG
source ~/.zsh/zshrc
# source ~/Shells/main/zshrc
# source ~/Shells/zi/zshrc
# CLEANUP
typeset -U path
export PATH
