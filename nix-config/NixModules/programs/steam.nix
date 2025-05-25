{ lib, config, pkgs, ... }: {
  options = { nix-config.steam.enable = lib.mkEnableOption "enable steam"; };

  config = lib.mkIf config.nix-config.steam.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      gamescopeSession.enable = true;
      extraCompatPackages = with pkgs; [ proton-ge-bin ];
    };
  };
}
