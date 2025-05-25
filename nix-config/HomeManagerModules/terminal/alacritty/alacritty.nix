{ config, pkgs, lib, ... }: {
  imports = [ ./themes/catppuccin_macchiato.nix ];

  options = {
    unix-packages.alacritty.enable = lib.mkEnableOption "enable alacritty";
  };

  config = lib.mkIf config.unix-packages.alacritty.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        env = { TERM = "xterm-256color"; };

        selection = { save_to_clipboard = true; };

        window = {
          dynamic_padding = false;
          opacity = 0.97;
          option_as_alt = "Both";
          decorations = "transparent";

          padding = {
            x = 5;
            y = 20;
          };
        };
        font = {
          size = 14;
          normal = {
            family = "FantasqueSansM Nerd Font";
            style = "Regular";
          };

          bold = {
            family = "FantasqueSansM Nerd Font";
            style = "Bold";
          };

          bold_italic = {
            family = "FantasqueSansM Nerd Font";
            style = "Bold Italic";
          };

          italic = {
            family = "FantasqueSansM Nerd Font";
            style = "Italic";
          };
        };
      };
    };
  };
}
