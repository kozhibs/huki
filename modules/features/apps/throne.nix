{ self, inputs, ... }: {
  flake.nixosModules.throne = { pkgs, ... }: {
    programs.throne = {
      enable = true;
      tunMode.enable = true;
    };
  };
}
