{ self, inputs, ... }: {
  flake.nixosModules.packages = { config, pkgs, lib, ... }: {
    programs.nix-ld.enable = true;

    programs.sddm.enable = true;
    programs.quickshell.enable = true;

    environment.systemPackages = with pkgs; [
      ripgrep
      eza
      zoxide
      sddm
      fuzzel
      fish
      nerd-fonts.iosevka
      starship     
    ];
  };
}
