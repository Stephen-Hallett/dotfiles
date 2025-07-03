{ pkgs, lib, config, ... }: {
  options = {
    nix-config.google-chrome.enable = lib.mkEnableOption "enable firefox";
  };

  config = lib.mkIf config.nix-config.google-chrome.enable {
    environment.systemPackages = with pkgs; [ google-chrome ];
    programs.chromium = {
      enable = true;
      extensions = [ "cjpalhdlnbpafiamejdnhcphjbkeiagm" ];
    };
  };
}
