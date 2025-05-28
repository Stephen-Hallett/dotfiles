{ pkgs, lib, config, ... }: {
  options = {
    nix-config.code-server.enable = lib.mkEnableOption "enable code-server";
  };

  config = lib.mkIf config.nix-config.code-server.enable {
    services.code-server = {
      enable = true;
      port = 4200;
      user = "stephen";
      host = "0.0.0.0";

      auth = "password";
      hashedPassword =
        "$argon2i$v=19$m=4096,t=3,p=1$dnh6SGtKZmVyRkFvK2Q0WXdVL1ZVTGFLVWV3PQ$O9bPYzH3KUnkatqzzxBkctbKxif4GgSF2wyb2E5LTnk";

      disableGettingStartedOverride = true;
      disableUpdateCheck = true;

      package = pkgs.vscode-with-extensions.override {
        vscode = pkgs.code-server;
        vscodeExtensions = with pkgs.vscode-extensions; [
          charliermarsh.ruff
          esbenp.prettier-vscode
          catppuccin.catppuccin-vsc
          catppuccin.catppuccin-vsc-icons
          github.vscode-github-actions
          hashicorp.terraform
          jnoortheen.nix-ide
          ms-azuretools.vscode-docker
          ms-toolsai.jupyter
          ms-toolsai.jupyter-keymap
          ms-toolsai.jupyter-renderers
          ms-vscode.cmake-tools
          vscodevim.vim
          redhat.vscode-yaml
          njpwerner.autodocstring
          skellock.just
        ];
      };
    };
    networking.firewall.allowedTCPPorts = [ 4200 ];
  };
}
