{ lib, config, ... }: {

  options = {
    nix-config.networking.enable = lib.mkEnableOption "enable networking";
  };

  config = lib.mkIf config.nix-config.networking.enable {
    networking.networkmanager.enable = true;
    networking.enableIPv6 = false;
    networking.networkmanager.wifi.scanRandMacAddress = false;
  };
}
