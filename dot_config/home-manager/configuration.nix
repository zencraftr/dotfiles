{
  pkgs,
  spicetify-nix,
  battery-notifier,
  home-manager,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix

    # System
    ./system/bluetooth.nix
    ./system/hyprland.nix
    # ./system/hyprpaper.nix

    # Shell
    ./shell.nix

    # Home Manager as a NixOS module
    home-manager.nixosModules.home-manager
  ];

  # Allow experimental features.
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  programs.command-not-found.enable = false;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Network configuration
  networking.hostName = "nixos";
  networking.wireless.iwd.enable = true;
  networking.enableIPv6 = false;

  # Set the timezone.
  time.timeZone = "Europe/London";

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Enable not free packages.
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # System
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

    # Developments tools
    git

    # Nix
    home-manager
  ];

  # Enable automatic CPU speed and power optimiser daemon.
  services.auto-cpufreq.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zencraftr = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];

    shell = pkgs.fish;
  };

  # Home Manager
  home-manager = {
    users.zencraftr = import ./home.nix;
    extraSpecialArgs = {
      inherit spicetify-nix battery-notifier;
    };
  };

  # System complatibility verion.
  system.stateVersion = "25.11";
}
