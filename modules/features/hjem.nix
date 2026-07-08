{ inputs, ... }: {
  flake.nixosModules.hjem = { config, ... }: {
    imports = [
      inputs.hjem.nixosModules.default
    ];

    config = {
      hjem = {
        users.taito = {
          enable = true;
          directory = "/home/taito";
          user = "taito";
        };

        clobberByDefault = true;
      };
    };
  };
}
