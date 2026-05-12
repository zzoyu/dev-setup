{
  description = "Personal environment setup";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
    let
      mkPkgs = system: import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      mkHome = { system, username, homeFile }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = mkPkgs system;
          modules = [
            {
              home.username = username;
              home.stateVersion = "26.05";
            }
            homeFile
          ];
        };
    
    in
    {
      homeConfigurations = {
        "personal" = mkHome {
          system = "aarch64-darwin";
          username = "yujin";
          homeFile = ./home/profiles/personal.nix;
        };
        "work" = mkHome {
          system = "aarch64-darwin";
          username = "yujin";
          homeFile = ./home/profiles/work.nix;
        };
      };
    };
}