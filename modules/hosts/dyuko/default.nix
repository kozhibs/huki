{ self, inputs, ... }: {

  flake.nixosConfigurations.dyuko = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.dyukoConfiguration  
    ];
  };

}
