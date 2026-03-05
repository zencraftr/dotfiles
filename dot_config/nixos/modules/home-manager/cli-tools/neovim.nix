{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
  };

  home.packages = with pkgs; [
    # Neovim core
    tree-sitter

    # Lua
    lua-language-server
    stylua

    # Nix
    nil
    nixfmt

    # Python
    pyright
    ruff

    # Webstack Dev
    vscode-langservers-extracted
    typescript
    typescript-language-server
    nodePackages.prettier

    # Clipboard
    cliphist
  ];

  xdg.desktopEntries."nvim" = {
    name = "Neovim";
    noDisplay = true;
  };
}
