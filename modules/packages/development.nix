{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # GitHub tools
    gh
    gh-dash

    # AI tools
    gemini-cli
    claude-code

    # Editors
    lunarvim
  ];
}
