{ lib, config, ... }: {
  options = { nix-config.steam.enable = lib.mkEnableOption "enable steam"; };

  config =
    lib.mkIf config.nix-config.steam.enable { programs.steam.enable = true; };
}
