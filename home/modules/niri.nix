{ ... }:

{
  programs.niri = {
    enable = true;
    settings = {
      binds = {
        "Alt+Return".action.spawn = ["kitty"];
        "Alt+D".action.spawn = ["fuzzel"];
        "Alt+Q".action.close-window = [];
        "Alt+B".action.spawn = ["zen-beta"];

        "Alt+H".action.focus-column-left = [];
        "Alt+J".action.focus-window-down = [];
        "Alt+K".action.focus-window-up = [];
        "Alt+L".action.focus-column-right = [];
      };

        prefer-no-csd = true;
        overview.workspace-shadow.enable = false;

        input = {
          keyboard = {
            xkb.layout = "us, tr";
            numlock = true;
          };

          touchpad = {
            tap = true;
            natural-scroll = false;
          };
        };

        layout = {
          gaps = 16;
          background-color = "transparent";
          center-focused-column = "never";
          preset-column-widths = [
            { proportion = 0.33333; }
            { proportion = 0.5; }
            { proportion = 0.66667; }
            { proportion = 1.0; }
          ];
          default-column-width = {
            proportion = 0.5;
          };
          focus-ring.enable = false;
          border.width = 4;
          shadow = {
            softness = 30;
            spread = 5;
            offset = {
              x = 0;
              y = 5;
            };
            color = "#0007";
          };
        };

        outputs."DP-3" = {
          scale = 1.0;
          mode = {
            height = 1080;
            refresh = 144.000;
            width = 1920;
          };
        };

        layer-rules = [
          {
            matches = [ { namespace = "^hyprpaper$"; } ];
            place-within-backdrop = true;
          }
        ];

        window-rules = [
          {
            geometry-corner-radius = let
              radius = 10.0;
            in {
              bottom-left = radius;
              bottom-right = radius;
              top-left = radius;
              top-right = radius;
            };
            clip-to-geometry = true;
          }
        ];
      };
  };
}
