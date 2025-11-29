path_list=(
  "$HOME/.local/bin"
  "$HOME/.pyenv/shims"
  "/opt/homebrew/bin"
  "/opt/homebrew/sbin"
  "$HOME/.cargo/bin"
  "/Library/TeX/texbin"
)

costum_path=$(IFS=:; echo "${path_list[*]}")
PATH="$costum_path:$PATH"
typeset -U path
export PATH
