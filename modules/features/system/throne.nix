{ self, inputs, ... }: {
  flake.nixosModules.throne = { pkgs, ... }: {
    programs.throne = {
      enable = true;
      enableTunMode = true;
    };
  };
}
