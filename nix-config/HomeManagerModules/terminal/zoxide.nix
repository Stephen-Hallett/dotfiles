{ lib, config, ... }: {
  options = {
    core-packages.zoxide.enable = lib.mkEnableOption "enable zoxide";
  };

  config = lib.mkIf config.core-packages.zoxide.enable {
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
