{ config, ... }:
let
  TERMINAL = "kitty";
  LAUNCHER = "vicinae";
  BROWSER = "zen-beta";
  LOCKER = "swaylock";
in 
{
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Super+Return".action = spawn TERMINAL;
    "Super+Space".action = spawn [LAUNCHER "toggle"];
    "Super+D".action = spawn LAUNCHER;
    "Super+B".action = spawn BROWSER;
    "Super+Alt+L".action = spawn LOCKER;
    "Super+Shift+Q".action = spawn "wlogout";

    "Super+Shift+Slash".action = show-hotkey-overlay;

    "Super+Q".action = close-window;
    "Super+M".action = quit;
    "Super+Shift+Space".action = toggle-window-floating;
    "Super+O".action = toggle-overview;

    "Super+H".action = focus-column-left;
    "Super+J".action = focus-window-or-workspace-down;
    "Super+K".action = focus-window-or-workspace-up;
    "Super+L".action = focus-column-right;
    "Super+Shift+H".action = move-column-left;
    "Super+Shift+J".action = move-window-down-or-to-workspace-down;
    "Super+Shift+K".action = move-window-up-or-to-workspace-up;
    "Super+Shift+L".action = move-column-right;

    "Super+1".action = focus-workspace 1;
    "Super+2".action = focus-workspace 2;
    "Super+3".action = focus-workspace 3;
    "Super+4".action = focus-workspace 4;
    "Super+5".action = focus-workspace 5;
    "Super+6".action = focus-workspace 6;
    "Super+7".action = focus-workspace 7;
    "Super+8".action = focus-workspace 8;
    "Super+9".action = focus-workspace 9;
    "Super+Shift+1".action.move-column-to-workspace = 1;
    "Super+Shift+2".action.move-column-to-workspace = 2;
    "Super+Shift+3".action.move-column-to-workspace = 3;
    "Super+Shift+4".action.move-column-to-workspace = 4;
    "Super+Shift+5".action.move-column-to-workspace = 5;
    "Super+Shift+6".action.move-column-to-workspace = 6;
    "Super+Shift+7".action.move-column-to-workspace = 7;
    "Super+Shift+8".action.move-column-to-workspace = 8;
    "Super+Shift+9".action.move-column-to-workspace = 9;

    "Super+BracketLeft".action = consume-or-expel-window-left;
    "Super+BracketRight".action = consume-or-expel-window-right;
    "Super+Comma".action = consume-window-into-column;
    "Super+Period".action = expel-window-from-column;

    "Super+R".action = switch-preset-column-width;
    "Super+Shift+R".action = switch-preset-column-width-back;
    "Super+Ctrl+R".action = reset-window-height;
    "Super+Shift+F".action = fullscreen-window;
    "Super+F".action = maximize-column;
    "Super+C".action = center-column;
    "Super+Ctrl+C".action = center-visible-columns;

    "Super+Minus".action = set-column-width "-5%";
    "Super+Equal".action = set-column-width "+5%";

    XF86AudioRaiseVolume = {
      action = spawn [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+" ];
      allow-when-locked = true;
    };
    XF86AudioLowerVolume = {
      action = spawn [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-" ];
      allow-when-locked = true;
    };
    XF86AudioMute = {
      action = spawn [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle" ];
      allow-when-locked = true;
    };
    XF86AudioMicMute = {
      action = spawn [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle" ];
      allow-when-locked = true;
    };

    XF86AudioPlay = {
      action = spawn [ "playerctl" "play-pause" ];
      allow-when-locked = true;
    };
    XF86AudioStop = {
      action = spawn [ "playerctl" "stop" ];
      allow-when-locked = true;
    };
    XF86AudioPrev = {
      action = spawn [ "playerctl" "previous" ];
      allow-when-locked = true;
    };
    XF86AudioNext = {
      action = spawn [ "playerctl" "next" ];
      allow-when-locked = true;
    };

    XF86MonBrightnessUp = {
      action = spawn [ "brightnessctl" "--class=backlight" "set" "+10%" ];
      allow-when-locked = true;
    };
    XF86MonBrightnessDown = {
      action = spawn [ "brightnessctl" "--class=backlight" "set" "-10%" ];
      allow-when-locked = true;
    };
  };

}
