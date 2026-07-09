{ self, inputs, ... }: {
  flake.nixosModules.minecraft = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      inputs.freesm-launcher.packages.x86_64-linux.default
    ];
  };
}
