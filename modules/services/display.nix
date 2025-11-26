{ pkgs, ... }:
{
  # Enable Hyprland compositor at system level
  programs.hyprland.enable = true;

  # Display manager - greetd with tuigreet
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
        user = "greeter";
      };
    };
  };
}
