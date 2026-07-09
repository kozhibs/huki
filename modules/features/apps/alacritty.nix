{ self, inputs, ... }: {
  flake.nixosModules.alacritty = { pkgs, lib, ... }: {
    hjem.users.taito.xdg.config.files."alacritty/alacritty.toml".text = ''
      [window]
      opacity = 0.9
      decorations = "none"

      [font.normal]
      family = "IosevkaTerm Nerd Font"
      style = "DemiBold"

      [font.italic]
      family = "IosevkaTerm Nerd Font"
      style = "Italic"

      [font.bold]
      family = "IosevkaTerm Nerd Font"
      style = "Bold"
    '';
  };
}
