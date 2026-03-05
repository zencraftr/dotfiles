{ pkgs, ... }:

{
    programs.mpv = {
        enable = true;
    };

    # Desktop entry
    xdg.desktopEntries."mpv" = {
        type = "Application";

        name = "MPV";
        genericName = "Multimedia player";
        comment = "Play movies and songs";
        icon = "mpv";

        exec = "mpv --player-operation-mode=pseudo-gui -- %U";
        terminal = false;

        categories = [
            "AudioVideo"
            "Audio"
            "Video"
            "Player"
            "TV"
        ];
    };
}
