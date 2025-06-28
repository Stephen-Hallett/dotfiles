{ pkgs, pkgs-unstable, lib, config, ... }: {
  options = { nix-config.stylix.enable = lib.mkEnableOption "enable stylix"; };

  config = lib.mkIf config.nix-config.stylix.enable {
    environment.systemPackages = with pkgs; [ base16-schemes ];

    stylix = {
      enable = true;
      polarity = "dark";

      base16Scheme =
        "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";

      targets = { grub.enable = false; };

      # Stylix needs an image for some reason
      image = ../../../fuji-palette.png;

      fonts = {
        monospace = {
          package = pkgs-unstable.nerd-fonts.fantasque-sans-mono;
          name = "Fantasque Sans Mono";
        };
      };

      cursor = {
        package = pkgs.catppuccin-cursors.macchiatoDark;
        name = "catppuccin-macchiato-dark-cursors";
        size = 12;
      };

      opacity = {
        applications = 0.99;
        desktop = 0.99;
        terminal = 0.99;
        popups = 0.99;
      };
    };
  };
}
