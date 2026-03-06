{ pkgs, ... }:

{

  imports = [
    ./bat.nix
    ./exercism.nix
    ./git.nix
    ./neovim.nix
    ./tmux.nix
    ./yazi.nix
  ];

  home.packages = with pkgs; [
    clipse
  ];

}
