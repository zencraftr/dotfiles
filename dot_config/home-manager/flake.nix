{

  description = "NixOs zencraftr's dotfiles flake";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    battery-notifier = {
      url = "github:luisnquin/battery-notifier";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      # Nix and Home Manager.
      self,
      nixpkgs,
      home-manager,

      # Custom outputs.
      spicetify-nix,
      battery-notifier,

      ...
    }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # NixOS configuration.
      nixosConfigurations.nixos = lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
        ];
        specialArgs = {
          inherit spicetify-nix;
          inherit battery-notifier;
          inherit home-manager;
        };
      };

      # Home Manager configuration.
      homeConfigurations.zencraftr = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
        ];
        extraSpecialArgs = {
          inherit spicetify-nix;
          inherit battery-notifier;
        };
      };
    };

}
