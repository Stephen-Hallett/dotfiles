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
      (nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
     ];
  };

  fonts.fontconfig.enable = true;
}