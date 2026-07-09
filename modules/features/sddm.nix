{ self, inputs, ... }: {
  flake.nixosModules.sddm = { config, pkgs, lib, ... }: {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      extraPackages = with pkgs; [
        qt6.qt5compat
        qt6.qtdeclarative
        qt6.qtmultimedia
      ];
    };

    programs.qylock = {
      enable = true;
      theme = "field";
      sddm.enable = true;
      quickshell.enable = true;
    };
  };
}
