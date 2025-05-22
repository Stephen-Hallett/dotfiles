{ pkgs, ... }: {
  nix-homebrew = { user = "stephenhallett"; };

  homebrew = {
    enable = true;
    brews = [ ];
    casks = [
      # ----- General -----
      "postman"
      "orbstack"
      "vlc"
      "rstudio"
      "git-credential-manager"
    ];
    masApps = {
      # "Notability" = 360593530;
    };
  };
}
