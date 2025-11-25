{ ... }:
{
  programs.git = {
    enable = true;
    config = {
      user.name = "aemreaydin";
      user.email = "aeaydin1@gmail.com";
      init.defaultBranch = "main";
    };
    lfs.enable = true;
  };
}
