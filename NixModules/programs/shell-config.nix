{ pkgs, lib, config, ... }: {
  options = {
    nix-config.shell-config.enable = lib.mkEnableOption "enable shell config";
  };

  config = lib.mkIf config.nix-config.shell-config.enable {
    programs.zsh.enable = true;
    users.users.stephen.shell = pkgs.zsh;

    environment.systemPackages = with pkgs; [ vim tree unzip wget zip ];
  };
}
