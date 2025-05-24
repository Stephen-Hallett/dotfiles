{ pkgs, lib, config, ... }: {
  options = {
    nix-config.home-manager.enable = lib.mkEnableOption "enable home-manager";
  };

  config = lib.mkIf config.nix-config.home-manager.enable {
    environment.systemPackages = with pkgs; [ home-manager ];
  };
}
