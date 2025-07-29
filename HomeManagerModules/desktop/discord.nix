{ pkgs, pkgs-unstable, lib, config, ... }: {
  options = {
    unix-packages.discord.enable = lib.mkEnableOption "enable discord";
  };

  config = lib.mkIf config.unix-packages.discord.enable {
    home.packages = with pkgs; [ discord catppuccin-discord ];
  };
}
