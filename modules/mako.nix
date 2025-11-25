{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.mako ];

  # Create mako config in system-wide XDG config directory
  environment.etc."xdg/mako/config".text = ''
    default-timeout=4000
    layer=overlay
    border-radius=10
    icon-border-radius=10
    padding=8
  '';
}
