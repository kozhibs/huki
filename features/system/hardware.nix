{ self, inputs, ... }: {
  flake.nixosModules.hardware-tweaks = { pkgs, ... }: {
    hardware = {
      opengl.enable = true;
      graphics = {
        enable = true;
        extraPackages = with pkgs; [
          intel-media-driver
          intel-vaapi-driver
          vaapiVdpau
          libvdpau-va-gl
        ];
      };
    };
    services = {
      thermald = {
        enable = true;
      };
      tlp = {
        enable = true;
      };
    };
  };
}
