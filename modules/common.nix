{ pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./cachix.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.networkmanager.enable = true;

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_US.UTF-8";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

programs.dconf.enable = true;
  # Services
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session";
        user = "emreaydn";
      };
    };
    # xserver.enable = true;
    # displayManager.defaultSession = "gnome-xorg";
    # desktopManager.gnome.enable = true;
    # displayManager.gdm.enable = true;
    # displayManager.gdm.wayland
    # displayManager.sddm.enable = true;
    # displayManager.sddm.wayland.enable = true;
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

  hardware.enableRedistributableFirmware = true;
  hardware.enableAllFirmware = true;

  nixpkgs.config.allowUnfree = true;
}
