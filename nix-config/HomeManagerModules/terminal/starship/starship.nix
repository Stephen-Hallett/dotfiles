{ pkgs, lib, config, ... }: {
  options = {
    core-packages.starship.enable = lib.mkEnableOption "enable starship";
  };

  config = lib.mkIf config.core-packages.starship.enable {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = pkgs.lib.importTOML ./starship.toml;
    };
  };
}
