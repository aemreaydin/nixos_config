{ ... }:
{
  # Common configuration shared across all hosts

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  imports = [
    # System modules
    ../modules/system/boot.nix
    ../modules/system/networking.nix
    ../modules/system/nix.nix
    ../modules/system/locale.nix
    ../modules/system/users.nix
    ../modules/system/firmware.nix

    # Services
    ../modules/services/audio.nix
    ../modules/services/display.nix
    ../modules/services/printing.nix

    # Desktop environment
    ../modules/desktop/cachix.nix

    # Programs
    ../modules/programs/gaming/steam.nix

    # Packages
    ../modules/packages/system.nix
    ../modules/packages/cli.nix
    ../modules/packages/desktop.nix
    ../modules/packages/development.nix

    # Theme and overlays
    ../overlays
  ];
}
