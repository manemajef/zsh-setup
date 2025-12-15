eval "$(zoxide init zsh)"
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# eval "$(pyenv init -)"
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init - zsh)"
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init - zsh)"
# fi
