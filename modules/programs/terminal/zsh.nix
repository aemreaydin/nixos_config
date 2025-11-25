{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      vi = "lvim";
      vim = "lvim";
      ll = "eza -l --icons";
      la = "eza -la --icons";
      ls = "eza --icons";
      cat = "bat";
      cd = "z";
    };

    interactiveShellInit = ''
      eval "$(zoxide init zsh)"

      # Bind Ctrl+Space to accept autosuggestion
      bindkey '^ ' autosuggest-accept
    '';

    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" ];
    };
  };
}
