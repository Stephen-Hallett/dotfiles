# Config for packages shared by all machines

{ pkgs, lib, ... }: {
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  nixpkgs = { config = { allowUnfree = true; }; };

  home = {
    stateVersion = "25.05";
    username = builtins.getEnv "USER";
    homeDirectory = builtins.getEnv "HOME";

    packages = with pkgs; [
      git
      home-manager
      wget
      curl
      nerd-fonts.symbols-only
      fd
      sops
    ];
  };

  fonts.fontconfig.enable = true;

  core-packages = {
    ruff.enable = false;
    fzf.enable = true;
    bat.enable = true;
    zsh.enable = true;
    zoxide.enable = true;
    starship.enable = true;
    nixvim.enable = true;
    eza.enable = true;
    git.enable = true;
    ripgrep.enable = true;
    shellfunctions.enable = true;
    open-message.enable = false;
    vscode-config.enable = false;
  };

  unix-packages = { spotify.enable = true; };
}
