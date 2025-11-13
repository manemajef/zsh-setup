fpath+=( "$HOME/Library/Caches/antidote/romkatv/zsh-defer" )
source "$HOME/Library/Caches/antidote/romkatv/zsh-defer/zsh-defer.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/sindresorhus/pure" )
fpath+=( "$HOME/Library/Caches/antidote/mattmc3/zephyr/plugins/color" )
source "$HOME/Library/Caches/antidote/mattmc3/zephyr/plugins/color/color.plugin.zsh"
if ! (( $+functions[zsh-defer] )); then
  fpath+=( "$HOME/Library/Caches/antidote/romkatv/zsh-defer" )
  source "$HOME/Library/Caches/antidote/romkatv/zsh-defer/zsh-defer.plugin.zsh"
fi
fpath+=( "$HOME/Library/Caches/antidote/mattmc3/zephyr/plugins/completion" )
zsh-defer source "$HOME/Library/Caches/antidote/mattmc3/zephyr/plugins/completion/completion.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/mattmc3/zephyr/plugins/compstyle" )
zsh-defer source "$HOME/Library/Caches/antidote/mattmc3/zephyr/plugins/compstyle/compstyle.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/mattmc3/zephyr/plugins/directory" )
zsh-defer source "$HOME/Library/Caches/antidote/mattmc3/zephyr/plugins/directory/directory.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/softmoth/zsh-vim-mode" )
zsh-defer source "$HOME/Library/Caches/antidote/softmoth/zsh-vim-mode/zsh-vim-mode.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/ohmyzsh/ohmyzsh/plugins/git" )
zsh-defer source "$HOME/Library/Caches/antidote/ohmyzsh/ohmyzsh/plugins/git/git.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/MichaelAquilina/zsh-you-should-use" )
zsh-defer source "$HOME/Library/Caches/antidote/MichaelAquilina/zsh-you-should-use/zsh-you-should-use.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/belak/zsh-utils/utility" )
zsh-defer source "$HOME/Library/Caches/antidote/belak/zsh-utils/utility/utility.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/zsh-users/zsh-syntax-highlighting" )
zsh-defer source "$HOME/Library/Caches/antidote/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/zsh-users/zsh-autosuggestions" )
zsh-defer source "$HOME/Library/Caches/antidote/zsh-users/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
fpath+=( "$HOME/Library/Caches/antidote/zsh-users/zsh-history-substring-search" )
zsh-defer source "$HOME/Library/Caches/antidote/zsh-users/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh"
