{
  description = "emreaydn NixOS Configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, stylix, nixvim, niri, home-manager, neovim-nightly-overlay, ... }: 
  {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        system =  "x86_64-linux";
        modules = [
          ./hosts/desktop/configuration.nix
          ./modules/common.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = true;
            home-manager.users.emreaydn = import ./home/emreaydn.nix;
            home-manager.sharedModules = [ 
              stylix.homeModules.stylix
              nixvim.homeModules.nixvim
              niri.homeModules.niri
            ];
            home-manager.backupFileExtension = "_bk";
            home-manager.extraSpecialArgs = {
              inherit neovim-nightly-overlay;
            };
          }
        ];
      };
    };
  };

}
