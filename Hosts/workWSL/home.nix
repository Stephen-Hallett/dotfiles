# Specific config for work WSL, inherits common (and subsequently core) packages

{ pkgs, ... }: {
  imports = [ ./../common/home.nix ];

  home = { packages = with pkgs; [ glibc nfs-utils ]; };
  wsl-packages = { homebrew.enable = true; };

}
