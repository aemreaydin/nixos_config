{ inputs, system, ... }:
{
  # Install vicinae package
  environment.systemPackages = [ inputs.vicinae.packages.${system}.default ];

  # Create vicinae systemd user service
  systemd.user.services.vicinae = {
    description = "Vicinae launcher daemon";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = "${inputs.vicinae.packages.${system}.default}/bin/vicinae server";
      Restart = "on-failure";
      RestartSec = 5;
    };

    environment = {
      USE_LAYER_SHELL = "1";
    };
  };

  # Create vicinae config file
  environment.etc."xdg/vicinae/vicinae.json".source = ../../../configs/vicinae/config.json;
}
