{ pkgs, ... }:

{
  imports = [
    ./packages.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.networkmanager.enable = true;

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_US.UTF-8";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Services
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  services.printing.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Users
  users.users.emreaydn = {
    isNormalUser = true;
    description = "Emre AYDIN";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
