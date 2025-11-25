{ pkgs, ... }:

{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/vesper.yaml";
    image = ./medieval.jpg;

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
    };

    autoEnable = true;
    # targets.kitty.enable = true;
    # targets.niri.enable = true;
  };
}
