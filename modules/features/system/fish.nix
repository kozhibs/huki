{ self, inputs, ... }: {
  flake.nixosModules.fish = { pkgs, lib, ... }: {
    programs.fish.enable = true;

    hjem.users.taito.xdg.config.files."fish/config.fish".text = ''
      set -g fish_greeting ""

      set -g fish_color_command white
      set -g fish_color_param brwhite
      set -g fish_color_option brblack
      set -g fish_color_quote white
      set -g fish_color_error brwhite
      set -g fish_color_operator brwhite
      
      alias ls "eza"
      starship init fish | source
    '';
  };
}
