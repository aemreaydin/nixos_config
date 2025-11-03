{ pkgs, neovim-nightly-overlay, ... }:

{
  programs.nixvim = {
    enable = true;
    package = neovim-nightly-overlay.packages.${pkgs.system}.default;
  };
}
