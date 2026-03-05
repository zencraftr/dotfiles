{ pkgs, ... }:

{
  # User-specific information
  home.username = "zencraftr";
  home.homeDirectory = "/home/zencraftr";

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";

  imports = [
    # Fonts
    ../../modules/home-manager/fonts.nix

    # Notifications
    ../../modules/home-manager/notifications/battery-notifier.nix
    ../../modules/home-manager/notifications/dunst.nix

    # Software
    ../../modules/home-manager/software/firefox.nix
    ../../modules/home-manager/software/gimp.nix
    ../../modules/home-manager/software/mpv.nix
    ../../modules/home-manager/software/spotify.nix

    # CLI Tools
    ../../modules/home-manager/cli-tools/bat.nix
    ../../modules/home-manager/cli-tools/git.nix
    ../../modules/home-manager/cli-tools/neovim.nix
    ../../modules/home-manager/cli-tools/tmux.nix
    ../../modules/home-manager/cli-tools/yazi.nix
  ];

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  # User packages
  home.packages = with pkgs; [
    impala

    # Must-have programs
    zathura
    discord
    obsidian
    obs-studio
    blender
    inkscape

    # CLI tools
    asciinema
    btop
    chezmoi
    eza
    entr
    fastfetch
    fd
    fzf
    gh
    gomi
    lazygit
    ripgrep
    starship
    tldr
    tmux
    yazi
    zoxide

    # Development tools
    gcc
    gnumake
    claude-code
    claude-code-acp

    # Lua
    luajit
    luajitPackages.busted
    luajitPackages.luarocks

    # Nix
    nix-prefetch-github

    # Python
    python3

    # Rust
    rustc
    cargo

    # Web dev
    nodejs
  ];

  # Desktop entries configuration
  xdg.desktopEntries = {
    "btop" = {
      name = "Btop";
      noDisplay = true;
    };
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
    "kitty" = {
      type = "Application";

      name = "Kitty";
      genericName = "Terminal Emulator";
      comment = "A fast, feature full, GPU based terminal emulator";
      icon = "kitty";

      exec = "kitty";

      categories = [
        "System"
        "TerminalEmulator"
      ];

    };
    "fish" = {
      name = "Fish";
      noDisplay = true;
    };
    "nixos-manual" = {
      name = "NixOS Manual";
      noDisplay = true;
    };
  };

}
