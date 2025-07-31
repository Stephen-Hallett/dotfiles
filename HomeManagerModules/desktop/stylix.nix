{ pkgs, pkgs-unstable, lib, config, ... }: {
  options = {
    nix-packages.stylix.enable = lib.mkEnableOption "enable stylix";
  };

  config = lib.mkIf config.nix-packages.stylix.enable {
    stylix = {
      enable = true;
      polarity = "dark";

      base16Scheme =
        "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";

      targets = {
        alacritty.enable = false;
        starship.enable = false;
        spicetify.enable = false;
      };

      # Stylix needs an image for some reason
      image = ../../wallpaper.jpeg;

      fonts = {
        monospace = {
          package = pkgs-unstable.nerd-fonts.fantasque-sans-mono;
          name = "Fantasque Sans Mono";
        };
        sizes = {
          applications = 10;
          terminal = 10;
          desktop = 8;
          popups = 8;
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
