# --- Disable fzf-tab for any completion that involves files/paths ---
zstyle ':fzf-tab:complete:_files:*' use-fzf no
zstyle ':fzf-tab:complete:_path_files:*' use-fzf no
zstyle ':fzf-tab:complete:*:filename:*' use-fzf no

# Explicitly disable fzf-tab for common file commands
for cmd in cd ls mv cp rm mkdir rmdir chmod chown ln cat code nano nvim vim less more open; do
  zstyle ":fzf-tab:complete:$cmd:*" use-fzf no
done

# Nice menu for normal file/path completion
zstyle ':completion:*' menu select
