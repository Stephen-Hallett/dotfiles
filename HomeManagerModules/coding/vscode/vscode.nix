{ pkgs, lib, config, ... }: {
  options = {
    core-packages.vscode.enable =
      lib.mkEnableOption "enable vscode";
  };

  config = lib.mkIf config.core-packages.vscode.enable {
    programs.vscode = { enable = true; };
    home.activation.vscode = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      ${pkgs.curl}/bin/curl -fsSL https://github.com/Stephen-Hallett/dotfiles/releases/latest/download/vscode-config.vsix -o /tmp/vscode-config.vsix
      ${pkgs.vscode}/bin/code --install-extension /tmp/vscode-config.vsix
    '';
  };
}
