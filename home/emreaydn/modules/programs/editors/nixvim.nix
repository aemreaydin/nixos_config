{ inputs, system, ... }:
{
  programs.nixvim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${system}.default;
  };
}
