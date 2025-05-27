{ lib, config, pkgs, ... }: {
  options = { nix-config.steam.enable = lib.mkEnableOption "enable steam"; };

  config = lib.mkIf config.nix-config.steam.enable {
    programs = {
      steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
        gamescopeSession.enable = true;
        extraCompatPackages = with pkgs; [ proton-ge-bin ];
      };

      gamemode.enable = true;

      gamescope.enable = true;
      gamescope.capSysNice = true;
      gamescope.args = [
        "--adaptive-sync" # VRR support
        "--hdr-enabled" # HDR
        "--rt" # Real time scheduling
        "--force-grab-cursor"
        "-e"
        "-f" # fullscreen
        "-W 1920"
        "-H 1080"
        "-r 60" # refresh rate
        # "-O HDMI-A-1" # Monitor
      ];
    };
  };
}
