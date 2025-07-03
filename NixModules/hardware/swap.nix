{ lib, config, ... }: {
  options = { nix-config.swap.enable = lib.mkEnableOption "enable swap"; };

  config = lib.mkIf config.nix-config.swap.enable {
    swapDevices = [{
      device = "/swapfile";
      size = 16 * 1024;
    }];
  };
}
