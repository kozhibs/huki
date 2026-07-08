{ self, inputs, ... }: {
  flake.nixosModules.hjem = { config, lib, pkgs, ... }: {
    imports = [
      self.nixosModules.helix
    ];

    hjem = {
    clobberByDefault = true;
    users.yourusername = {
      enable = true;
      directory = "/home/yourusername";
      user = "yourusername";
   };
  };
 };
}
