{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
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

    initContent = ''
      # Initialize zoxide
      eval "$(zoxide init zsh)"

      # Bind Ctrl+Space to accept autosuggestion
      bindkey '^ ' autosuggest-accept
    '';

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" ];
    };
  };
}
