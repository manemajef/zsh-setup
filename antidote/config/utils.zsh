
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


crun() {
  # Usage: crun file.c
  # Example: crun src/main.c   → compiles to ./out/main and runs it

  local src="$1"
  if [[ -z "$src" ]]; then
    echo "Usage: crun <source.c>"
    return 1
  fi

  if ! [[ -f "$src" ]]; then
    echo "Error: '$src' not found"
    return 1
  fi

  # Extract filename without extension
  local name="${src##*/}"          # remove path → main.c
  name="${name%.*}"                # remove .c → main

  # Define output path
  local out_dir="./out"
  local out_path="$out_dir/$name"

  # Ensure ./out exists
  mkdir -p "$out_dir"

  echo "🔧 Compiling $src → $out_path"
  gcc "$src" -o "$out_path" || { echo "❌ Compilation failed"; return 1; }

  echo "▶️  Running $out_path"
  "$out_path"
}


pg() {
  case "$1" in
    start)
      brew services start postgresql@14
      ;;
    stop)
      brew services stop postgresql@14
      ;;
    status)
      if brew services list | grep -q "postgresql@14.*started"; then
        echo "✅ running"
      else
        echo "❌ not running"
      fi
      ;;
    *)
      echo "Usage: pg {start|stop|status}"
      ;;
  esac
}
