{
  description = "Sam9212 System Coreflake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, aagl, ... }@inputs: {
    nixosConfigurations.circe = nixpkgs.lib.nixosSystem {
      modules = [
        ./core
        ./hosts/circe

        home-manager.nixosModules.home-manager {
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.samcg = import ./home-manager;
        }

        {
          imports = [ aagl.nixosModules.default ];
          nix.settings = aagl.nixConfig; # Set up Cachix
          programs.anime-game-launcher.enable = true; # Adds launcher and /etc/hosts rules
          programs.honkers-railway-launcher.enable = true;
        }
      ];
    };

    nixosConfigurations.selene = nixpkgs.lib.nixosSystem {
      modules = [
        ./core
        ./hosts/selene

        home-manager.nixosModules.home-manager {
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.samcg = import ./home-manager;
        }
      ];
    };
  };
}
