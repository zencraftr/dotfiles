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
    ../../modules/home-manager/software/software.nix

    # CLI Tools
    ../../modules/home-manager/cli-tools/bat.nix
    ../../modules/home-manager/cli-tools/git.nix
    ../../modules/home-manager/cli-tools/neovim.nix
    ../../modules/home-manager/cli-tools/tmux.nix
    ../../modules/home-manager/cli-tools/yazi.nix

    # Development
    ../../modules/home-manager/development/rust.nix
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # User packages
  home.packages = with pkgs; [
    impala

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
    gum
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
