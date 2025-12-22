
export PNPM_HOME="/Users/rotemsemah/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
path_list=(

  # "$HOME/.pyenv/shims"
  "$HOME/.local/bin"
  "/opt/homebrew/bin"
  "/opt/homebrew/sbin"
  "$HOME/.cargo/bin"
  "/Library/TeX/texbin"
  "/Applications/PyCharm.app/Contents/MacOS",
  "/Users/rotemsemah/.antigravity/antigravity"

)

costum_path=$(IFS=:; echo "${path_list[*]}")
PATH="$costum_path:$PATH"
typeset -U path
export PATH
