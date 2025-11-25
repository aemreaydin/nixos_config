{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Hardware utilities
    pciutils
    mesa-demos

    # Binary cache
    cachix
  ];
}
