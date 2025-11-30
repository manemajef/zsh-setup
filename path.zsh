path_list=(

  "$HOME/.pyenv/shims"
  "$HOME/.local/bin"
  "/opt/homebrew/bin"
  "/opt/homebrew/sbin"
  "$HOME/.cargo/bin"
  "/Library/TeX/texbin"
  "/Applications/PyCharm.app/Contents/MacOS"
)

costum_path=$(IFS=:; echo "${path_list[*]}")
PATH="$costum_path:$PATH"
typeset -U path
export PATH
