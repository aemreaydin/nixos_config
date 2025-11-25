{ pkgs, vicinae, ... }:

{
  # Install vicinae package
  environment.systemPackages = [ vicinae.packages.${pkgs.system}.default ];

  # Create vicinae systemd user service
  systemd.user.services.vicinae = {
    description = "Vicinae launcher daemon";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = "${vicinae.packages.${pkgs.system}.default}/bin/vicinae server";
      Restart = "on-failure";
      RestartSec = 5;
    };

    environment = {
      USE_LAYER_SHELL = "1";
    };
  };

  # Create vicinae config file
  environment.etc."xdg/vicinae/vicinae.json".text = builtins.toJSON {
    faviconService = "twenty";
    font.size = 11;
    popToRootOnClose = false;
    rootSearch.searchFiles = false;
    theme.name = "catppuccin-frappe";
    window = {
      csd = true;
      opacity = 0.85;
      rounding = 10;
    };
  };
}
