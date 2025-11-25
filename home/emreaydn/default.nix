{ ... }:
{
  home = {
    username = "emreaydn";
    homeDirectory = "/home/emreaydn";
    stateVersion = "25.05";
  };

  # Import user modules and packages
  imports = [
    ./packages.nix

    # Terminal programs
    ./modules/programs/terminal/kitty.nix
    ./modules/programs/terminal/zsh.nix

    # Development
    ./modules/programs/development/git.nix

    # Editors
    ./modules/programs/editors/nixvim.nix

    # Notifications
    ./modules/programs/notifications/mako.nix

    # Desktop
    ./modules/desktop/matugen.nix
    ./modules/desktop/niri.nix

    # Launchers
    ./modules/programs/launchers/vicinae.nix

    # Utilities
    ./modules/programs/wallpaper-selector.nix
  ];

  # Let home-manager manage itself
  programs.home-manager.enable = true;
}
