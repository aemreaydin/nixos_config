{ pkgs, ... }:
{
  # Framework-specific configuration for AMD AI 300 Max Series

  # Firmware updates via fwupd (for BIOS updates through LVFS)
  services.fwupd.enable = true;

  # Power management - power-profiles-daemon (recommended for AMD Framework laptops)
  services.power-profiles-daemon.enable = true;

  # AMD GPU - Mesa drivers (already enabled in common via hardware.graphics)
  # No additional GPU configuration needed for AMD integrated graphics

  # Enable hardware video acceleration
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      libva-vdpau-driver
      libvdpau-va-gl
    ];
  };

  # Battery optimization
  boot.kernelParams = [
    # AMD P-State driver for better power management
    "amd_pstate=active"
  ];
}
