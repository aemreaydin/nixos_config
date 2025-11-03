{ pkgs, ... }:

{
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";
  stylix.image = ./wallpaper.jpg;
}
