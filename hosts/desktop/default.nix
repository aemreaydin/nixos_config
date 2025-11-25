{ ... }:
{
  imports = [
    ./hardware.nix
    ./nvidia.nix
  ];

  # NixOS state version
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of your first install.
  system.stateVersion = "25.05";
}
