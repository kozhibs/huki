{ self, inputs, ... }: {

  flake.nixosConfiguration = inputs.nixpkgs.lib.nixosSystem {
    imports = [
      self.nixosModules.korgoConfig
    ];
  };
}
