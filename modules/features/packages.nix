{ self, inputs, ... }: {
  flake.nixosModules.packages = { config, pkgs, lib, ... }: {
    programs.nix-ld.enable = true;

    environment.systemPackages = with pkgs; [
      ripgrep
      eza
      zoxide
      fuzzel
      fish
      starship     
    ];
  };
}
