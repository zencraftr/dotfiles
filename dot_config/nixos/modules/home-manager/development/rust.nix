{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rustc
    cargo

    # LSP
    rust-analyzer
    rustfmt
  ];
}
