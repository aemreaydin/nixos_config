{ pkgs, ... }:

{
  stylix.enable = true;
  stylix.targets.kitty.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  stylix.image = ./wallpaper.jpg;
}
