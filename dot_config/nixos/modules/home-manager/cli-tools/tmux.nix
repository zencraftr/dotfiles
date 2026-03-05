{ pkgs, ... }:

{
    programs.tmux = {
        enable = true;

        plugins = with pkgs; [
            tmuxPlugins.catppuccin
            tmuxPlugins.vim-tmux-navigator
            tmuxPlugins.yank
            tmuxPlugins.jump
        ];

        extraConfig = ''
            source-file ~/.config/tmux/tmux.keys.conf
            source-file ~/.config/tmux/tmux.terminal.conf
            source-file ~/.config/tmux/tmux.theme.conf
        '';
    };
}
