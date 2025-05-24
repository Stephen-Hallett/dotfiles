{ personal, config, ... }:

{
  imports = [ ./../../NixModules ];

  nix.settings.trusted-users = [ "root" "@wheel" ];

  nix-config = {
    bluetooth.enable = true;
    coding.enable = true;
    docker.enable = true;
    firefox.enable = true;
    fonts.enable = true;
    home-manager.enable = true;
    neovim.enable = true;
    networking.enable = true;
    shell-config.enable = true;
    swap.enable = true;
  };

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Delete configurations older than 30 days
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Set your time zone.
  time.timeZone = "${personal.timeZone}";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_NZ.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_NZ.UTF-8";
    LC_IDENTIFICATION = "en_NZ.UTF-8";
    LC_MEASUREMENT = "en_NZ.UTF-8";
    LC_MONETARY = "en_NZ.UTF-8";
    LC_NAME = "en_NZ.UTF-8";
    LC_NUMERIC = "en_NZ.UTF-8";
    LC_PAPER = "en_NZ.UTF-8";
    LC_TELEPHONE = "en_NZ.UTF-8";
    LC_TIME = "en_NZ.UTF-8";
  };

  system.stateVersion = "24.11"; # Did you read the comment?

}
