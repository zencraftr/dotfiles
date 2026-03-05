{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user.name = "Adam Bisinella";
      user.email = "a.bisinella@proton.me";

      init.defaultBranch = "main";
    };
  };

  home.packages = with pkgs; [
    act
  ];
}
