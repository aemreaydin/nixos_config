{
  description = "emreaydn NixOS Configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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
    };
  };

  outputs = { nixpkgs, awww, catppuccin, vicinae, nixvim, niri
    , neovim-nightly-overlay, zen-browser, nur, ... }:
    let system = "x86_64-linux";
    in {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit awww;
            inherit nur;
            inherit neovim-nightly-overlay;
            inherit vicinae;
            inherit zen-browser;
          };
          modules = [
            ./hosts/desktop/configuration.nix
            ./modules/common.nix

            # NixOS modules from flake inputs
            nixvim.nixosModules.nixvim
            niri.nixosModules.niri
            catppuccin.nixosModules.catppuccin

            # User configuration modules
            ./modules/packages.nix
            ./modules/zsh.nix
            ./modules/git.nix
            ./modules/kitty.nix
            ./modules/nixvim.nix
            ./modules/niri
            ./modules/catppuccin.nix
            ./modules/vicinae.nix
            ./modules/mako.nix
            ./modules/zen-browser.nix
          ];
        };
      };
    };

}
