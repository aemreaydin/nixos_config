{ pkgs, nur, ... }:

{
  home.username = "emreaydn";
  home.homeDirectory = "/home/emreaydn";
  home.stateVersion = "25.05";

  nixpkgs.overlays = [ 
    nur.overlays.default
  ]; 

  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    lazygit
    fastfetch
    pciutils
    cachix
    mesa-demos

    xclip
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

    fuzzel
    wofi
    rofi
    yazi
    jq
    tldr

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
    ./modules/zen.nix 
    ./modules/stylix.nix
    ./modules/kitty.nix
    ./modules/niri.nix
    # ./modules/hyprland.nix
  ];
}
