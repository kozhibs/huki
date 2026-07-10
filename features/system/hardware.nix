{ self, inputs, ... }: {
  flake.nixosModules.hardware-tweaks = { pkgs, ... }: {
    hardware = {
      opengl.enable = true;
      graphics = {
        enable = true;
        extraPackages = with pkgs; [
          intel-media-driver
          vaapiIntel
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

        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balanced";

        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;
      };
    };
  };
}
