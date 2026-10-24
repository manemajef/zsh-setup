# Eval Cache - Caches expensive init commands for faster startup

EVAL_CACHE_DIR="$HOME/.zsh/.cache"
[[ -d "$EVAL_CACHE_DIR" ]] || mkdir -p "$EVAL_CACHE_DIR"
_eval_cache() {
    local name="$1"
    local cmd="$2"
    local cache_file="$EVAL_CACHE_DIR/${name}.zsh"
    local binary="$commands[$name]"
    [[ -z "$binary" ]] && return
    if [[ ! -f "$cache_file" || "$binary" -nt "$cache_file" ]]; then
        eval "$cmd" > "$cache_file" 2>/dev/null
        zcompile "$cache_file" &>/dev/null &!
    fi
    source "$cache_file"
}

# Tool Initializations (cached)
_eval_cache zoxide "zoxide init zsh"

# Completion settings
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# eval "$(_MARIMO_COMPLETE=zsh_source marimo)"
