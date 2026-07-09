{ self, inputs, ... }: {
  flake.nixosModules.alacritty = { pkgs, lib, ... }: {
    hjem.users.taito.xdg.config.files."alacritty/alacritty.toml".text = ''
      [window]
      opacity = 0.9
      decorations = "none"

      [font.normal]
      family = "Iosevka Term Nerd Font"
      style = "DemiBold"

      [font.italic]
      family = "Iosevka Term Nerd Font"
      style = "Italic"

      [font.bold]
      family = "Iosevka Term Nerd Font"
      style = "Bold"
    '';
  };
}
