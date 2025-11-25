{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # CLI tools
    btop
    fastfetch
    yazi
    eza
    fd
    ripgrep
    fzf
    zoxide
    bat
    xclip
    jq
    tldr
    unzip
    zip
    lazygit
  ];
}
