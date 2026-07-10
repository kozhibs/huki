{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };
  };

  perSystem =
    {
      pkgs,
      lib,
      self',
      ...
    }:
    {
      packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
        inherit pkgs;
        settings = {
          spawn-at-startup = [
            (lib.getExe self'.packages.myNoctalia)
          ];

          xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

          layout = {
            gaps = 5;
            focus-ring = {
              width = 2;
              active-color = "#333e4f";
              inactive-color = "#232422";
            };
            border = {
              off = [ ];
              width = 1;
            };
          };

          window-rule = {
            geometry-corner-radius = 16;
            clip-to-geometry = true;
          };

          input = {
            touchpad = {
              tap = [ ];
            };
            keyboard = {
              xkb = {
                layout = "us,ru";
                options = "grp:shift_alt_toggle,compose:ralt,ctrl:nospace";
              };
            };
          };

          binds = {
            "Mod+T".spawn-sh = lib.getExe pkgs.alacritty;
            "Mod+Q".close-window = [ ];
            "Mod+B".spawn-sh = lib.getExe pkgs.firefox;
            "Mod+D".spawn-sh = lib.getExe pkgs.fuzzel;
            "Mod+Space".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";

            "Mod+1".focus-workspace = "0";
            "Mod+2".focus-workspace = "1";
            "Mod+3".focus-workspace = "2";
            "Mod+4".focus-workspace = "3";
            "Mod+5".focus-workspace = "4";
            "Mod+6".focus-workspace = "5";
            "Mod+7".focus-workspace = "6";
            "Mod+8".focus-workspace = "7";
            "Mod+9".focus-workspace = "8";
            "Mod+0".focus-workspace = "9";

            "Mod+Shift+1".move-column-to-workspace = "0";
            "Mod+Shift+2".move-column-to-workspace = "1";
            "Mod+Shift+3".move-column-to-workspace = "2";
            "Mod+Shift+4".move-column-to-workspace = "3";
            "Mod+Shift+5".move-column-to-workspace = "4";
            "Mod+Shift+6".move-column-to-workspace = "5";
            "Mod+Shift+7".move-column-to-workspace = "6";
            "Mod+Shift+8".move-column-to-workspace = "7";
            "Mod+Shift+9".move-column-to-workspace = "8";
            "Mod+Shift+0".move-column-to-workspace = "9";

            "Mod+F".maximize-column = [ ];
            "Mod+Shift+F".fullscreen-window = [ ];

            "Mod+H".focus-column-left = [ ];
            "Mod+L".focus-column-right = [ ];
            "Mod+K".focus-window-up = [ ];
            "Mod+J".focus-window-down = [ ];

            "Mod+Left".focus-column-left = [ ];
            "Mod+Right".focus-column-right = [ ];
            "Mod+Up".focus-window-up = [ ];
            "Mod+Down".focus-window-down = [ ];

            "Mod+WheelScrollRight".focus-column-right = [ ];
            "Mod+WheelScrollLeft".focus-column-left = [ ];
            "Mod+Ctrl+WheelScrollRight".move-column-right = [ ];
            "Mod+Ctrl+WheelScrollLeft".move-column-left = [ ];

            "Mod+Shift+WheelScrollDown".focus-column-right = [ ];
            "Mod+Shift+WheelScrollUp".focus-column-left = [ ];
            "Mod+Ctrl+Shift+WheelScrollDown".move-column-right = [ ];
            "Mod+Ctrl+Shift+WheelScrollUp".move-column-left = [ ];

            "Mod+Minus".set-column-width = "-10%";
            "Mod+Equal".set-column-width = "+10%";
            "Mod+Shift+Minus".set-window-height = "-10%";
            "Mod+Shift+Equal".set-window-height = "+10%";
          };
        };
      };
    };
}
