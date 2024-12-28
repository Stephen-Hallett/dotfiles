{
  pkgs,
  lib,
  macbook,
  ...
}:
{
  imports = [ ./../common/home.nix ];

  home = {
    username = "${macbook.user}";
    homeDirectory = "/Users/${macbook.user}";

    file = {
    };

    packages = with pkgs; [
      wget
      font-awesome
    ];
  };

  fonts.fontconfig.enable = true;
}
