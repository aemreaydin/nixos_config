{ pkgs, ... }:
{
  # Helper packages for niri
  home.packages = with pkgs; [
    xwayland-satellite
    playerctl
    brightnessctl
    wlogout
  ];

  programs.niri.enable = true;
  programs.niri.settings = {
    input = {
      keyboard.xkb = {
        layout = "us";
      };
    };

    outputs."DP-4" = {
      mode = {
        width = 3840;
        height = 2160;
        refresh = 239.991;
      };
      scale = 1.33;
    };

    prefer-no-csd = true;

    # Debug setting for frame completion (useful for NVIDIA)
    debug = {
      wait-for-frame-completion-before-queueing = {};
    };

    layout = {
      gaps = 4;
      center-focused-column = "never";

      preset-column-widths = [
        { proportion = 0.33333; }
        { proportion = 0.5; }
        { proportion = 0.66667; }
        { proportion = 1.0; }
      ];

      default-column-width = { proportion = 0.5; };

      focus-ring = {
        width = 1;
      };

      border.enable = false;
    };

    spawn-at-startup = [
      { command = [ "vicinae" ]; }
      { command = [ "xwayland-satellite" ]; }
      { command = [ "awww-daemon" ]; }
      { command = [ "awww" "img" "wallpapers/medieval.jpg" ]; }
    ];

    window-rules = [{
      "geometry-corner-radius" = {
        top-left = 10.0;
        top-right = 10.0;
        bottom-right = 10.0;
        bottom-left = 10.0;
      };
      clip-to-geometry = true;
    }];

    hotkey-overlay = {
      skip-at-startup = true;
    };

    binds = {
      "Mod+Return".action.spawn = [ "kitty" ];
      "Alt+Return".action.spawn = [ "kitty" ];
      "Mod+Space".action.spawn = [ "vicinae" "toggle" ];
      "Mod+D".action.spawn = [ "vicinae" ];
      "Mod+B".action.spawn = [ "firefox" ];
      "Mod+W".action.spawn = [ "wallpaper-selector" ];
      "Mod+Alt+L".action.spawn = [ "swaylock" ];
      "Mod+Shift+Q".action.spawn = [ "wlogout" ];

      "Mod+Shift+Slash".action.show-hotkey-overlay = {};

      "Mod+Q".action.close-window = {};
      "Mod+M".action.quit = {};
      "Mod+Shift+Space".action.toggle-window-floating = {};
      "Mod+O".action.toggle-overview = {};

      "Mod+H".action.focus-column-left = {};
      "Mod+J".action.focus-window-or-workspace-down = {};
      "Mod+K".action.focus-window-or-workspace-up = {};
      "Mod+L".action.focus-column-right = {};
      "Mod+Shift+H".action.move-column-left = {};
      "Mod+Shift+J".action.move-window-down-or-to-workspace-down = {};
      "Mod+Shift+K".action.move-window-up-or-to-workspace-up = {};
      "Mod+Shift+L".action.move-column-right = {};

      "Mod+1".action.focus-workspace = 1;
      "Mod+2".action.focus-workspace = 2;
      "Mod+3".action.focus-workspace = 3;
      "Mod+4".action.focus-workspace = 4;
      "Mod+5".action.focus-workspace = 5;
      "Mod+6".action.focus-workspace = 6;
      "Mod+7".action.focus-workspace = 7;
      "Mod+8".action.focus-workspace = 8;
      "Mod+9".action.focus-workspace = 9;
      "Mod+Shift+1".action.move-column-to-workspace = 1;
      "Mod+Shift+2".action.move-column-to-workspace = 2;
      "Mod+Shift+3".action.move-column-to-workspace = 3;
      "Mod+Shift+4".action.move-column-to-workspace = 4;
      "Mod+Shift+5".action.move-column-to-workspace = 5;
      "Mod+Shift+6".action.move-column-to-workspace = 6;
      "Mod+Shift+7".action.move-column-to-workspace = 7;
      "Mod+Shift+8".action.move-column-to-workspace = 8;
      "Mod+Shift+9".action.move-column-to-workspace = 9;

      "Mod+BracketLeft".action.consume-or-expel-window-left = {};
      "Mod+BracketRight".action.consume-or-expel-window-right = {};
      "Mod+Comma".action.consume-window-into-column = {};
      "Mod+Period".action.expel-window-from-column = {};

      "Mod+R".action.switch-preset-column-width = {};
      "Mod+Shift+R".action.switch-preset-column-width-back = {};
      "Mod+Ctrl+R".action.reset-window-height = {};
      "Mod+Shift+F".action.fullscreen-window = {};
      "Mod+F".action.maximize-column = {};
      "Mod+C".action.center-column = {};
      "Mod+Ctrl+C".action.center-visible-columns = {};

      "Mod+Minus".action.set-column-width = "-5%";
      "Mod+Equal".action.set-column-width = "+5%";

      "XF86AudioRaiseVolume" = {
        allow-when-locked = true;
        action.spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+" ];
      };
      "XF86AudioLowerVolume" = {
        allow-when-locked = true;
        action.spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-" ];
      };
      "XF86AudioMute" = {
        allow-when-locked = true;
        action.spawn = [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle" ];
      };
      "XF86AudioMicMute" = {
        allow-when-locked = true;
        action.spawn = [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle" ];
      };

      "XF86AudioPlay" = {
        allow-when-locked = true;
        action.spawn = [ "playerctl" "play-pause" ];
      };
      "XF86AudioStop" = {
        allow-when-locked = true;
        action.spawn = [ "playerctl" "stop" ];
      };
      "XF86AudioPrev" = {
        allow-when-locked = true;
        action.spawn = [ "playerctl" "previous" ];
      };
      "XF86AudioNext" = {
        allow-when-locked = true;
        action.spawn = [ "playerctl" "next" ];
      };

      "XF86MonBrightnessUp" = {
        allow-when-locked = true;
        action.spawn = [ "brightnessctl" "--class=backlight" "set" "+10%" ];
      };
      "XF86MonBrightnessDown" = {
        allow-when-locked = true;
        action.spawn = [ "brightnessctl" "--class=backlight" "set" "-10%" ];
      };
    };
  };
}
