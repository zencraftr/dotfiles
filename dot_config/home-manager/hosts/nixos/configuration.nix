{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix

    # System modules
    ../../modules/nixos/system/bluetooth.nix
    ../../modules/nixos/system/hyprland.nix

    # Shell configuration
    ../../modules/nixos/shell.nix
  ];

  # Allow experimental features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  programs.command-not-found.enable = false;

  # Boot configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Network configuration (host-specific)
  networking.hostName = "nixos";
  networking.wireless.iwd.enable = true;
  networking.enableIPv6 = false;

  # Timezone (host-specific, can be overridden per host)
  time.timeZone = "Europe/London";

  # Enable sound
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support
  services.libinput.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System packages
  environment.systemPackages = with pkgs; [
    # System utilities
    brightnessctl
    libnotify
    pulseaudio
    busybox
    bluetui

    # Fish shell and plugins
    fish
    fishPlugins.fzf-fish

    # Command line tools
    zip
    unzip

    # Development tools
    git

    # Nix
    home-manager
  ];

  # Enable automatic CPU speed and power optimizer daemon
  services.auto-cpufreq.enable = true;

  # User account (host-specific user configuration)
  users.users.zencraftr = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };

  # System compatibility version
  system.stateVersion = "25.11";
}
