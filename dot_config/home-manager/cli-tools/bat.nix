{ pkgs, ... }:

{
  programs.bat = {
    enable = true;

    config = {
      theme = "catppuccin";
    };

    themes = {
      catppuccin = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "main";
          sha256 = "sha256-lJapSgRVENTrbmpVyn+UQabC9fpV1G1e+CdlJ090uvg=";
        };
        file = "themes/Catppuccin Mocha.tmTheme";
      };
    };

    extraPackages = with pkgs.bat-extras; [
      batman
      batdiff
    ];
  };
}
