{ pkgs, pkgs-unstable, lib, config, ... }: {
  options = { nix-config.coding.enable = lib.mkEnableOption "enable coding"; };

  config = lib.mkIf config.nix-config.coding.enable {
    nixpkgs.config = {
      allowUnfree = true;
      permittedInsecurePackages = [ "electron-25.9.0" ];
    };

    environment.systemPackages = with pkgs; [
      vscode
      git
      gnumake
      pkgs-unstable.nodejs
      (python313.withPackages (ps: with ps; [ requests ]))
    ];
  };
}
