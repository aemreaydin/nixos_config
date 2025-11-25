# This is a placeholder hardware configuration for the Framework 13 laptop.
#
# IMPORTANT: When you set up the laptop, run the following command on the actual hardware:
#   sudo nixos-generate-config --show-hardware-config > hosts/framework13/hardware.nix
#
# This will generate the correct hardware configuration including:
# - File systems and partitions
# - Kernel modules
# - CPU microcode
# - Boot configuration
#
# For now, this is a minimal placeholder that allows the flake to evaluate.

{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:
{
  imports = [ ];

  # Placeholder - will be replaced by actual hardware scan
  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "thunderbolt"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  # Placeholder filesystem config
  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS_ROOT";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/NIXOS_BOOT";
    fsType = "vfat";
  };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
