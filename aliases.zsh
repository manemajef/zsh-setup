
alias python="python3"
alias pip="pip3"
alias charm="pycharm"
# Zoxide interactive jumpers
alias j="zoxide query -i"
alias zi='cd "$(zoxide query -i)"'
alias cdi='zoxide query --interactive'
alias cat='bat'
# alias z='zoxide'
# Neovim profiles
alias nvchad="NVIM_APPNAME=nvim.chad nvim"
alias asvim="NVIM_APPNAME=nvim.astro nvim"
alias lzvim="NVIM_APPNAME=nvim.lazy nvim"
alias lz="NVIM_APPNAME=nvim.lazy nvim"
alias kcvim="NVIM_APPNAME=nvim.kick nvim"
alias nvconf='cd ~/.config/nvim && nvim'
alias vim="nvim"
alias zconf="cd && nvim ~/.zshrc"
alias vzsh="cd ~/.zsh && nvim"
alias cdsk='cd ~/Desktop'
alias cdoc='cd ~/Documents'
alias ghstconf='cd ~/Library/Application\ Support/com.mitchellh.ghostty && nvim config'
alias moodle-desk='open ~/Scripts/open-moodle/dist/Moodle\ Desktop.app'
# alias moodle='cd ~/scripts/open-moodle && /.venv/bin/python3 -m app.main'
alias moodle='~/Scripts/open-moodle/.venv/bin/python3 ~/Scripts/open-moodle/main.py'
alias semester='open ~/obsidian/TAU'
hash -d icloud="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
hash -d vault="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents"
alias aspace='df -h / | tail -1 | awk "{print \$4}"'
alias soffice-convert='soffice --headless --convert-to'
