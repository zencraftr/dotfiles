{
  description = "NixOS modular configuration with Home Manager integration";

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
      self,
      nixpkgs,
      home-manager,
      spicetify-nix,
      battery-notifier,
      ...
    }:

    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      # Helper function to create a NixOS configuration with Home Manager integration
      mkNixosConfiguration =
        { hostname, users }:
        lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/${hostname}/configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit spicetify-nix battery-notifier;
                };
                users = lib.genAttrs users (user: import ./users/${user}/home.nix);
              };
            }
          ];
          specialArgs = {
            inherit spicetify-nix battery-notifier;
          };
        };
    in
    {
      # NixOS configurations for hosts and users
      nixosConfigurations = {
        nixos = mkNixosConfiguration {
          hostname = "nixos";
          users = [ "zencraftr" ];
        };
      };
    };

}
