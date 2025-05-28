{ pkgs, ... }: {
  imports = [ ./../vm/home.nix ];

  home = { packages = with pkgs; [ nixfmt-classic ]; };

  unix-packages = { alacritty.enable = true; };
  common-packages = { tmux.enable = true; };
}
