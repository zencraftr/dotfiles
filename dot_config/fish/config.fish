# Disable greeting
set fish_greeting

# Set Neovim as default editor
set -Ux EDITOR nvim
set -Ux VISUAL nvim

# Theme
set -Ux fish_color_scheme "Catppuccin Mocha"

# Zoxide
zoxide init fish | source

# Alisases
source ~/.config/fish/aliases.fish

# Starship
if type -q starship
    source ~/.config/fish/starship.fish
end

# Nix variables
if test -e $HOME/.nix-profile/bin/home-manager;
    bash $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
end

# Conda
source ~/.config/fish/conda.fish
source ~/.config/fish/gum.fish

# Tmux
# if status is-interactive
# and not set -q TMUX
#   exec tmux
# end

# Auto-start tmux
if status is-interactive
    and not set -q TMUX
    and not set -q SSH_TTY
    exec tmux
end
