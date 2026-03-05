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

# zoxide
alias cd 'z'

# bat
alias cat 'bat --paging=never'

# gomi
alias rm 'gomi'

# chezmoi
alias cm 'chezmoi'

# fastfetch
alias ff 'fastfetch'

# NixOs
alias build 'nixos-rebuild switch --sudo --flake ~/.config/nixos/'
alias update 'nix flake update --flake ~/.config/nixos/ && nixos-rebuild switch --sudo --flake ~/.config/nixos/'

# lazygit
alias lg 'lazygit'
