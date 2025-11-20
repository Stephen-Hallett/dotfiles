{ pkgs, lib, config, ... }: {
  options = {
    core-packages.firefox.enable = lib.mkEnableOption "enable firefox";
  };

  config = lib.mkIf config.core-packages.firefox.enable {
    programs.firefox = { enable = true; };
  };
}
