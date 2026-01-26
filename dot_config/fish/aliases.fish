# clear the screen
alias erase 'printf "\ec\e[3J"'

# power management
alias off 'systemctl poweroff'
alias reb 'systemctl reboot'

# eza
alias ls 'eza --color=always --icons=auto --group-directories-first'
alias ll 'ls --long'
alias la 'ls --all'
alias tree 'eza --tree --git-ignore --color=always --icons=auto'
alias tree4 'tree --level=4'

# bat
alias cat 'bat --paging=never'

# gomi
alias rm 'gomi'

# chezmoi
alias cm 'chezmoi'

# fastfetch
alias ff 'fastfetch'
alias fa 'gum spin --spinner minidot --title "Rendering system logo and fetching info..." -- kitten icat -n --place 30x30@0x3 --scale-up --align left ~/.logos/nixos/animation-60fps.gif | fastfetch --logo-width 30 --raw -'

# home-manager
alias build 'nixos-rebuild switch --sudo --flake ~/.config/home-manager/'
