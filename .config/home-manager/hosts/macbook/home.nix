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
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];
  };

  fonts.fontconfig.enable = true;
}
