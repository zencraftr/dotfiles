{ pkgs, ... }:

{
    users.defaultUserShell = pkgs.fish;

    # Fish shell configuration
    programs.fish = {
        enable = true;
    };
}
