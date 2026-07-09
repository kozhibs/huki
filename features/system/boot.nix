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
          limine = {
            enable = true;
            maxGenerations = 10;
          };
        };
      };
    };
}
