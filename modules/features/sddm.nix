{ self, inputs, ... }: {
  flake.nixosModules.sddm = { config, pkgs, lib, ... }: {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      settings = {
        Theme = {
          CursorTheme = "Bibata-Modern-Classic";
          CursorSize = 24;
        };
      };
      extraPackages = with pkgs; [
        qt6.qt5compat
        qt6.qtdeclarative
        qt6.qtmultimedia
        bibata-cursors
      ];
    };

    console.font = lib.mkDefault "Lat2-Terminus16";

    qt.enable = true;

    programs.qylock = {
      enable = true;
      theme = "field";
      sddm.enable = true;
      quickshell.enable = true;
    };
  };
}
