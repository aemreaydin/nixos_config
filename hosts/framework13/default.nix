{ ... }:
{
  imports = [
    ./hardware.nix
    ./framework.nix
  ];

  # NixOS state version
  system.stateVersion = "25.05";
}
