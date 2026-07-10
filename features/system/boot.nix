{ self, inputs, ... }: {
  flake.nixosModules.boot =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    {
      boot = {
        kernelModules = [ "uinput" ];
        loader = {
          systemd-boot.enable = true;
          efi.canTouchEfiVariables = true;
          limine = {
            enable = true;
            maxGenerations = 10;
          };
        };
      };
    };
}
