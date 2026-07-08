{ self, inputs, ... }: {
  flake.nixosModules.packages = { config, pkgs, lib, ... }: {
    programs.nix-ld.enable = true;

    environment.systemPackages = with pkgs; {
      ripgrep
      zoxide
      eza
      ld
      fuzzel
      fish
      starship     
    };
  };
}
