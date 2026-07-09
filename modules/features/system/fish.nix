{ self, inputs, ... }: {
  flake.nixosModules.fish = { pkgs, lib, ... }: {
    programs.fish.enable = true;

    hjem.users.taito.xdg.config.files."fish/config.fish".text = ''
      set -g fish_greeting ""
      alias ls "eza"
      alias nh os switch "nos"
      starship init fish | source
    '';
  };
}
