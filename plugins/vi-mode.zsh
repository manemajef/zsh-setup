function zle-keymap-select {
  case $KEYMAP in
    vicmd)     printf "\e[1 q" ;;  # block cursor in NORMAL mode
    viins)     printf "\e[5 q" ;;  # bar cursor in INSERT mode
    main)      printf "\e[5 q" ;;  # bar cursor for prompts
  esac
}

function zle-line-init {
  printf "\e[5 q"  # bar cursor for insert mode
}

# Make zsh use this hook
zle -N zle-keymap-select

# Also set the cursor once at shell startup
printf "\e[5 q"
zle -N zle-line-init
