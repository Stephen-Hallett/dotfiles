# Specific config for my home wsl, inherits personal (and subsequently common & core) packages

{ pkgs, ... }: {
  imports = [ ./../personal/home.nix ./omarchy.nix ];

  home = { packages = with pkgs; [ cmake ]; };

  unix-packages = {
    spotify.enable = true;
    discord.enable = true;
  };
  common-packages = { tmux.enable = true; };

}
