{ self, inputs, ... }: {

  flake.nixosConfigurations.korgo = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { inherit inputs self; };
    modules = [
      self.nixosModules.korgoConfig
    ];
  };
}
