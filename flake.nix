{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nixvim = {
    #   url = "github:nix-community/nixvim";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  #outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs: {
  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      kyoichi = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/kyoichi/configuration.nix
          ./hosts/kyoichi/hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.lordofwizard = import ./hosts/kyoichi/home.nix;
          }
        ];
      };
    };
  };
}
