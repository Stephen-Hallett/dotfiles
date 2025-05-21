# Config for packages shared by personal machines, inherits common (and subsequently core) packages

{ pkgs, ... }: {
  imports = [ ./../common/home.nix ];

  home = { packages = with pkgs; [ vsce ]; };
}
