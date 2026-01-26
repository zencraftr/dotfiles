{ pkgs, ... }:

{
  # Home Manager configuration for the user.
  home.username = "zencraftr";
  home.homeDirectory = "/home/zencraftr";

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";

  imports = [
    # Fonts
    ./fonts.nix

    # Notifications
    ./notifications/battery-notifier.nix
    ./notifications/dunst.nix

    # Softwares
    ./software/firefox.nix
    ./software/gimp.nix
    ./software/mpv.nix
    ./software/spotify.nix

    # CLI Tools
    ./cli-tools/bat.nix
    ./cli-tools/git.nix
    ./cli-tools/neovim.nix
    ./cli-tools/tmux.nix
    ./cli-tools/yazi.nix
  ];

  # Packages
  nixpkgs.config.allowUnfree = true;

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

    # TUI tools
    gum

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

  # Remove desktop entry for user-level packages.
  xdg.desktopEntries = {
    "btop" = {
      name = "Btop";
      noDisplay = true;
    };
    "obsidian" = {
      type = "Application";

      name = "Obsidian";
      genericName = "Knowledge Base";
      # icon = "~/.config/icons/obsidian.png";

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
