{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixpkgs-unstable, nixvim, ... }@inputs: {
    nixosConfigurations = {
      kyoichi = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/kyoichi/configuration.nix
          ./hosts/kyoichi/hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.sharedModules = [ nixvim.homeManagerModules.nixvim ];
            home-manager.users.lordofwizard = import ./hosts/kyoichi/home.nix;
            home-manager.extraSpecialArgs = {
              pkgsUnstable = import nixpkgs-unstable { system = "x86_64-linux"; };
            };
          }
        ];
      };
    };
  };
}

