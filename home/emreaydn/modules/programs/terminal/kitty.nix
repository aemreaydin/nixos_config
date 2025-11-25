{ ... }:
{
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 14;
    };

    settings = {
      window_padding_width = 4;
      hide_window_decorations = "yes";
      confirm_os_window_close = 0;

      cursor_shape = "block";

      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
    };

    # Include matugen-generated colors
    extraConfig = ''
      include colors.conf
    '';
  };
}
