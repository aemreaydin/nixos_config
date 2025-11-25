{ ... }:
{
  # Enable graphics
  hardware.graphics.enable = true;

  # Nvidia driver configuration
  services.xserver.videoDrivers = [ "nvidia" ];

  # Use open-source kernel modules (recommended for RTX 20 series and newer)
  hardware.nvidia.open = true;

  # Nvidia PRIME - Hybrid graphics setup (Nvidia + AMD)
  hardware.nvidia.prime = {
    nvidiaBusId = "PCI:1:0:0";
    amdgpuBusId = "PCI:72:0:0";
  };
}
