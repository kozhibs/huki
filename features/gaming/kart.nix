{ self, inputs, ... }: {
  flake.nixosModules.kart = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      supertuxkart
    ];
  };
}
