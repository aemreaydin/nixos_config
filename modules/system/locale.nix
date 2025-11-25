{ ... }:
{
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_US.UTF-8";

  # Keyboard layout
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
