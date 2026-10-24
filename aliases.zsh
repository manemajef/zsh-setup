# alias python="python3"
# alias pip="pip3"
alias charm="open -a PyCharm"
# Zoxide interactive jumpers
alias ls="eza"
alias j="zoxide query -i"
alias zi='cd "$(zoxide query -i)"'
alias cdi='zoxide query --interactive'
alias nvconf='cd ~/.config/nvim && nvim'
alias vim="nvim"
alias zconf="cd && nvim ~/.zshrc"
alias vzsh="cd ~/.zsh && nvim"
alias desk='~/Desktop'
alias dcs='cd ~/Documents'
alias dws='cd ~/Downloads'
alias ghstconf='cd ~/Library/Application\ Support/com.mitchellh.ghostty && nvim config'
# alias moodle='~/Scripts/moodle/.venv/bin/python3 ~/Scripts/moodle/main.py'
# alias tau='~/Scripts/moodle/.venv/bin/python3 ~/Scripts/moodle/main.py tau'
# alias semester='open ~/obsidian/TAU'
hash -d icloud="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
hash -d vault="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents"
alias aspace='df -h / | tail -1 | awk "{print \$4}"'
alias soffice-convert='soffice --headless --convert-to'
alias clean-cache='sudo rm -rf /private/var/folders/*/*/X/*.code_sign_clone'
alias ltree='lsd --tree'
alias TRASH="~/Library/Mobile\ Documents/.Trash"
alias mtau='python ~/Scripts/mv-tau/main.py'
# alias zsh-bench='~/Scripts/zsh-bench/zsh-bench'
# alias cd='z'
alias zprof='ZSH_PROFILE=1 zsh -l'

# vims
alias lazyvim='NVIM_APPNAME=lazyvim nvim'
alias rawvim='NVIM_APPNAME=rawvim nvim'
alias kickvim='NVIM_APPNAME=kickvim nvim'

alias r='radian'
export ipaddr="192.168.1.117"
alias kill-marimo='pkill -f marimo._ipc.launch_kernel'
alias cldr='claude --dangerously-skip-permissions'
alias tmptex='cat ~/admin/templates/he.tex | pbcopy'
alias gmdev='gco main && g merge dev && gco dev'
alias cptex="cat ~/admin/templates/he-header.tex | pbcopy"
alias texify="~/scripts/md2tex/run-md2tex"
alias skim="open -a Skim"
alias m2typ="pbpaste | pandoc -f markdown -t typst | pbcopy"
alias m2tex="pbpaste | pandoc -f markdown -t latex | pbcopy"
alias md2dx="pbpaste | pandoc -f markdown -t docx | pbcopy"

alias p2v='ffmpeg -framerate 24 -pattern_type glob -i "*.png" -pix_fmt yuv420p out.mp4'
alias rp2v='ffmpeg -framerate 24 -pattern_type glob -i "*.png" -vf "reverse" -pix_fmt yuv420p reversed.mp4'
alias appmem='ps -Ao rss,args | grep -E "\\.app/" | sed
  "s|.*/\([^/]*\.app\)/.*|\1|" | awk "{mem[\$2]+=\$1} END {for(a in mem) printf
  \"%7.0f MB  %s\n\", mem[a]/1024, a}" | sort -rn | head -20'
alias plug-sync="rm ~/obsidian/plugin-sync/.obsidian/plugins/explorer/* && cp ~/projects/explorer/main.* ~/projects/explorer/styles.css ~/projects/explorer/data.json ~/projects/explorer/manifest.json ~/obsidian/plugin-sync/.obsidian/plugins/explorer/ && echo 'Done'"
alias gcam="git commit --amend --no-edit"
# alias code="cursor"
alias kill-marimo="pkill -f 'marimo\._ipc\.launch_kernel'"
alias rm-blur="defaults write -g MPV8 -bool false"
alias add-blur="defaults delete -g MPV8"
