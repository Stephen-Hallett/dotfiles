{ lib, config, pkgs, ... }: {

  config = lib.mkIf config.nix-config.gaming.enable {
    environment.systemPackages = with pkgs; [ bolt-launcher runelite ];
  };
}
