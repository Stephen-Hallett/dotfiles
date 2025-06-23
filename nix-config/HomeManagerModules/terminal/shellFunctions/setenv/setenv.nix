{ pkgs, lib, config, ... }: {
  config = lib.mkIf config.core-packages.shellfunctions.enable {
    home.packages = with pkgs;
      [
        (writeShellApplication {
          name = "setenv";
          runtimeInputs = [ ];
          text = buitlins.readFile ./setenv.sh;
        })
      ];
  };
}
