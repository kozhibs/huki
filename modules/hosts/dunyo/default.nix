{ self, inputs, ... }: {

  flake.nixosConfigurations.dunyo = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { inherit inputs self; };
    modules = [
      self.nixosModules.dunyoConfig  
    ];
  };

}
