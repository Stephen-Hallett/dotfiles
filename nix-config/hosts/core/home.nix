# Config for packages shared by all machines

{ pkgs, lib, ... }: {
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  nixpkgs = { config = { allowUnfree = true; }; };

  home = {
    stateVersion = "24.11";
    username = builtins.getEnv "USER";
    homeDirectory = builtins.getEnv "HOME";

    packages = with pkgs; [
      git
      home-manager
      fantasque-sans-mono
      wget
      curl
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
    ];
  };

  fonts.fontconfig.enable = true;

  core-packages = {
    ruff.enable = true;
    fzf.enable = true;
    bat.enable = true;
    zsh.enable = true;
    zoxide.enable = true;
    starship.enable = true;
    nixvim.enable = true;
    eza.enable = true;
    git.enable = true;
    ripgrep.enable = true;
  };
}
