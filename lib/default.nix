{ inputs, ... }:
{
  # Helper function to create a NixOS system configuration
  mkHost =
    {
      hostname,
      system ? "x86_64-linux",
      modules ? [ ],
      users ? [ "emreaydn" ],
      sharedModules ? [ ],
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

        # Home-manager NixOS module
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            users = builtins.listToAttrs (
              map (user: {
                name = user;
                value = import ../home/${user};
              }) users
            );

            inherit sharedModules;

            extraSpecialArgs = {
              inherit inputs system;
            };

            backupFileExtension = "backup";
          };
        }

        # Additional modules passed as arguments
      ]
      ++ modules;
    };
}
