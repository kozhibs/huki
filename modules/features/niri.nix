{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs; 
      settings = {
        spawn-at-startup = [
          (lib.getExe self'.packages.myNoctalia)
        ];

        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

        input.keyboard.xkb.layout = "us,ru";

        layout.gaps = 5;

        focus-ring = {
          width = 2;
          active-color = "#7b8c73";
        };

        binds = {
          "Mod+T".spawn-sh = lib.getExe pkgs.alacritty;
          "Mod+Q".close-window = [];
          "Mod+B".spawn-sh = lib.getExe pkgs.firefox;
          "Mod+Shift+S".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";
        };
      };
    };
  };
}
