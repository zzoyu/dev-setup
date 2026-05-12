{
  description = "Personal environment setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }:{

    homeConfigurations."yujin-mac" = home-manager.lib.homeManagerConfiguration {
      userName = "yujin";
      homeDirectory = "/Users/yujin";
      system = "aarch64-darwin";
      configuration = import ./home/macos-aarch64.nix;
    };
  };
}