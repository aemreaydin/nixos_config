{ pkgs, zen-browser, nur, ... }:

{
  # Install zen-browser package
  environment.systemPackages = [
    zen-browser.packages.${pkgs.system}.default
    # Extensions need to be installed manually or via the browser
  ];

  # Note: Zen Browser policies and profile configuration
  # Since zen-browser only provides home-manager modules, we can't configure
  # policies and profiles declaratively at the system level.
  #
  # Options:
  # 1. Keep the home-manager module just for zen-browser (minimal HM usage)
  # 2. Configure policies manually in the browser
  # 3. Use environment variables to control some behavior
  #
  # For now, just installing the package. User can configure it manually
  # or we can add back minimal home-manager support later if needed.
}
