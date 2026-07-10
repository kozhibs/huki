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
          efi.canTouchEfiVariables = true;
          limine = {
            enable = true;
            maxGenerations = 10;
          };
        };
      };
    };
}
