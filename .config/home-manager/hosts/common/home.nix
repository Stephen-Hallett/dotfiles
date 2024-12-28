{ pkgs, ... }:
{
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home = {
    stateVersion = "24.11";

    packages = with pkgs; [
      git
      home-manager
      python313
      (nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
     ];
  };

  fonts.fontconfig.enable = true;

  core-packages = {
    ruff.enable = true;
  };
}