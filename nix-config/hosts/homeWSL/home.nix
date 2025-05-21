# Specific config for my home wsl, inherits personal (and subsequently common & core) packages

{ pkgs, ... }: {
  imports = [ ./../personal/home.nix ./../linux/home.nix ];

  home = { packages = with pkgs; [ ]; };
}
