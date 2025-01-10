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

    packages = with pkgs; [];
  };

  mac-packages = {
    alacritty.enable = true;
  };
}
