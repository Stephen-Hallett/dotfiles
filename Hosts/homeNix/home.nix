# Specific config for my home wsl, inherits personal (and subsequently common & core) packages

{ pkgs, ... }: {
  imports = [ ./../personal/home.nix ];

  home = { packages = with pkgs; [ ]; };

  unix-packages = { alacritty.enable = true; };
  common-packages = { tmux.enable = true; };
  nix-packages = { lutris.enable = false; };

}
