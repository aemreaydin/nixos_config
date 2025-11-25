{
  description = "emreaydn NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

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

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      # Import helper library
      lib = import ./lib { inherit inputs; };
    in
    {
      nixosConfigurations = {
        desktop = lib.mkHost {
          hostname = "desktop";
          system = "x86_64-linux";
          modules = [
            # NixOS modules from flake inputs
            inputs.nixvim.nixosModules.nixvim
            inputs.niri.nixosModules.niri
            inputs.catppuccin.nixosModules.catppuccin
          ];
        };

        framework13 = lib.mkHost {
          hostname = "framework13";
          system = "x86_64-linux";
          modules = [
            # NixOS modules from flake inputs
            inputs.nixvim.nixosModules.nixvim
            inputs.niri.nixosModules.niri
            inputs.catppuccin.nixosModules.catppuccin

            # Framework AMD AI 300 Series hardware support
            inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
          ];
        };
      };
    };
}
