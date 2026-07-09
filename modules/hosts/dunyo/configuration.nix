{ self, inputs, ... }: {

  flake.nixosModules.dyukoConfiguration = { pkgs, lib, ... }: {
    imports = [
      self.nixosModules.dyukoHardware
      self.nixosModules.niri
      self.nixosModules.sddm
      self.nixosModules.nh
      self.nixosModules.hjem
      self.nixosModules.packages 
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    boot.kernelPackages = pkgs.linuxPackages_latest;

    networking.hostName = "dunyo";
    networking.networkmanager.enable = true;
  
    nix.settings = {
      experimental-features = [ "nix-command" "flakes" ];
   };

    time.timeZone = "Europe/Moscow";
    i18n.defaultLocale = "en_US.UTF-8";

    services.xserver.enable = true;

    services.displayManager.sddm.enable = true;
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

    users.users."taito" = {
      isNormalUser = true;
      description = "taito";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        thunderbird
      ];
    };

    programs.firefox.enable = true;

    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
      helix
      git
      wget
    ];

    system.stateVersion = "26.11";
  };
}
