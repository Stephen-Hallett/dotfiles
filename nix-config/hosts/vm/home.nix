# Config for packages shared by personal machines, inherits common (and subsequently core) packages

{ pkgs, ... }: {
  imports = [ ./../core/home.nix ./../linux/home.nix ];

  home = { packages = with pkgs; [ ]; };
}
