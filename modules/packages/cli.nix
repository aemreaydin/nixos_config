{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # System monitoring
    btop
    fastfetch

    # File management
    yazi
    eza
    fd
    ripgrep
    fzf
    zoxide

    # Utilities
    bat
    xclip
    jq
    tldr

    # Network tools
    wget
    curl

    # Archive tools
    unzip
    zip

    # Version control
    lazygit
  ];
}
