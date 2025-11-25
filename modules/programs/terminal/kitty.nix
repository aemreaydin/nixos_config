{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.kitty ];

  # Place kitty config in /etc/xdg/kitty/kitty.conf (system-wide XDG config)
  environment.etc."xdg/kitty/kitty.conf".source = ../../../configs/kitty/kitty.conf;
}
