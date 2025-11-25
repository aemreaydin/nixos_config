{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.mako ];

  # Create mako config in system-wide XDG config directory
  environment.etc."xdg/mako/config".source = ../../../configs/mako/config;
}
