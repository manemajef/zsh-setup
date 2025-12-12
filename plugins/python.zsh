# active=false
# has_venv=false
# python_venv() {
#   local myvenv="./.venv"
#
#   if [[ -d "$myvenv" ]]; then
#     if [[ "$has_venv" = false || "$VIRTUAL_ENV" != "$(realpath "$myvenv")" ]]; then
#       source "$myvenv/bin/activate" > /dev/null 2>&1
#       has_venv=true
#     fi
#   else
#     if [[ "$has_venv" = true ]]; then
#       deactivate > /dev/null 2>&1 || true
#       has_venv=false
#     fi
#   fi
# }
# if (( active )); then
#   autoload -U add-zsh-hook
#   add-zsh-hook chpwd python_venv
#   python_venv
# fi
#
