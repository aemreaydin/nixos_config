{ ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;
  hardware.nvidia.prime = {
    nvidiaBusId = "PCI:1:0:0";
    amdgpuBusId = "PCI:72:0:0";
  };

  hardware.enableRedistributableFirmware = true;
  hardware.enableAllFirmware = true;

  system.stateVersion = "25.05";
}
