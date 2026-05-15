{
  description = "nix-darwin system flake";

  inputs = {
    claude-code.url = "github:sadjow/claude-code-nix";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      claude-code,
      nix-darwin,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
    }:
    let
      system = "aarch64-darwin"; # or x86_64-darwin if on Intel
    in
    {
      darwinConfigurations."dblandin-artsy-mbp" = nix-darwin.lib.darwinSystem {
        inherit system;
        specialArgs = { inherit inputs self; };
        modules = [
          ./hosts/dblandin-artsy-mbp
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.devon = import ./home/devon;

            # Add unstable overlay
            nixpkgs.overlays = [
              (final: prev: {
                unstable = nixpkgs-unstable.legacyPackages.${system};
              })
            ];
          }
        ];
      };
    };
}
