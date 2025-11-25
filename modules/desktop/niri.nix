{ pkgs, ... }:
{
  # Enable niri at system level (installs package and sets up system integration)
  programs.niri.enable = true;

  # Install additional packages needed for niri
  environment.systemPackages = with pkgs; [
    playerctl
    brightnessctl
    wlogout
  ];

  # Place niri config.kdl in system-wide XDG config directory
  # Users can override this by creating their own ~/.config/niri/config.kdl
  environment.etc."xdg/niri/config.kdl".source = ../../configs/niri/config.kdl;
}
