# Specific config for work WSMacL, inherits common (and subsequently core) packages

{ pkgs, ... }: {
  imports = [ ./../common/home.nix ];

  home = { packages = with pkgs; [ ]; };
}
