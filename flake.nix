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

    matugen.url = "github:InioX/matugen";

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

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      # Import helper library
      lib = import ./lib { inherit inputs; };

      # Home-manager shared modules (used across all hosts)
      sharedModules = [
        inputs.vicinae.homeManagerModules.default
        inputs.nixvim.homeModules.nixvim
      ];
    in
    {
      nixosConfigurations = {
        desktop = lib.mkHost {
          hostname = "desktop";
          inherit sharedModules;
          modules = [
            inputs.nixvim.nixosModules.nixvim
          ];
        };

        framework13 = lib.mkHost {
          hostname = "framework13";
          inherit sharedModules;
          modules = [
            inputs.nixvim.nixosModules.nixvim
            inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
          ];
        };
      };
    };
}
