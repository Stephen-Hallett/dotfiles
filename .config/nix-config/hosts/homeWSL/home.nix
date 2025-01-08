{
  pkgs,
  lib,
  homePC,
  ...
}:
{
  imports = [ ./../shared/home.nix ];

  home = {
    packages = with pkgs; [];
  };
}
