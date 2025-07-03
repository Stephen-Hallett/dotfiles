{ lib, config, ... }: {
  options = { nix-config.docker.enable = lib.mkEnableOption "enable docker"; };

  config = lib.mkIf config.nix-config.docker.enable {
    virtualisation.docker = { enable = true; };
  };
}
