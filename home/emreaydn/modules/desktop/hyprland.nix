{ pkgs, ... }:
{
  # Helper packages for Hyprland
  home.packages = with pkgs; [
    playerctl
    brightnessctl
    wlogout
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      # Monitor configuration
      monitor = [
        "DP-4,3840x2160@239.991,0x0,1.33"
        ",preferred,auto,1"
      ];

      # Input configuration
      input = {
        kb_layout = "us";
        repeat_rate = 25;
        repeat_delay = 600;
        follow_mouse = 1;
      };

      # General window settings
      general = {
        gaps_in = 4;
        gaps_out = 4;
        border_size = 1;
        layout = "master";
      };

      # Decoration settings
      decoration = {
        rounding = 10;

        blur = {
          enabled = true;
          size = 5;
          passes = 2;
          noise = 0.02;
          brightness = 0.9;
          contrast = 0.9;
        };
      };

      # Animation settings
      animations = {
        enabled = true;
      };

      # Misc settings
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        focus_on_activate = true;
      };

      # Window opacity
      windowrulev2 = [
        "opacity 0.9,focus:0"
      ];

      # Startup applications
      exec-once = [
        "vicinae"
        "awww-daemon"
        "sleep 1 && awww img wallpapers/medieval.jpg"
      ];

      # Keybindings
      "$mod" = "SUPER";

      bind = [
        # Terminal
        "$mod,Return,exec,kitty"
        "Alt,Return,exec,kitty"

        # Launcher
        "$mod,Space,exec,vicinae toggle"
        "$mod,d,exec,vicinae"

        # Applications
        "$mod,b,exec,firefox"
        "$mod,w,exec,wallpaper-selector"

        # System
        "$mod Alt,l,exec,swaylock"
        "$mod Shift,q,exec,wlogout"

        # Window management
        "$mod,q,killactive,"
        "$mod,m,exit,"
        "$mod Shift,Space,togglefloating,"
        "$mod Shift,f,fullscreen,0"
        "$mod,f,fullscreen,1"

        # Focus movement (hjkl vim-style)
        "$mod,h,movefocus,l"
        "$mod,j,movefocus,d"
        "$mod,k,movefocus,u"
        "$mod,l,movefocus,r"

        # Move windows (hjkl vim-style)
        "$mod Shift,h,movewindow,l"
        "$mod Shift,j,movewindow,d"
        "$mod Shift,k,movewindow,u"
        "$mod Shift,l,movewindow,r"

        # Workspace switching
        "$mod,1,workspace,1"
        "$mod,2,workspace,2"
        "$mod,3,workspace,3"
        "$mod,4,workspace,4"
        "$mod,5,workspace,5"
        "$mod,6,workspace,6"
        "$mod,7,workspace,7"
        "$mod,8,workspace,8"
        "$mod,9,workspace,9"

        # Move windows to workspace
        "$mod Shift,1,movetoworkspace,1"
        "$mod Shift,2,movetoworkspace,2"
        "$mod Shift,3,movetoworkspace,3"
        "$mod Shift,4,movetoworkspace,4"
        "$mod Shift,5,movetoworkspace,5"
        "$mod Shift,6,movetoworkspace,6"
        "$mod Shift,7,movetoworkspace,7"
        "$mod Shift,8,movetoworkspace,8"
        "$mod Shift,9,movetoworkspace,9"

        # Layout manipulation
        "$mod,r,layoutmsg,orientationnext"
      ];

      # Resize bindings
      binde = [
        "$mod,minus,resizeactive,-50 0"
        "$mod,equal,resizeactive,50 0"
      ];

      # Media keys
      bindl = [
        ",XF86AudioRaiseVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+"
        ",XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"
        ",XF86AudioMute,exec,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute,exec,wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86AudioPlay,exec,playerctl play-pause"
        ",XF86AudioStop,exec,playerctl stop"
        ",XF86AudioPrev,exec,playerctl previous"
        ",XF86AudioNext,exec,playerctl next"
        ",XF86MonBrightnessUp,exec,brightnessctl --class=backlight set +10%"
        ",XF86MonBrightnessDown,exec,brightnessctl --class=backlight set -10%"
      ];
    };
  };
}
