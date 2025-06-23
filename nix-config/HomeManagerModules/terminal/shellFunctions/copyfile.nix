{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.core-packages.shellfunctions.enable {
    home.packages = [
      (pkgs.writeShellScriptBin "copyfile" ''
        emulate -L zsh
        clipcopy $1
      '')
    ];
  };
}
