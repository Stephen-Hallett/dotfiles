{ lib, config, ... }: {
  options = { nix-config.thunar.enable = lib.mkEnableOption "enable thunar"; };

  config = lib.mkIf config.nix-config.thunar.enable {
    programs.thunar.enable = true;
    services.gvfs.enable = true;
    services.tumbler.enable = true;
  };
}
