# blinkon cursor on interactive shells
[[ -o INTERACTIVE ]] && printf '\e[5 q'

# general settings
export KEYTIMEOUT=1
export EDITOR="nvim"
export VISUAL="nvim"
export TMPS_DIR="/Users/rotemsemah/admin/templates"

# Local functions + completions (flat layout)
# - functions: ~/.zsh/functions/<name>
# - completions: ~/.zsh/functions/_<name>
fpath=("$HOME/.zsh/functions" $fpath)
for fn in "$HOME/.zsh/functions"/*(N:t); do
  [[ "$fn" == _* ]] && continue
  autoload -Uz "$fn"
done

# source files
files=(
  "$HOME/.zsh/path.zsh"
  "$HOME/.zsh/aliases.zsh"
  "$HOME/.zsh/secret.zsh"
  "$HOME/.zsh/eval.zsh"
  "$HOME/.zsh/lib/secret.zsh"
)

for f in "${files[@]}"; do
  [[ -f "$f" ]] && source "$f"
done

for f in "$HOME/.zsh/plugins"/*.zsh; do
  [[ -f "$f" ]] && source "$f"
done

# Framework: antidote only
source "$HOME/.zsh/antidote/antidote.zsh"

## Add more stuff here

setopt extendedglob
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ENV_HINTS=1
