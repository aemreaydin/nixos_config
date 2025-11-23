{ pkgs, awww, nur, ... }:

{
  home.username = "emreaydn";
  home.homeDirectory = "/home/emreaydn";
  home.stateVersion = "25.05";

  nixpkgs.overlays = [ nur.overlays.default ];

  programs.home-manager.enable = true;
  home.packages = with pkgs; [
    awww.packages.${pkgs.system}.awww
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
    swaylock

    libnotify
    yazi
    jq
    tldr

    lunarvim
    swww
    zoxide
    firefox
    steam
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
    ./modules/kitty.nix
    ./modules/mako.nix
    ./modules/niri
    ./modules/catppuccin.nix
    ./modules/vicinae.nix
    # ./modules/stylix
    # ./modules/hyprland.nix
  ];

  xdg.configFile."vicinae/vicinae.json".force = true;
}
