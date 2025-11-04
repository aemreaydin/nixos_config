{
  imports = [ ./binds.nix ];

  programs.niri = {
    enable = true;

    settings = {
      prefer-no-csd = true;
      overview.workspace-shadow.enable = false;

      input = {
        keyboard = {
          xkb.layout = "us";
        };
      };

      layout = {
        gaps = 4;
        background-color = "transparent";
        center-focused-column = "never";
        preset-column-widths = [
          { proportion = 0.33333; }
          { proportion = 0.5; }
          { proportion = 0.66667; }
          { proportion = 1.0; }
        ];
        default-column-width = { proportion = 0.5; };
        focus-ring.enable = true;
        focus-ring.width = 1;
        border.enable = false;
      };

      outputs."DP-4" = {
        scale = 1.0;
        mode = {
          height = 3840;
          width = 2160;
          refresh = 239.991;
        };
      };

      window-rules = [{
        geometry-corner-radius = let radius = 10.0;
        in {
          bottom-left = radius;
          bottom-right = radius;
          top-left = radius;
          top-right = radius;
        };
        clip-to-geometry = true;
      }];
    };
  };
}
