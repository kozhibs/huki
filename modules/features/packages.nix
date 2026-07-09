{ self, inputs, ... }: {
  flake.nixosModules.packages = { config, pkgs, lib, ... }: {
    programs.nix-ld.enable = true;

    services.displayManager.sddm.enable = true;

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
