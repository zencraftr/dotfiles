{ pkgs, ... }:
{
  fonts.fontconfig = {
    enable = true;

    defaultFonts = {
      serif = [ ];
      sansSerif = [ "Ubuntu Nerd Font" ];
      monospace = [ "FiraCode Nerd Font" ];
    };
  };

  home.packages = with pkgs; [
    nerd-fonts.ubuntu
    nerd-fonts.fira-code
  ];
}
