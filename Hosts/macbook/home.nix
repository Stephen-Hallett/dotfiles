# Specific config for my macbook, inherits personal (and subsequently common & core) packages

{ pkgs, ... }: {
  imports = [ ./../personal/home.nix ];

  home = { packages = with pkgs; [ ]; };

  unix-packages = {
    alacritty.enable = true;
    discord.enable = true;
    spotify.enable = true;
  };
}
