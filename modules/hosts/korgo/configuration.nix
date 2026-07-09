{ self, inputs, ... }: {
  flake.nixosModules.korgoConfig = { config, pkgs, ... }: {
    imports =
      [
        ./hardware-configuration.nix
      ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "korgo";
    networking.networkmanager.enable = true;

    time.timeZone = "Europe/Moscow";
    i18n.defaultLocale = "en_US.UTF-8";

    services.xserver.enable = true;

    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };

    services.printing.enable = true;

    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };  
    services.libinput.enable = true;

    users.users."gyuna" = {
      isNormalUser = true;
      description = "gyuna";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        thunderbird
      ];
    };

    programs.firefox.enable = true;

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
      vim
      git
      wget
    ];

    system.stateVersion = "26.11";
  };
}
