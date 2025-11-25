{ pkgs, awww, nur, ... }:

{
  nixpkgs.overlays = [ nur.overlays.default ];

  environment.systemPackages = with pkgs; [
    awww.packages.${pkgs.system}.awww
    lazygit
    fastfetch
    pciutils
    cachix
    mesa-demos

    gemini-cli
    claude-code

    gh
    gh-dash

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

    swaylock

    libnotify
    yazi
    jq
    tldr

    lunarvim
    swww
    zoxide
    firefox
  ];

  programs.zsh.enable = true;
}
