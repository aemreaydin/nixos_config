{ pkgs, ... }:
{
  users.users.emreaydn = {
    isNormalUser = true;
    description = "Emre AYDIN";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
