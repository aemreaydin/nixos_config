{ pkgs, ... }:

{
  home.username = "emreaydn";
  home.homeDirectory = "/home/emreaydn";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    lazygit

    bat
    eza
    wget
    curl
    btop
    ripgrep
    fd
    fzf

    unzip
    zip

    yazi
    jq
    tldr

    niri

    lunarvim
    zoxide
    firefox
  ];
  home.shellAliases = {
    vi = "lvim";
    vim = "lvim";
  };

  imports = [
    ./modules/git.nix
    ./modules/nixvim.nix
    ./modules/shell.nix
    ./modules/niri.nix
    ./modules/stylix.nix
    ./modules/kitty.nix
    # ./modules/hyprland.nix
  ];
}
