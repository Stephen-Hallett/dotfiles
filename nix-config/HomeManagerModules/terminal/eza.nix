{ lib, config, ... }: {
  options = { core-packages.eza.enable = lib.mkEnableOption "enable eza"; };

  config = lib.mkIf config.core-packages.eza.enable {
    programs.eza = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
