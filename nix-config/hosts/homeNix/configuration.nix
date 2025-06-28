{ config, pkgs, inputs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./../core/configuration.nix
    ./hardware-configuration.nix
  ];

  nix-config = {
    bluetooth.enable = true;
    gnome.enable = true;
    steam.enable = true;
    tailscale.enable = false; # Reconfigure with with sops integration
    networking.enable = true;
    coding.enable = true;
    docker.enable = true;
    fonts.enable = true;
    neovim.enable = true;
    firefox.enable = true;
    stylix.enable = true;
    google-chrome.enable = true;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.extraModulePackages = with config.boot.kernelPackages; [ ];
  boot.loader.grub.enable = false;

  hardware.enableAllFirmware = true;
  # For my Nvidia GPU
  hardware.opengl = { enable = true; };
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement = {
      enable = false;
      finegrained = false;
    };

    open = false;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  networking.hostName = "stevohome"; # Define your hostname.
  #networking.wireless.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
}
