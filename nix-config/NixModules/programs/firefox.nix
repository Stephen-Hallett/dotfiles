{ pkgs, lib, config, ... }: {
  options = {
    nix-config.firefox.enable = lib.mkEnableOption "enable firefox";
  };

  config = lib.mkIf config.nix-config.firefox.enable {
    environment.systemPackages = with pkgs; [ firefox ];
  };
}
