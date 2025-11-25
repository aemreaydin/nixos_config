{ pkgs, ... }:
{
  # Enable Niri compositor at system level
  programs.niri.enable = true;

  # Display manager - greetd with tuigreet
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd niri-session";
        user = "greeter";
      };
    };
  };
}
