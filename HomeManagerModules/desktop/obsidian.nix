{ config, pkgs, pkgs-unstable, lib, ... }: {
  imports = [ ];

  options = {
    common-packages.obsidian.enable = lib.mkEnableOption "enable obsidian";
  };

  config = lib.mkIf config.common-packages.obsidian.enable {
    home.packages = with pkgs-unstable; [ obsidian ];
  };
}
