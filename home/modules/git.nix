{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "aemreaydin";
      user.email = "aeaydin1@gmail.com";
      init.defaultBranch = "main";
    };
    lfs.enable = true;
  };
}
