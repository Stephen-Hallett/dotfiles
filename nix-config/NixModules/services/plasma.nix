{ pkgs, lib, config, ... }: {
  options = { nix-config.plasma.enable = lib.mkEnableOption "enable plasma"; };

  config = lib.mkIf config.nix-config.plasma.enable {

    # Enable the Plasma 6 Desktop Environment.
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;
    services.desktopManager.plasma6.enable = true;

    systemd.services."getty@tty1".enable = false;
    systemd.services."autovt@tty1".enable = false;

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      plasma-browser-integration
      konsole
      elisa
      gwenview
      kate
      ark
    ];

  };
}
