{ inputs, system, ... }:
{
  # Install vicinae package
  home.packages = [ inputs.vicinae.packages.${system}.default ];

  # Config file
  xdg.configFile."vicinae/vicinae.json".source = ../../../../../configs/vicinae/config.json;

  # Systemd user service
  systemd.user.services.vicinae = {
    Unit = {
      Description = "Vicinae launcher daemon";
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${inputs.vicinae.packages.${system}.default}/bin/vicinae server";
      Restart = "on-failure";
      RestartSec = 5;
      Environment = "USE_LAYER_SHELL=1";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
