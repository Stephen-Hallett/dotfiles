{ pkgs, lib, config, ... }: {
  options = { nix-config.sddm.enable = lib.mkEnableOption "enable sddm"; };
  config = lib.mkIf config.nix-config.sddm.enable {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
  };
}
