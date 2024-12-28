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
      (python313.withPackages (ps: with ps; [ requests ]))
      font-awesome
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];
  };

  fonts.fontconfig.enable = true;
}
