{ pkgs, ... }:

{
    programs.yazi = {
        enable = true;
        flavors = { };
        plugins = {
            full-border = pkgs.yaziPlugins.full-border;
        };
    };

    # Desktop entry
    xdg.desktopEntries."yazi" = {
        name = "Yazi";
        genericName = "Terminal Emulator";
        comment = "A terminal emulator for X11 and Wayland";

        exec = "kitty yazi";
        terminal = false;

        categories = [
            "Application"
            "System"
            "FileManager"
        ];
    };
}
