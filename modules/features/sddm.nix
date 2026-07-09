{ self, inputs, ... }: {
  flake.nixosModules.sddm = { config, pkgs, lib, ... }: {
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;

    programs.qylock = {
      enable = true;
      theme = "field";
      sddm.enable = true;
      quickshell.enable = true;
    };
  };
}
