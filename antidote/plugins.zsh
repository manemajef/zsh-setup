fpath+=( "$HOME/.zsh/antidote/.antidote-plugins/mattmc3/ez-compinit" )
source "$HOME/.zsh/antidote/.antidote-plugins/mattmc3/ez-compinit/ez-compinit.plugin.zsh"
fpath+=( "$HOME/.zsh/antidote/.antidote-plugins/sindresorhus/pure" )
source "$HOME/.zsh/antidote/.antidote-plugins/sindresorhus/pure/pure.plugin.zsh"
fpath+=( "$HOME/.zsh/antidote/.antidote-plugins/romkatv/zsh-defer" )
source "$HOME/.zsh/antidote/.antidote-plugins/romkatv/zsh-defer/zsh-defer.plugin.zsh"
export PATH="$HOME/.zsh/antidote/.antidote-plugins/romkatv/zsh-bench:$PATH"
if ! (( $+functions[zsh-defer] )); then
  fpath+=( "$HOME/.zsh/antidote/.antidote-plugins/romkatv/zsh-defer" )
  source "$HOME/.zsh/antidote/.antidote-plugins/romkatv/zsh-defer/zsh-defer.plugin.zsh"
fi
fpath+=( "$HOME/.zsh/antidote/.antidote-plugins/mattmc3/zephyr/plugins/completion" )
zsh-defer source "$HOME/.zsh/antidote/.antidote-plugins/mattmc3/zephyr/plugins/completion/completion.plugin.zsh"
fpath+=( "$HOME/.zsh/antidote/.antidote-plugins/mattmc3/zephyr/plugins/directory" )
zsh-defer source "$HOME/.zsh/antidote/.antidote-plugins/mattmc3/zephyr/plugins/directory/directory.plugin.zsh"
fpath+=( "$HOME/.zsh/antidote/.antidote-plugins/softmoth/zsh-vim-mode" )
zsh-defer source "$HOME/.zsh/antidote/.antidote-plugins/softmoth/zsh-vim-mode/zsh-vim-mode.plugin.zsh"
fpath+=( "$HOME/.zsh/antidote/.antidote-plugins/ohmyzsh/ohmyzsh/plugins/git" )
zsh-defer source "$HOME/.zsh/antidote/.antidote-plugins/ohmyzsh/ohmyzsh/plugins/git/git.plugin.zsh"
fpath+=( "$HOME/.zsh/antidote/.antidote-plugins/ohmyzsh/ohmyzsh/plugins/direnv" )
zsh-defer source "$HOME/.zsh/antidote/.antidote-plugins/ohmyzsh/ohmyzsh/plugins/direnv/direnv.plugin.zsh"
fpath+=( "$HOME/.zsh/antidote/.antidote-plugins/ohmyzsh/ohmyzsh/plugins/directory" )
zsh-defer source "$HOME/.zsh/antidote/.antidote-plugins/ohmyzsh/ohmyzsh/plugins/directory/directory.plugin.zsh"
fpath+=( "$HOME/.zsh/antidote/.antidote-plugins/MichaelAquilina/zsh-you-should-use" )
zsh-defer source "$HOME/.zsh/antidote/.antidote-plugins/MichaelAquilina/zsh-you-should-use/zsh-you-should-use.plugin.zsh"
fpath+=( "$HOME/.zsh/antidote/.antidote-plugins/belak/zsh-utils/utility" )
zsh-defer source "$HOME/.zsh/antidote/.antidote-plugins/belak/zsh-utils/utility/utility.plugin.zsh"
fpath+=( "$HOME/.zsh/antidote/.antidote-plugins/zsh-users/zsh-autosuggestions" )
zsh-defer source "$HOME/.zsh/antidote/.antidote-plugins/zsh-users/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
fpath+=( "$HOME/.zsh/antidote/.antidote-plugins/zsh-users/zsh-history-substring-search" )
zsh-defer source "$HOME/.zsh/antidote/.antidote-plugins/zsh-users/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh"
fpath+=( "$HOME/.zsh/antidote/.antidote-plugins/zdharma-continuum/fast-syntax-highlighting" )
zsh-defer source "$HOME/.zsh/antidote/.antidote-plugins/zdharma-continuum/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
