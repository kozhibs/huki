{ self, inputs, ... }: {
  flake.nixosModules.sddm = { config, pkgs, lib, ... }: {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      settings = {
        Theme = {
          CursorTheme = "Adwaita";
        };
      };
      extraPackages = with pkgs; [
        qt6.qt5compat
        qt6.qtdeclarative
        qt6.qtmultimedia
      ];
    };

    qt.enable = true;

    programs.qylock = {
      enable = true;
      theme = "field";
      sddm.enable = true;
      quickshell.enable = true;
    };
  };
}
