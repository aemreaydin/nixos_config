{ pkgs, ... }:
{
  # Essential system-level CLI tools
  # User-specific tools moved to home-manager
  environment.systemPackages = with pkgs; [
    # Network tools (essential for system maintenance)
    wget
    curl

    # Archive tools (needed for system operations)
    unzip
    zip
  ];
}
