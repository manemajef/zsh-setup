fpath+=( "$HOME/Library/Caches/antidote/romkatv/zsh-defer" )
source "$HOME/Library/Caches/antidote/romkatv/zsh-defer/zsh-defer.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/zsh-users/zsh-completions/src" )
if ! (( $+functions[zsh-defer] )); then
  fpath+=( "$HOME/Library/Caches/antidote/romkatv/zsh-defer" )
  source "$HOME/Library/Caches/antidote/romkatv/zsh-defer/zsh-defer.plugin.zsh"
fi
fpath+=( "$HOME/Library/Caches/antidote/ohmyzsh/ohmyzsh/plugins/git" )
zsh-defer source "$HOME/Library/Caches/antidote/ohmyzsh/ohmyzsh/plugins/git/git.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/jeffreytse/zsh-vi-mode" )
source "$HOME/Library/Caches/antidote/jeffreytse/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/MichaelAquilina/zsh-you-should-use" )
zsh-defer source "$HOME/Library/Caches/antidote/MichaelAquilina/zsh-you-should-use/zsh-you-should-use.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/zdharma-continuum/fast-syntax-highlighting" )
zsh-defer source "$HOME/Library/Caches/antidote/zdharma-continuum/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/zsh-users/zsh-autosuggestions" )
zsh-defer source "$HOME/Library/Caches/antidote/zsh-users/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/zsh-users/zsh-history-substring-search" )
zsh-defer source "$HOME/Library/Caches/antidote/zsh-users/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh"
