{
  pkgs,
  lib,
  macbook,
  ...
}:
{
  imports = [ ./../shared/home.nix ];

  home = {
    username = "${macbook.user}";
    homeDirectory = "/Users/${macbook.user}";

    file = {
    };

    packages = with pkgs; [];
  };

  fonts.fontconfig.enable = true;
}
