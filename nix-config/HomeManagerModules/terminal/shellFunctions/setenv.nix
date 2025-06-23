{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.core-packages.shellfunctions.enable {
    home.packages = [
      (pkgs.writeShellScriptBin "setenv" ''
        set -a
        if [ -f .env ]; then
          source .env
        else
          echo -e "\033[0;31m.env file not found in current directory\033[0m"
        fi
        set +a
      '')
    ];
  };
}
