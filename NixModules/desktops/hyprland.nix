{ pkgs, lib, config, ... }: {
  options = {
    nix-config.hyprland.enable = lib.mkEnableOption "enable hyprland";
  };

  config = lib.mkIf config.nix-config.hyprland.enable {
    programs.hyprland.enable = true;
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    environment.systemPackages = with pkgs; [
      kitty
      cliphist
      ghostty
      wl-clipboard
      xdg-desktop-portal-gtk
      xwayland
      libnotify
    ];
  };
}
