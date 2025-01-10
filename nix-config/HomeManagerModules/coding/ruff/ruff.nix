{
  pkgs,
  pkgs-unstable,
  lib,
  config,
  ...
}:
{
  options = {
    core-packages.ruff.enable = lib.mkEnableOption "enable core-packages.ruff";
  };

  config = lib.mkIf config.core-packages.ruff.enable {
    programs.ruff = {
      enable = true;
      package = pkgs-unstable.ruff;
      settings = pkgs.lib.importTOML ./ruff.toml;
    };
  };
}