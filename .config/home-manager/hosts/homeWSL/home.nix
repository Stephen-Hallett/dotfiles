{
  pkgs,
  lib,
  homePC,
  ...
}:
{
  imports = [ ./../shared/home.nix ];

  home = {
    username = "${homePC.user}";
    homeDirectory = "/home/${homePC.user}";

    packages = with pkgs; [];
  };
}
