{ pkgs, ... }:
{
  home.packages = [
    (pkgs.writeShellScriptBin "wallpaper-selector" (
      builtins.readFile ../../../../scripts/wallpaper-selector.sh
    ))
  ];
}
