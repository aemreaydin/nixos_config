{
  pkgs,
  inputs,
  system,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    # Browsers
    firefox

    # Wayland utilities
    swaylock

    # Wallpaper daemon from flake input
    inputs.awww.packages.${system}.awww

    # Notifications
    libnotify
  ];
}
