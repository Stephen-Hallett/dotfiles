{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.core-packages.shellfunctions.enable {
    home.packages = [
      (pkgs.writeShellScriptBin "activate" ''
        source "$1"/bin/activate
      '')
    ];
  };
}
