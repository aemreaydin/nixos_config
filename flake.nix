{
  description = "emreaydn NixOS Configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    awww.url = "git+https://codeberg.org/LGFae/awww";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vicinae.url = "github:vicinaehq/vicinae";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { nixpkgs, awww, catppuccin, vicinae, nixvim, niri, home-manager
    , neovim-nightly-overlay, zen-browser, nur, ... }:
    let system = "x86_64-linux";
    in {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/desktop/configuration.nix
            ./modules/common.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = false;
              home-manager.useUserPackages = false;
              home-manager.users.emreaydn = import ./home/emreaydn.nix;
              home-manager.sharedModules = [
                vicinae.homeManagerModules.default
                nixvim.homeModules.nixvim
                zen-browser.homeModules.beta
                niri.homeModules.niri
                catppuccin.homeModules.catppuccin
              ];
              home-manager.backupFileExtension = "_bk";
              home-manager.extraSpecialArgs = {
                inherit neovim-nightly-overlay;
                inherit nur;
                inherit awww;
              };
            }
          ];
        };
      };
    };

}
