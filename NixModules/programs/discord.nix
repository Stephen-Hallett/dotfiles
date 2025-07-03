{ pkgs, pkgs-unstable, lib, config, ... }: {
  options = {
    nix-config.discord.enable = lib.mkEnableOption "enable discord";
  };

  config = lib.mkIf config.nix-config.discord.enable {
    environment.systemPackages = with pkgs; [
      discord
      betterdiscordctl
      catppuccin-discord
    ];
  };
}

