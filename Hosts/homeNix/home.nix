# Specific config for my home wsl, inherits personal (and subsequently common & core) packages

{ pkgs, ... }: {
  imports = [ ./../personal/home.nix ];

  home = { packages = with pkgs; [ ]; };

  unix-packages = { alacritty.enable = true; };
  common-packages = { tmux.enable = true; };
  nix-packages = {
    lutris.enable = false;
    hyprland = {
      enable = true;
      monitor-setup = "double";
      mouse-sensitivity = "-0.1";
    };
    rofi.enable = true;
    stylix.enable = true;
  };

}
