{ lib, config, pkgs-unstable, ... }: {
  options = {
    common-packages.claude-code.enable =
      lib.mkEnableOption "enable claude code";
  };

  config = lib.mkIf config.common-packages.claude-code.enable {
    programs.claude-code = {
      enable = true;
      package = pkgs-unstable.claude-code;
    };
  };
}
