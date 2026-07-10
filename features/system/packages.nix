{ self, inputs, ... }: {
  flake.nixosModules.packages =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    {
      programs.nix-ld.enable = true;

      services.displayManager.sddm.enable = true;

      environment.systemPackages = with pkgs; [
        ripgrep
        eza
        zoxide
        yazi

        kdePackages.qtwayland
        kdePackages.qt5compat
        kdePackages.qtmultimedia
        kdePackages.sddm

        qt6.qtdeclarative
        qt6.qt5compat
        qt5.qtgraphicaleffects
        qt5.qtquickcontrols2
        qt6.qtmultimedia

        gst_all_1.gst-plugins-base
        gst_all_1.gst-plugins-good
        gst_all_1.gst-plugins-bad
        gst_all_1.gst-plugins-ugly

        fzf

        fuzzel
        fish
        flatpak
        throne
        alacritty
        kitty
        starship
        nixfmt
        nil
        htop
        limine
        fastfetch
        pfetch
      ];

      services.flatpak.enable = true;

      fonts.packages = with pkgs; [
        nerd-fonts.iosevka
        nerd-fonts.iosevka-term
      ];
      fonts.fontconfig.enable = true;
    };
}
