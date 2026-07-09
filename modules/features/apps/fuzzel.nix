{ self, inputs, ... }: {
  flake.nixosModules.fuzzel = { config, lib, pkgs, ... }: {
    environment.systemPackages = [ pkgs.fuzzel ];

    environment.etc."xdg/fuzzel/fuzzel.ini".text = ''
      [main]
      font=Iosevka Nerd Font
      placeholder=Search...

      [colors]
      background = "2b2421dd";
      text = "f4edd8ff";
      match = "e78a4eff";
      selection = "474037ff";
      selection-text = "f4edd8ff";
      selection-match = "ea9960ff";
      border = "a9b665ff";

      [border]
      width=2
      radius=8
    '';
  };
}
