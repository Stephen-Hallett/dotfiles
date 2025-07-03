{ lib, config, ... }: {
  options = { core-packages.bat.enable = lib.mkEnableOption "enable bat"; };

  config = lib.mkIf config.core-packages.bat.enable {
    programs.bat = { enable = true; };
  };
}
