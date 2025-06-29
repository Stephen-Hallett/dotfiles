{ lib, ... }: {
  options = { nix-config.gaming.enable = lib.mkEnableOption "enable gaming"; };
  imports = [ ./runescape/runescape.nix ./steam.nix ];
}
