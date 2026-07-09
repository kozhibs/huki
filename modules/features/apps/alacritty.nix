{ self, inputs, ... }: {
  flake.nixosModules.alacritty = { pkgs, lib, ... }: {
    programs.alacritty = {
      enable = true;
    };

    hjem.users.taito.files.".config/alacritty/alacritty.toml".text = ''
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
