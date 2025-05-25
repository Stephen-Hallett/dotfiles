# Specific config for work WSMacL, inherits common (and subsequently core) packages

{ pkgs, ... }: {
  imports = [ ./../common/home.nix ];

  home = { packages = with pkgs; [ docker docker-compose docker-buildx ]; };

  work-packages = { git-work.enable = true; };

  unix-packages = { alacritty.enable = true; };
}
