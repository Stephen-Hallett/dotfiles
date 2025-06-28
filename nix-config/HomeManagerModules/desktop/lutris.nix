{ config, pkgs, lib, ... }: {
  imports = [ ];

  options = {
    nix-packages.lutris.enable = lib.mkEnableOption "enable lutris";
  };

  config = lib.mkIf config.nix-packages.lutris.enable {
    programs.lutris = { enable = true; };
  };
}
