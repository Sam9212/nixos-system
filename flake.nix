{
  description = "Sam9212 System Coreflake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.circe = nixpkgs.lib.nixosSystem {
      modules = [
        ./core
        ./hosts/circe

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.samcg = import ./home-manager;
        }
      ];
    };

    nixosConfigurations.selene = nixpkgs.lib.nixosSystem {
      modules = [
        ./core
        ./hosts/selene

        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.samcg = import ./home-manager;
        }
      ];
    };
  };
}
