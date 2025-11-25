{ pkgs, ... }:
{
  # Enable zsh at system level (required for login shell)
  programs.zsh.enable = true;

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
