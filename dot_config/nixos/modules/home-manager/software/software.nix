{ pkgs, ... }:

{
  # Software modules
  imports = [
    ./firefox.nix
    ./gimp.nix
    ./mpv.nix
    ./spotify.nix
    # ./proton.nix
  ];

  # User packages
  home.packages = with pkgs; [
    blender
    discord
    libreoffice-still
    localsend
    obsidian
    zathura
  ];

  # Desktop entries configuration
  xdg = {
    enable = true;

    desktopEntries = {
      "obsidian" = {
        type = "Application";

        name = "Obsidian";
        genericName = "Knowledge Base";

        exec = "obsidian";
        terminal = false;

        categories = [
          "Office"
        ];

        mimeType = [
          "x-scheme-handler/obsidian"
        ];

        settings = {
          StartupWMClass = "obsidian";
        };

      };
    };
  };
}
