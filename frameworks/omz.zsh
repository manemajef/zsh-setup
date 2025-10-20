# --- Oh My Zsh core setup ---
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"
ZSH_THEME="robbyrussell"

# --- Plugins ---
plugins=(
  git
  fzf
  zoxide
  python
  web-search
  vscode
  zsh-autosuggestions
  history-substring-search
  zsh-syntax-highlighting  # must be last
)

# --- Load Oh My Zsh ---
source $ZSH/oh-my-zsh.sh

# --- History substring search keybindings ---
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
