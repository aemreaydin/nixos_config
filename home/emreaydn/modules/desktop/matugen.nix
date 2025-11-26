{
  inputs,
  system,
  pkgs,
  ...
}:
{
  # Install matugen as user package
  home.packages = with pkgs; [
    inputs.matugen.packages.${system}.default
    pywalfox-native
  ];

  # Config and templates in user's XDG config directory
  xdg.configFile = {
    "matugen/config.toml".source = ../../../../templates/matugen/config.toml;
    "matugen/templates/kitty-colors.conf".source = ../../../../templates/matugen/kitty-colors.conf;
    "matugen/templates/mako".source = ../../../../templates/matugen/mako;
    "matugen/templates/pywalfox-colors.json".source =
      ../../../../templates/matugen/pywalfox-colors.json;
  };
}
