{ pkgs, lib, config, ... }: {
  options = {
    nix-config.desktop.enable = lib.mkEnableOption "enable desktop";
  };

  config = lib.mkIf config.nix-config.desktop.enable {
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "nz";
      variant = "";
    };
  };
}
