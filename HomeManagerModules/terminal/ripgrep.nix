{ lib, config, ... }: {
  options = {
    core-packages.ripgrep.enable = lib.mkEnableOption "enable ripgrep";
  };

  config = lib.mkIf config.core-packages.ripgrep.enable {
    programs.ripgrep = { enable = true; };
  };
}
