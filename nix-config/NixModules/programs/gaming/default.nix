{ lib, ... }: {
  options = { nix-config.gaming.enable = lib.mkEnableOption "enable gaming"; };
  imports = [ ./runescape.nix ./steam.nix ];
}
