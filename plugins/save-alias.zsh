adal () {
  local name="$1"
  local cmd="$2"
  local file="$HOME/.zsh/aliases.zsh"

  if [[ -z "$name" || -z "$cmd" ]]; then
    echo "Usage: add_alias <aliasName> \"command\""
    return 1
  fi

  echo "alias $name=\"$cmd\"" >> "$file"
  echo "✅ Added: alias $name=\"$cmd\" to $file"
}
