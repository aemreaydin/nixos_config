{ inputs, ... }:
{
  # Helper function to create a NixOS system configuration
  mkHost =
    {
      hostname,
      system ? "x86_64-linux",
      modules ? [ ],
    }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs system;
      };
      modules = [
        # Host-specific configuration
        ../hosts/${hostname}

        # Common configuration shared across all hosts
        ../hosts/common.nix

        # Additional modules passed as arguments
      ]
      ++ modules;
    };
}
