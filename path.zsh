path_list=(
#   "$HOME/.pyenv/shims"
  "/opt/homebrew/bin"
  "/opt/homebrew/sbin"
  "$HOME/.local/bin"
  "$HOME/.cargo/bin"
  "/Library/TeX/texbin"
)

costum_path=$(IFS=:; echo "${path_list[*]}")
PATH="$costum_path:$PATH"
typeset -U path
export PATH
