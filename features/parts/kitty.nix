{ self, inputs, ... }: {
  flake.nixosModules.kitty = { pkgs, ... }: {
    hjem.users.taito.xdg.config.files."kitty/kitty.conf".text = ''
      hide_window_decorations yes
      window_border_width 0
      draw_minimal_borders yes
    '';
  };
}
