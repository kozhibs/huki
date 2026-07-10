{ self, inputs, ... }: {
  flake.nixosModules.hardware-tweaks = { pkgs, ... }: {
    hardware = {
      opengl.enable = true;
      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
          intel-media-driver
          intel-vaapi-driver
          libva-vdpau-driver
          libvdpau-va-gl
        ];
      };
    };
    services = {
      flatpak = {
        enable = true;
      };
      thermald = {
        enable = true;
      };
      tlp = {
        enable = true;
      };
    };
  };
}
