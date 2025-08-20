{ config, pkgs, pkgs-unstable, lib, ... }: {
  imports = [ ];

  options = {
    nix-packages.postman.enable = lib.mkEnableOption "enable postman";
  };

  config = lib.mkIf config.nix-packages.postman.enable {
    home.packages = with pkgs-unstable; [ postman ];
  };
}
