{
  description = "Personal environment setup";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
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
            homeFile
            {
              home.username = username;
              home.homeDirectory = "/Users/${username}";
              home.stateVersion = "26.05";
            }
          ];
        };
    
    in
    {
      homeConfigurations = {
        "yujin-mac" = mkHome {
          system = "aarch64-darwin";
          username = "yujin";
          homeFile = ./home/macos-aarch64.nix;
        };
      };
    };
}