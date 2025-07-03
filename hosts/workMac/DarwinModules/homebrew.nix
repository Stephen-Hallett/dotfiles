{ pkgs, ... }: {
  nix-homebrew = { user = "stephenhallett"; };

  homebrew = {
    enable = true;
    brews = [ ];
    casks = [
      # ----- General -----
      "vlc"
      "git-credential-manager"
    ];
    masApps = {
      # "Notability" = 360593530;
    };
  };
}
