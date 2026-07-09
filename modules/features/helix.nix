{ self, inputs, ... }: {
  flake.nixosModules.helix = { config, lib, pkgs, ... }: {
    programs.alacritty.enable = true;

    hjem.users.taito.xdg.config.files."helix/config.toml".text = ''
      theme = "autumn"

      [editor]
      line-number = "relative"
      cursorline = true
    '';
  };
}
