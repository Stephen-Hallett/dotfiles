{ pkgs, lib, config, ... }: {
  options = {
    core-packages.vscode-config.enable =
      lib.mkEnableOption "enable vscode-config";
  };

  config = lib.mkIf config.core-packages.vscode-config.enable {
    home.activation.vscode-config = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      export PATH=${pkgs.curl}/bin:$PATH
      ${pkgs.bash}/bin/bash ${./vscode-config.sh}
    '';
  };
}
