{ pkgs, ... }:

{
  # Enable dunst notification daemon.
  services.dunst = {
    enable = true;
    package = pkgs.dunst;

    configFile = "~/.config/dunst/dunst.rc";
  };
}
