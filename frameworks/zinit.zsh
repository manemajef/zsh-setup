
if [[ ! -f ~/.zinit/bin/zinit.zsh ]]; then
  mkdir -p ~/.zinit/bin
  git clone https://github.com/zdharma-continuum/zinit.git ~/.zinit/bin
fi
source ~/.zinit/bin/zinit.zsh 


# --- Zinit annexes ---
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# --- Optimized compinit with daily caching ---
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# --- Plugins (stable order) ---

#  FZF and completion
zinit light junegunn/fzf
zinit light Aloxaf/fzf-tab

# --- Disable fzf-tab popup for cd (keep normal OMZ-like behaviour) ---
zstyle ':fzf-tab:*' use-fzf-tab yes          # keep fzf-tab globally
zstyle ':fzf-tab:complete:cd:*' use-fzf-tab no  # disable popup for cd

#  Git helpers
zinit snippet OMZ::plugins/git/git.plugin.zsh

#  History substring search (main setup)
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

#  History behaviour tweaks
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
export HISTORY_SUBSTRING_SEARCH_FUZZY=1
export HISTORY_IGNORE_DUPS=1
export HISTORY_IGNORE_SPACE=1
export HIST_FIND_NO_DUPS=1
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE HIST_SAVE_NO_DUPS

#  Fallback to normal history search when line is empty
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

#  Utility
zinit light ajeetdsouza/zoxide

#  Must be last
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

#  Optional OMZ snippets
# zinit snippet OMZP::web-search
# zinit snippet OMZP::vscode
# zinit snippet OMZP::common-aliases

